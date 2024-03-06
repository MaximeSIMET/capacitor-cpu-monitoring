import { WebPlugin } from '@capacitor/core';

import type { CPUMonitoringPlugin } from './definitions';

export class CPUMonitoringWeb extends WebPlugin implements CPUMonitoringPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
