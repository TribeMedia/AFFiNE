import { DEFAULT_SERVICE_VARIANT } from './consts';
import { BasicServiceProvider } from './provider';
import type {
  ServiceFactory,
  ServiceProvider,
  ServiceType,
  ServiceVariant,
} from './types';

export class ServiceCollection {
  services: Map<ServiceType, Map<ServiceVariant, ServiceFactory>> = new Map();

  static get EMPTY() {
    return new ServiceCollection();
  }

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
    return new BasicServiceProvider(this);
  }
}
