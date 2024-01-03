import type { Observable } from 'rxjs';
import { BehaviorSubject } from 'rxjs';

export class LiveData<T = unknown> extends BehaviorSubject<T> {
  static from<T>(observable: Observable<T>, initialValue: T): LiveData<T> {
    const data = new LiveData(initialValue);

    const subscription = observable.subscribe({
      next(value) {
        data.next(value);
      },
      error(err) {
        data.error(err);
      },
      complete() {
        data.complete();
      },
    });
    data.subscribe({
      complete() {
        subscription.unsubscribe();
      },
      error() {
        subscription.unsubscribe();
      },
    });

    return data;
  }
}
