import { combineLatestAll, map, type Observable, of } from 'rxjs';

import type { ServiceCollection, ServiceFactory } from '../di';

export type ConfigurationSchema = {
  onBoarding: boolean;
  dismissWorkspaceGuideModal: boolean;
};
export type ConfigurationKey = keyof ConfigurationSchema;

export type ConfigurationProviderId = 'application';

export enum ConfigurationLevel {
  Application = 1,
}

export class Configuration {
  providers: ConfigurationProvider[] = [];

  constructor(providers: ConfigurationProvider[]) {
    this.providers = providers.sort((a, b) => a.level - b.level);
  }

  get<Key extends ConfigurationKey>(
    key: Key,
    provider?: ConfigurationProviderId
  ): ConfigurationSchema[Key] | null {
    const providers = provider
      ? this.providers.filter(p => p.id === provider)
      : this.providers;
    let finalValue = null;
    for (const provider of providers) {
      finalValue = provider.get(key) ?? finalValue;
    }
    return finalValue;
  }

  watch<Key extends ConfigurationKey>(
    key: Key,
    provider?: ConfigurationProviderId
  ): Observable<ConfigurationSchema[Key] | null> {
    const providers = provider
      ? this.providers.filter(p => p.id === provider)
      : this.providers;
    // get all values from providers
    return of(...providers.map(provider => provider.watch(key))).pipe(
      // combine all values to an array
      combineLatestAll(),
      // get last non-null value, which is the highest priority value
      map(values => {
        let finalValue = null;
        for (const value of values) {
          finalValue = value ?? finalValue;
        }
        return finalValue;
      })
    );
  }
}

export abstract class ConfigurationProvider {
  abstract id: ConfigurationProviderId;
  abstract level: ConfigurationLevel;

  abstract get<Key extends ConfigurationKey>(
    key: Key
  ): ConfigurationSchema[Key] | null;

  abstract watch<Key extends ConfigurationKey>(
    key: Key
  ): Observable<ConfigurationSchema[Key] | null>;

  abstract patch<Key extends ConfigurationKey>(
    key: Key,
    value: ConfigurationSchema[Key] | null
  ): void;
}

export function installConfiguration(services: ServiceCollection) {
  services.add(Configuration, provider => {
    const providers = Array.from(
      provider
        .resolveAll<ConfigurationProvider>('configuration-provider')
        .values()
    );
    return new Configuration(providers);
  });
}

export function installConfigurationProvider(
  services: ServiceCollection,
  id: ConfigurationProviderId,
  factory: ServiceFactory<ConfigurationProvider>
) {
  services.add('configuration-provider', factory, id);
}
