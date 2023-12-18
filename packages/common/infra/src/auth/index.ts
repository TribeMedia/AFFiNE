import { combineLatestAll, map, of } from 'rxjs';

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

export interface AuthenticationProvider {
  /**
   * provider unique id
   */
  id: string;

  /**
   * current authentication session
   */
  session: LiveData<
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
