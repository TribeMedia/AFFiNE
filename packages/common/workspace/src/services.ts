import type { ServiceCollection, ServiceFactory } from '@toeverything/infra';

import type { WorkspaceFactory } from './factory';
import { installWorkspaceList, WorkspaceList } from './list';
import { WorkspaceManager } from './manager';

export function installWorkspaceManager(services: ServiceCollection) {
  installWorkspaceList(services);
  services.add(WorkspaceManager, p => {
    const factories = p.resolveAll('workspace-factory').values();
    const list = p.resolve(WorkspaceList);
    return new WorkspaceManager(list, Array.from(factories));
  });
}

export function installWorkspaceFactory(
  services: ServiceCollection,
  name: string,
  factory: ServiceFactory<WorkspaceFactory>
) {
  services.add('workspace-factory', factory, name);
}
