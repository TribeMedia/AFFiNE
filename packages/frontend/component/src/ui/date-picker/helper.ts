import { debounce } from 'lodash-es';
import { type RefObject, useEffect, useState } from 'react';

interface ResizeObserverOptions {
  debounce?: number;
}
// TODO: extract this to be shared across all components
export const useResizeObserver = (
  ref: RefObject<HTMLElement>,
  options?: ResizeObserverOptions
) => {
  const [dimensions, setDimensions] = useState<DOMRectReadOnly | null>(null);
  const { debounce: d = 0 } = options || {};

  useEffect(() => {
    const element = ref.current;
    if (!element) return;

    const resizeObserver = new ResizeObserver(
      debounce(entries => {
        setDimensions(entries[0].contentRect);
      }, d)
    );

    resizeObserver.observe(element);

    return () => {
      resizeObserver.disconnect();
    };
  }, [d, ref]);

  return dimensions;
};
