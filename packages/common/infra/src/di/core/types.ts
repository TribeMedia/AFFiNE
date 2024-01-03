export type ServiceFactory<T = any> = (provider: ServiceProvider) => T;
export type ServiceVariant = string | symbol;
export type ServiceType = any;

export abstract class ServiceProvider {
  abstract resolveRaw(type: ServiceType, variant?: ServiceVariant): any;
  abstract resolveAllRaw(type: ServiceType): Map<ServiceVariant, any>;

  resolve<T>(type: string | symbol | Type<T>, variant?: ServiceVariant): T {
    return this.resolveRaw(type, variant);
  }

  resolveAll<T = any>(type: string | symbol | Type<T>): Map<ServiceVariant, T> {
    return this.resolveAllRaw(type);
  }
}

// eslint-disable-next-line @typescript-eslint/ban-types
export type Type<T = any> = Function & { prototype: T };
