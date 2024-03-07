package com.maximesimet.capacitor.cpumonitoring;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CPUMonitoring")
public class CPUMonitoringPlugin extends Plugin {

    private CPUMonitoring implementation = new CPUMonitoring();

    @PluginMethod
    public void getInfo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.getInfo());
        call.resolve(ret);
    }
}
