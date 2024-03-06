export interface CPUMonitoringPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
