import type { Meta, StoryFn } from '@storybook/react';
import dayjs from 'dayjs';
import { useState } from 'react';

import { AFFiNEDatePicker } from '.';

export default {
  title: 'UI/Date Picker/Date Picker',
} satisfies Meta<typeof AFFiNEDatePicker>;

const _format = 'YYYY-MM-DD';

export const Basic: StoryFn<typeof AFFiNEDatePicker> = props => {
  const [date, setDate] = useState(dayjs().format(_format));
  return (
    <div style={{ minHeight: 400 }}>
      <AFFiNEDatePicker
        value={date}
        {...props}
        onChange={e => {
          setDate(dayjs(e, _format).format(_format));
        }}
      />
    </div>
  );
};

Basic.args = {};
