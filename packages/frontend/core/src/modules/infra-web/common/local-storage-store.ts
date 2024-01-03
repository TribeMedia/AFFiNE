import { Store } from '@toeverything/infra';
import { Observable } from 'rxjs';

export class LocalStorageStore extends Store {
  constructor(readonly prefix: string) {
    super();
  }
  override get<T>(key: string): T | null {
    const json = localStorage.getItem(this.prefix + key);
    return json ? JSON.parse(json) : null;
  }
  override watch<T>(key: string): Observable<T | null> {
    return new Observable<T | null>(subscriber => {
      const json = localStorage.getItem(this.prefix + key);
      const first = json ? JSON.parse(json) : null;
      subscriber.next(first);

      const channel = new BroadcastChannel(this.prefix + key);
      channel.addEventListener('message', event => {
        subscriber.next(event.data);
      });
      return () => {
        channel.close();
      };
    });
  }
  override set<T>(key: string, value: T | null): void {
    localStorage.setItem(this.prefix + key, JSON.stringify(value));
    const channel = new BroadcastChannel(this.prefix + key);
    channel.postMessage(value);
    channel.close();
  }
}
