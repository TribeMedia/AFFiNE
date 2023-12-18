import type { LiveData } from '../livedata';

export abstract class Store {
  abstract get<T>(key: string): LiveData<T | null>;
  abstract set<T>(key: string, value: T | null): void;
}

export abstract class GlobalStateStore extends Store {}

export abstract class CacheStore extends Store {}
