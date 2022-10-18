import Flutter
import UIKit

public class SwiftSharePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "share_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftSharePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard call.method == "shareMethod" else {
            result(FlutterMethodNotImplemented)
            return
        }
            let arguments = call.arguments as! [String: Any]
            let message = arguments["message"] as! String
            let name = arguments["name"] as! String
            shareMethod(message, name)
            result(nil)
        
    }
    
    private func shareMethod(_ message: String,_ name: String) {
        let controller = UIActivityViewController(activityItems:[message, name], applicationActivities: nil)
        let viewController = UIApplication.shared.keyWindow!.rootViewController
        viewController?.present(controller,animated: true)
    }
}
