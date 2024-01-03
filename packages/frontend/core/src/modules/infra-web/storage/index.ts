import type { ServiceCollection } from '@toeverything/infra';
import { CacheStore, GlobalStateStore } from '@toeverything/infra';
import type { Observable } from 'rxjs';

import { LocalStorageStore } from '../common/local-storage-store';

export class LocalStorageCacheStore extends CacheStore {
  private readonly store = new LocalStorageStore('cache:');
  override get<T>(key: string): T | null {
    return this.store.get(key);
  }
  override watch<T>(key: string): Observable<T | null> {
    return this.store.watch(key);
  }
  override set<T>(key: string, value: T | null): void {
    this.store.set(key, value);
  }
}

export class LocalStorageGlobalStateStore extends GlobalStateStore {
  private readonly store = new LocalStorageStore('global-state:');
  override get<T>(key: string): T | null {
    return this.store.get(key);
  }
  override watch<T>(key: string): Observable<T | null> {
    return this.store.watch(key);
  }
  override set<T>(key: string, value: T | null): void {
    this.store.set(key, value);
  }
}

export function installLocalStorageCacheStore(services: ServiceCollection) {
  services.add(CacheStore, () => new LocalStorageCacheStore());
}

export function installLocalStorageGlobalStateStore(
  services: ServiceCollection
) {
  services.add(GlobalStateStore, () => new LocalStorageGlobalStateStore());
}
