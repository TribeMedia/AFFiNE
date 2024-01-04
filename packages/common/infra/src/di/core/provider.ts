import type { ServiceCollection } from './collection';
import { DEFAULT_SERVICE_VARIANT } from './consts';
import {
  CircularDependencyError,
  MissingDependencyError,
  RecursionLimitError,
  ServiceNotFoundError,
} from './error';
import {
  ServiceProvider,
  type ServiceType,
  type ServiceVariant,
} from './types';

export class ServiceCachePool {
  cache: Map<ServiceType, Map<ServiceVariant, any>> = new Map();

  getOrInsert(type: ServiceType, variant: ServiceVariant, insert: () => any) {
    const cache = this.cache.get(type) ?? new Map();
    if (!cache.has(variant)) {
      cache.set(variant, insert());
    }
    const cached = cache.get(variant);
    this.cache.set(type, cache);
    return cached;
  }
}

export class ServiceResolver extends ServiceProvider {
  constructor(
    public readonly provider: BasicServiceProvider,
    public readonly depth = 0,
    public readonly stack: [ServiceType, ServiceVariant][] = []
  ) {
    super();
  }

  resolveRaw(type: ServiceType, variant = DEFAULT_SERVICE_VARIANT) {
    const nextResolver = this.track(type, variant);

    return this.provider.cache.getOrInsert(type, variant, () => {
      const factory = this.provider.collection.services.get(type)?.get(variant);
      if (!factory) {
        throw new ServiceNotFoundError(type, variant);
      }
      try {
        return factory(nextResolver);
      } catch (err) {
        if (err instanceof ServiceNotFoundError) {
          throw new MissingDependencyError(
            { type, variant },
            { type: err.type, variant: err.variant }
          );
        }
        throw err;
      }
    });
  }

  resolveAllRaw(type: ServiceType): Map<ServiceVariant, any> {
    const vars = this.provider.collection.services.get(type);

    if (vars === undefined) {
      return new Map();
    }

    const result = new Map<ServiceVariant, any>();

    for (const [variant, factory] of vars) {
      const service = this.provider.cache.getOrInsert(type, variant, () => {
        const nextResolver = this.track(type, variant);
        try {
          return factory(nextResolver);
        } catch (err) {
          if (err instanceof ServiceNotFoundError) {
            throw new MissingDependencyError(
              { type, variant },
              { type: err.type, variant: err.variant }
            );
          }
          throw err;
        }
      });
      result.set(variant, service);
    }

    return result;
  }

  track(type: ServiceType, variant: ServiceVariant): ServiceResolver {
    const depth = this.depth + 1;
    if (depth >= 100) {
      throw new RecursionLimitError();
    }
    const circular = this.stack.find(([t, v]) => t === type && v === variant);
    if (circular) {
      throw new CircularDependencyError([...this.stack, [type, variant]]);
    }

    return new ServiceResolver(this.provider, depth, [
      ...this.stack,
      [type, variant],
    ]);
  }
}

export class BasicServiceProvider extends ServiceProvider {
  public readonly cache = new ServiceCachePool();

  constructor(public readonly collection: ServiceCollection) {
    super();
  }

  resolveRaw(type: ServiceType, variant?: ServiceVariant | undefined) {
    const resolver = new ServiceResolver(this);
    return resolver.resolveRaw(type, variant);
  }

  resolveAllRaw(type: ServiceType): Map<ServiceVariant, any> {
    const resolver = new ServiceResolver(this);
    return resolver.resolveAllRaw(type);
  }
}

export class RawChildServiceProviderImpl extends ServiceProvider {
  override resolveRaw(type: any, variant?: ServiceVariant | undefined) {
    throw new Error('Method not implemented.');
  }
  override resolveAllRaw(type: any): Map<ServiceVariant, any> {
    throw new Error('Method not implemented.');
  }
}
