import Foundation

class CustomError: Error {
    var code: PluginError
    var message: String
    var error: Error?
    
    init(_ code: PluginError, _ message: String = "", _ error: Error? = nil) {
        self.code = code
        self.message = message
        self.error = error
    }
}

enum PluginError: String, Error  {
    case
        TECHNICAL_ERROR
}
