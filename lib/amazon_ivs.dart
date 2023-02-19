
import 'amazon_ivs_platform_interface.dart';

class AmazonIvs {
  Future<String?> getPlatformVersion() {
    return AmazonIvsPlatform.instance.getPlatformVersion();
  }
}
