import { WebPlugin } from '@capacitor/core';
import type { CPUMonitoringPlugin } from './definitions';
import { CPULoadState } from './definitions';

export class CPUMonitoringWeb extends WebPlugin implements CPUMonitoringPlugin {
  async getLoad(): Promise<CPULoadState> {
    throw this.unimplemented('Not implemented on web.');
  }

  setLoadRefreshTime(): void {
    throw this.unimplemented('Not implemented on web.');
  }
}
