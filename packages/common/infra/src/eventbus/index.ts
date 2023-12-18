import type { ServiceCollection, ServiceFactory } from '../di';

export class EventBus {
  listeners: Map<string, Set<(...args: any[]) => void>> = new Map();

  on(event: string, listener: (...args: any[]) => void) {
    const listeners = this.listeners.get(event) ?? new Set();
    listeners.add(listener);
    this.listeners.set(event, listeners);
  }

  emit(event: string, ...args: any[]) {
    const listeners = this.listeners.get(event);
    if (listeners) {
      listeners.forEach(listener => listener(...args));
    }
  }
}

export function installEventBus(services: ServiceCollection) {
  services.add(EventBus, provider => {
    const bus = new EventBus();
    for (const { event, callback } of provider
      .resolveAll('event-handler')
      .values()) {
      bus.on(event, callback);
    }
    return bus;
  });
}

export function installEventHandler(
  eventName: string,
  handlerName: string,
  handlerFactory: ServiceFactory<(...args: any[]) => void>
) {
  return (services: ServiceCollection) => {
    services.add(
      'event-handler',
      provider => ({ event: eventName, callback: handlerFactory(provider) }),
      `${eventName}:${handlerName}`
    );
  };
}
