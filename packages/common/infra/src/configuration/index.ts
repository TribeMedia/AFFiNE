import { combineLatestAll, map, of } from 'rxjs';

import type { ServiceCollection, ServiceFactory } from '../di';
import { LazyLiveData, type LiveData } from '../livedata';

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

  get(
    key: ConfigurationKey,
    provider?: ConfigurationProviderId
  ): LiveData<ConfigurationSchema[typeof key] | null> {
    const providers = provider
      ? this.providers.filter(p => p.id === provider)
      : this.providers;
    return new LazyLiveData(
      null,
      // get all values from providers
      of(...providers.map(provider => provider.get(key))).pipe(
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
      )
    );
  }
}

export interface ConfigurationProvider {
  id: ConfigurationProviderId;
  level: ConfigurationLevel;

  get<Key extends ConfigurationKey>(
    key: ConfigurationKey
  ): LiveData<ConfigurationSchema[Key] | null>;

  patch<Key extends ConfigurationKey>(
    key: ConfigurationKey,
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
