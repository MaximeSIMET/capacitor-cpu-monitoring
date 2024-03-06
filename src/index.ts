import { registerPlugin } from '@capacitor/core';

import type { CPUMonitoringPlugin } from './definitions';

const CPUMonitoring = registerPlugin<CPUMonitoringPlugin>('CPUMonitoring', {
  web: () => import('./web').then(m => new m.CPUMonitoringWeb()),
});

export * from './definitions';
export { CPUMonitoring };
