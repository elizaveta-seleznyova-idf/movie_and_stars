import Flutter
import UIKit

public class SwiftSharePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "share_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftSharePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
         if (call.method == "shareMethod") {
              let arguments = call.arguments as! [String: Any]
              let message = arguments["message"] as! String
              shareMethod(message)
              result(nil)
          } else {
            result(FlutterMethodNotImplemented)
          }

  }

  private func shareMethod(_ message: String) {
         let controller = UIActivityViewController(activityItems:[message], applicationActivities: nil)
         let viewController = UIApplication.shared.keyWindow!.rootViewController
         viewController?.present(controller,animated: true)
       }
}
