import type { ServiceCollection } from '@toeverything/infra';
import { LiveData } from '@toeverything/infra';
import {
  AuthenticationProvider,
  type AuthenticationSession,
  installAuthenticationProvider,
} from '@toeverything/infra';

export class NextAuthAuthenticationProvider extends AuthenticationProvider {
  override id: string;
  override session = new LiveData<
    | { status: 'unauthenticated' }
    | { status: 'loading' }
    | { status: 'authenticated'; session: AuthenticationSession }
  >({ status: 'loading' });
}

export function installNextAuthAuthenticationProvider(
  services: ServiceCollection
) {
  installAuthenticationProvider(services, 'next-auth', () => {
    return new NextAuthAuthenticationProvider();
  });
}
