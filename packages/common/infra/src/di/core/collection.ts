import { DEFAULT_SERVICE_VARIANT } from './consts';
import { createServiceProvider } from './provider';
import { RawServiceProviderImpl } from './raw-provider';
import type {
  ServiceFactory,
  ServiceProvider,
  ServiceType,
  ServiceVariant,
} from './types';

export class ServiceCollection {
  services: Map<ServiceType, Map<ServiceVariant, ServiceFactory>> = new Map();

  add(
    type: ServiceType,
    factory: ServiceFactory,
    variant = DEFAULT_SERVICE_VARIANT
  ) {
    const services = this.services.get(type) ?? new Map();
    services.set(variant, factory);
    this.services.set(type, services);
  }

  provider(): ServiceProvider {
    return createServiceProvider(new RawServiceProviderImpl(this));
  }
}
