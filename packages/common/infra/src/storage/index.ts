import type { Observable } from 'rxjs';

export abstract class Store {
  abstract get<T>(key: string): T | null;
  abstract watch<T>(key: string): Observable<T | null>;
  abstract set<T>(key: string, value: T | null): void;
}

export abstract class GlobalStateStore extends Store {}

export abstract class CacheStore extends Store {}
