import type { Meta, StoryFn } from '@storybook/react';
import { useState } from 'react';

import { ResizePanel } from '../resize-panel/resize-panel';
import { InlineEdit } from './inline-edit';

export default {
  title: 'UI/Editable/Inline Edit',
  component: InlineEdit,
} satisfies Meta<typeof InlineEdit>;

const Template: StoryFn<typeof InlineEdit> = args => {
  const [value, setValue] = useState(args.value || '');
  return (
    <div style={{ marginBottom: 40 }}>
      <div style={{ marginBottom: 20 }}>
        <div style={{ marginBottom: 10 }}>
          <span>
            <b>Value: </b>
          </span>
          <span
            style={{
              padding: '2px 4px',
              backgroundColor: 'rgba(100, 100, 100, 0.1)',
            }}
          >
            {value}
          </span>
        </div>
      </div>

      <ResizePanel
        width={600}
        height={36}
        minHeight={36}
        minWidth={200}
        maxWidth={1400}
        horizontal={true}
        vertical={false}
        style={{ display: 'flex', alignItems: 'center' }}
      >
        <InlineEdit
          style={{ maxWidth: '100%' }}
          value={value}
          onChange={v => setValue(v)}
          {...args}
        />
      </ResizePanel>
    </div>
  );
};

export const Basic: StoryFn<typeof InlineEdit> = Template.bind(undefined);
Basic.args = {
  editable: true,
  placeholder: 'Untitled',
  trigger: 'doubleClick',
  autoSelect: true,
};

export const CustomizeText: StoryFn<typeof InlineEdit> =
  Template.bind(undefined);
CustomizeText.args = {
  value: 'Customize Text',
  editable: true,
  placeholder: 'Untitled',
  style: {
    fontSize: 20,
    fontWeight: 500,
    padding: '10px 20px',
  },
};
