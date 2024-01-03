import { installWorkspaceManager } from '@affine/workspace/services';
import { ServiceCollection } from '@toeverything/infra/di';
import { installInfra } from '@toeverything/infra/index';

import { installNextAuthAuthenticationProvider } from './modules/auth';
import { installLocalStorageApplicationConfigurationProvider } from './modules/configuration';
import {
  installLocalStorageCacheStore,
  installLocalStorageGlobalStateStore,
} from './modules/storage';

export function createWebServices() {
  const services = new ServiceCollection();

  installInfra(services);

  installLocalStorageApplicationConfigurationProvider(services);
  installLocalStorageCacheStore(services);
  installLocalStorageGlobalStateStore(services);
  installNextAuthAuthenticationProvider(services);

  installWorkspaceManager(services);
  return services;
}
