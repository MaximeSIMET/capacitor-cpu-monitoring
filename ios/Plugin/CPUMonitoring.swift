import Foundation
import Capacitor

@objc public class CPUMonitoring: CAPPlugin {
    var REFRESH_TIME: Int = 1000
    
    public func startLoadLoop() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(REFRESH_TIME)) {
            do {
                NotificationCenter.default.post(
                    name: Notification.Name("CPULoad"),
                    object: nil,
                    userInfo: ["load":  try self.getLoad()]
                )
                
                self.startLoadLoop()
            } catch { }
        }
    }
    
    public func getLoad() throws -> Double {
        var previousIdleTime: UInt64 = 0
        var previousTotalTime: UInt64 = 0
        var cpuLoadInfo = processor_info_array_t(bitPattern: 0)
        var cpuLoadInfoCount = mach_msg_type_number_t(0)
        var numCpuInfo = mach_msg_type_number_t(0)

        let result = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &numCpuInfo, &cpuLoadInfo, &cpuLoadInfoCount)

        if result != KERN_SUCCESS {
            throw CustomError(PluginError.TECHNICAL_ERROR, "Couldn't get the CPU load")
        }
        
       let cpuLoad = cpuLoadInfo!.withMemoryRebound(to: processor_cpu_load_info.self, capacity: Int(numCpuInfo)) {
           return $0
       }
       
       var totalTicks: UInt64 = 0
       var idleTicks: UInt64 = 0
       
       for i in 0..<Int(numCpuInfo) {
           totalTicks += UInt64(cpuLoad[i].cpu_ticks.0 + cpuLoad[i].cpu_ticks.1 + cpuLoad[i].cpu_ticks.2 + cpuLoad[i].cpu_ticks.3)
           idleTicks += UInt64(cpuLoad[i].cpu_ticks.1)
       }
       
       let totalTicksDelta = Double(totalTicks - previousTotalTime)
       let idleTicksDelta = Double(idleTicks - previousIdleTime)
       let usage = (totalTicksDelta - idleTicksDelta) / totalTicksDelta * 100.0
       

       
       previousIdleTime = idleTicks
       previousTotalTime = totalTicks
       
       return (usage * 100).rounded() / 100
    }
    
    @objc public func setLoadRefreshTime(_ intervalMillis: Int) -> Void {
        self.REFRESH_TIME = intervalMillis
    }
}
