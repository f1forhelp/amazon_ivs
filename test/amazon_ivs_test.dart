import 'package:flutter_test/flutter_test.dart';
import 'package:amazon_ivs/amazon_ivs.dart';
import 'package:amazon_ivs/amazon_ivs_platform_interface.dart';
import 'package:amazon_ivs/amazon_ivs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAmazonIvsPlatform
    with MockPlatformInterfaceMixin
    implements AmazonIvsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AmazonIvsPlatform initialPlatform = AmazonIvsPlatform.instance;

  test('$MethodChannelAmazonIvs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAmazonIvs>());
  });

  test('getPlatformVersion', () async {
    AmazonIvs amazonIvsPlugin = AmazonIvs();
    MockAmazonIvsPlatform fakePlatform = MockAmazonIvsPlatform();
    AmazonIvsPlatform.instance = fakePlatform;

    expect(await amazonIvsPlugin.getPlatformVersion(), '42');
  });
}
