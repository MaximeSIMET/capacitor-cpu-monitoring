import { PluginListenerHandle } from '@capacitor/core';

export interface CPULoadState {
  load: number;
}

export enum CPULoadEvents {
  CPULoad = 'CPULoad'
}

export interface CPUMonitoringPlugin {
  addListener(eventName: string, listenerFunc: (...args: any) => void): Promise<PluginListenerHandle> & PluginListenerHandle;
  getLoad(): Promise<CPULoadState>;
  setLoadRefreshTime(options: { interval: number}): void; // Default value is 1000
}
