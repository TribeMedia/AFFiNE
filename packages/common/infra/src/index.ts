export * from './app-config-storage';
export * from './atom';
export * from './auth';
export * from './blocksuite';
export * from './command';
export * from './configuration';
export * from './di';
export * from './eventbus';
export * from './livedata';
export * from './storage';

import { installAuthenticationManager } from './auth';
import { installConfiguration } from './configuration';
import type { ServiceCollection } from './di';
import { installEventBus } from './eventbus';

export function installInfra(services: ServiceCollection) {
  installEventBus(services);
  installConfiguration(services);
  installAuthenticationManager(services);
}
