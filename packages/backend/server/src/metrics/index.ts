import { Global, Module, OnModuleDestroy, OnModuleInit } from '@nestjs/common';

import { start, stop } from './opentelemetry';

@Global()
@Module({})
export class MetricsModule implements OnModuleInit, OnModuleDestroy {
  onModuleInit() {
    start();
  }

  async onModuleDestroy() {
    await stop();
  }
}

export * from './metrics';
export * from './utils';
