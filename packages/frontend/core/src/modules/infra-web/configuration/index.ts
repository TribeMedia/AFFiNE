import {
  ConfigurationLevel,
  type ServiceCollection,
} from '@toeverything/infra';
import {
  ConfigurationProvider,
  type ConfigurationSchema,
  installConfigurationProvider,
} from '@toeverything/infra';
import type { Observable } from 'rxjs';

import { LocalStorageStore } from '../common/local-storage-store';

export class LocalStorageApplicationConfigurationProvider extends ConfigurationProvider {
  private readonly store = new LocalStorageStore('application-configuration:');

  override id = 'application' as const;

  override level = ConfigurationLevel.Application;

  override get<Key extends keyof ConfigurationSchema>(
    key: Key
  ): ConfigurationSchema[Key] | null {
    return this.store.get(key);
  }

  override watch<Key extends keyof ConfigurationSchema>(
    key: Key
  ): Observable<ConfigurationSchema[Key] | null> {
    return this.store.watch(key);
  }

  override patch<Key extends keyof ConfigurationSchema>(
    key: Key,
    value: ConfigurationSchema[Key] | null
  ): void {
    this.store.set(key, value);
  }
}

export function installLocalStorageApplicationConfigurationProvider(
  services: ServiceCollection
) {
  installConfigurationProvider(services, 'application', () => {
    return new LocalStorageApplicationConfigurationProvider();
  });
}
