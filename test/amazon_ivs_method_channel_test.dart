import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amazon_ivs/amazon_ivs_method_channel.dart';

void main() {
  MethodChannelAmazonIvs platform = MethodChannelAmazonIvs();
  const MethodChannel channel = MethodChannel('amazon_ivs');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
