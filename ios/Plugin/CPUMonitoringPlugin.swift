import Foundation
import Capacitor

@objc(CPUMonitoringPlugin)
public class CPUMonitoringPlugin: CAPPlugin {
    private let implementation = CPUMonitoring()
    
    @objc override public func load() {
        implementation.startLoadLoop()
        self.initEvents()
    }

    @objc func getLoad(_ call: CAPPluginCall) {
        do {
            call.resolve(["load": try implementation.getLoad()])
        } catch {
            call.reject((error as! CustomError).message,
                            (error as! CustomError).code.rawValue,
                            (error as! CustomError).error)
        }
    }
    
    @objc func setLoadRefreshTime(_ call: CAPPluginCall) {
        guard let interval = call.getInt("interval") else {
            return call.reject("setLoadRefreshTime:: intervalMillis not provided")
        }
        
        implementation.setLoadRefreshTime(interval)
        call.resolve()
    }
    
    private func initEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.notifyCustomListeners(notification:)), name: Notification.Name("CPULoad"), object: nil)
    }
    
    @objc private func notifyCustomListeners(notification: Notification) {
        self.notifyListeners(notification.name.rawValue, data: notification.userInfo as? [String: Any])
    }
}
