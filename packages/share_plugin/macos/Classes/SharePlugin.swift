import Cocoa
import FlutterMacOS

public class SharePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "share_plugin", binaryMessenger: registrar.messenger)
    let instance = SharePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "shareMethod":
      let arguments = call.arguments as! [String: Any]
      let message = arguments["message"] as! String
      shareMethod(message)
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func shareMethod(_ message: String) {
      let picker = NSSharingServicePicker(items: [message])
         if let view = NSApplication.shared.keyWindow?.contentViewController?.view {
            let rect = NSRect(x: view.bounds.maxX - 120, y: view.bounds.maxY - 20, width: 0, height: 0)
               picker.show(relativeTo: rect, of: view, preferredEdge: .maxX)
         }
      }
}
