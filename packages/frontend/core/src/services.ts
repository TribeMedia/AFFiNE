import { ServiceCollection, type Type } from '@toeverything/infra';
import React, { useContext } from 'react';

const ServiceProviderContext = React.createContext(
  ServiceCollection.EMPTY.provider()
);

export const ServiceProvider = ServiceProviderContext.Provider;

export function useService<T>(
  type: string | symbol | Type<T>,
  variant = 'default'
): T {
  const serviceProvider = useContext(ServiceProviderContext);

  return serviceProvider.resolve(type, variant);
}
