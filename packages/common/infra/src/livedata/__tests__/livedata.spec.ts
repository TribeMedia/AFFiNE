import { map, of } from 'rxjs';
import { describe, expect, test } from 'vitest';

import { LiveData } from '..';

describe('livedata', () => {
  test('LiveData', async () => {
    const livedata = new LiveData(0);
    expect(livedata.value).toBe(0);
    livedata.next(1);
    expect(livedata.value).toBe(1);
    livedata.subscribe(v => {
      expect(v).toBe(32);
    });
    livedata.next(2);
    expect(livedata.value).toBe(2);
  });

  test('from', async () => {
    {
      const livedata = LiveData.from(of(1, 2, 3, 4), 0);
      expect(livedata.value).toBe(4);
    }
    {
      const livedata1 = new LiveData(1);
      const livedata2 = LiveData.from(livedata1.pipe(map(v => 'live' + v)), '');
      expect(livedata2.value).toBe('live1');
      livedata1.next(2);
      expect(livedata2.value).toBe('live2');
    }
  });
});
