import type { CacheStore } from '@toeverything/infra';

import { type WorkspaceMetadata } from '../metadata';

const CACHE_STORAGE_KEY = 'jotai-workspaces';

export function readWorkspaceListCache(cache: CacheStore) {
  const metadata = cache.get(CACHE_STORAGE_KEY).value;
  if (metadata) {
    try {
      const items = metadata as WorkspaceMetadata[];
      return [...items];
    } catch (e) {
      console.error('cannot parse worksapce', e);
    }
    return [];
  }
  return [];
}

export function writeWorkspaceListCache(
  cache: CacheStore,
  metadata: WorkspaceMetadata[]
) {
  cache.set(CACHE_STORAGE_KEY, metadata);
}
