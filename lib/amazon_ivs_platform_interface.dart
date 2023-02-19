import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'amazon_ivs_method_channel.dart';

abstract class AmazonIvsPlatform extends PlatformInterface {
  /// Constructs a AmazonIvsPlatform.
  AmazonIvsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AmazonIvsPlatform _instance = MethodChannelAmazonIvs();

  /// The default instance of [AmazonIvsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAmazonIvs].
  static AmazonIvsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AmazonIvsPlatform] when
  /// they register themselves.
  static set instance(AmazonIvsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
