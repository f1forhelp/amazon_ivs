import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'amazon_ivs_platform_interface.dart';

/// An implementation of [AmazonIvsPlatform] that uses method channels.
class MethodChannelAmazonIvs extends AmazonIvsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('amazon_ivs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
