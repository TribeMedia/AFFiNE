import type { Connectable, Subscriber, Subscription } from 'rxjs';
import {
  BehaviorSubject,
  catchError,
  connectable,
  EMPTY,
  map,
  Observable,
} from 'rxjs';

export class LiveData<T = unknown> extends BehaviorSubject<T> {
  static from<T>(observable: Observable<T>, initialValue: T): LiveData<T> {
    const data = new LiveData(initialValue);

    observable.subscribe({
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

    return data;
  }
}

export class LazyLiveData<T = unknown> extends LiveData<T> {
  private readonly lazy: Connectable<T>;
  private disconnect: Subscription | null = null;

  constructor(initialValue: T, lazy: Observable<T>) {
    super(initialValue);
    this.lazy = connectable(
      lazy.pipe(
        map(v => {
          this.next(v);
          return v;
        }),
        catchError(err => {
          this.error(err);
          return EMPTY;
        })
      )
    );
    new Observable(subscriber => {
      // @ts-expect-error hack to access rxjs private method
      return super._subscribe(subscriber) as Subscription;
    }).subscribe({
      complete: () => {
        this.disconnect?.unsubscribe();
      },
      error: () => {
        this.disconnect?.unsubscribe();
      },
    });
  }

  protected _subscribe(subscriber: Subscriber<T>): Subscription {
    // @ts-expect-error hack to access rxjs private method
    const subscription = super._subscribe(subscriber) as Subscription;
    this.disconnect = this.lazy.connect();

    return subscription;
  }

  override get value(): T {
    this.disconnect = this.lazy.connect();
    return super.value;
  }

  override getValue(): T {
    this.disconnect = this.lazy.connect();
    return super.getValue();
  }
}
