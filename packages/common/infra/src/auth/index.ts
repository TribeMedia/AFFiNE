import { combineLatestAll, map, of } from 'rxjs';

import type { ServiceCollection, ServiceFactory } from '../di';
import type { LiveData } from '../livedata';
import { LazyLiveData } from '../livedata';

export class AuthenticationManager {
  readonly authenticationProviders: Map<string, AuthenticationProvider> =
    new Map();

  constructor(providers: AuthenticationProvider[]) {
    for (const provider of providers) {
      this.authenticationProviders.set(provider.id, provider);
    }
  }

  sessions = new LazyLiveData(
    [],
    of(...this.authenticationProviders.values()).pipe(
      map(provider => provider.session),
      combineLatestAll()
    )
  );
}

export abstract class AuthenticationProvider {
  /**
   * provider unique id
   */
  abstract id: string;

  /**
   * current authentication session
   */
  abstract session: LiveData<
    | { status: 'unauthenticated' }
    | { status: 'loading' }
    | { status: 'authenticated'; session: AuthenticationSession }
  >;
}

export interface AuthenticationSession {
  accessToken: string;
  account: AuthenticationAccountInformation;
}

export interface AuthenticationAccountInformation {
  id: string;
  label: string;
  avatar?: string | null;
}

export function installAuthenticationManager(services: ServiceCollection) {
  services.add(
    AuthenticationManager,
    p =>
      new AuthenticationManager(
        Array.from(p.resolveAll(AuthenticationProvider).values())
      )
  );
}

export function installAuthenticationProvider(
  services: ServiceCollection,
  name: string,
  provider: ServiceFactory<AuthenticationProvider>
) {
  services.add(AuthenticationProvider, provider, name);
}
