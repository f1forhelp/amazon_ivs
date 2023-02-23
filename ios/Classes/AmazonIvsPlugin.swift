import Flutter
import UIKit
import AVKit
import AmazonIVSPlayer

public class AmazonIvsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "amazon_ivs", binaryMessenger: registrar.messenger())
        let instance = AmazonIvsPlugin()
            
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        
        registrar.register(factory, withId: "f1forhelp/amazon_ivs")
        registrar.addMethodCallDelegate(instance, channel: channel)
    
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}


class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FlutterIvsPlayerView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}
