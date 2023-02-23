import Flutter
import UIKit
import AVKit
import AmazonIVSPlayer

public class AmazonIvsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "amazon_ivs", binaryMessenger: registrar.messenger())
        let instance = AmazonIvsPlugin()
            
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        
        registrar.register(factory, withId: "test_p")
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
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
//    private var _nativeWebView: UIWebView
    private var _ivsPlayerView: IVSPlayerView
//    private var _methodChannel: FlutterMethodChannel
    
    func view() -> UIView {
        playVideo(url: URL(string: "https://video-weaver.del01.hls.live-video.net/v1/playlist/Cp4F0S4UbsG5gqWVgbR5D3Z3uiVUarEgMlRGPaCMOKwlO9YJWoyUAFKcEG8JcdT6Mowod5c98Trf6aNqXoxCdivPs8fhgYEQ4ONdmPuVbdDmACQsYR4s_PSiOVTKxk__HjLhJlZ2jdOF4js3Xg01hqI-X40TLMo8T5xJGMfeQbs1lbXMNoqDNwQP7xhHfpvBW_0Kn86FTOKW6iYBi9ceIiiAkN3zVhe2owDZ4Q13dgFTZQd5nL50DGgnL_SvgFnJ_LadesKyzG8yqvwQqOcWxN2bvzZCZp3-qC8OLZy_lUsZCbzOKoxiMFvHk_6XSAQpY2KsZS0ivvnK6wNM5UyDFXabQlJDNYlixme3a2bFkqJQRBm4CV-Z_fgPHjiuuKg5MgFjU0088X75Ek-AgcGaZk2WVRMN4d0jnTrFTJ7YmnM23as3N_XakuxJsffU88Ge6KrVZ9p9avgGYEdhoneHZ1erMm7hFQIFSr5noWsDOIYvh5l99q6KH7fPCXIO--S4aqvrgu-ADBFzIOACvwoyMbt1QCRp0UleQc0QQd6DfvukrYJHdFvVXRpl64Pp7Uy6YTTANilt47k2dV_UUK9tohwwbGd5ywveEtxZxCwrT4JuILK_FKwTu3TpL4fqYkVapZnsgEwwfFfZOqhWTBOKuvqtCNt-O_hpI5KHyUWgLKhyS_N_ipkE4mPgYP5_2dHLS-LT1lcnhyoerdb9iJraFKejornsxvF6_pQHIyE89xgI0Tdc3exr_-5Z-fVaVx-pllw6ml3TWhQX62nI3QfcpFaR55O31CGus038EYwl6AgOzyfDiTKGHS5blFjSKdiUAF2jRViGSWKF1p1XD2IOtR4ZqS95Aai5v7w1d6fMFAfoSv5IR8UQov-R9fo0EPQqzRoMSjc6QESGV37lkirnIAEqCXVzLWVhc3QtMjD2BQ.m3u8")!)

        return _ivsPlayerView
    }
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger
    ) {
        _ivsPlayerView = IVSPlayerView()
        super.init()
    }
    
    
    func playVideo(url videoURL: URL) {
            let player = IVSPlayer()
            player.delegate = self
        _ivsPlayerView.player = player
            player.load(videoURL)
    }
}


extension FLNativeView: IVSPlayer.Delegate {
    func player(_ player: IVSPlayer, didChangeState state: IVSPlayer.State) {
        if state == .ready {
            player.play()
        }
    }
}
