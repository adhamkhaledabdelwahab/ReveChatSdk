import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reve_chat_sdk/reve_chat_sdk_method_channel.dart';
import 'package:reve_chat_sdk/user_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelReveChatSdk platform = MethodChannelReveChatSdk();
  const MethodChannel channel = MethodChannel('reve_chat_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case "initReveChat":
            return 'Reve chat initialized successfully';
          case "setReveChatVisitorInfo":
            return 'Reve chat visitor info set up successfully';
          case "setReveChatDeviceToken":
            return 'Reve chat device toke id set up successfully';
          case "gotoReveChat":
            return 'Navigating to Reve chat screen';
          default:
            return "";
        }
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('initReveChat', () async {
    expect(
      await platform.initReveChat("accountId"),
      'Reve chat initialized successfully',
    );
  });

  test('setReveChatVisitorInfo', () async {
    expect(
      await platform.setReveChatVisitorInfo(
        UserModel(
          name: "name",
          email: "email",
          phoneNumber: "phoneNumber",
        ),
      ),
      'Reve chat visitor info set up successfully',
    );
  });

  test('setReveChatDeviceToken', () async {
    expect(
      await platform.setReveChatDeviceToken("deviceToken"),
      'Reve chat device toke id set up successfully',
    );
  });

  test('gotoReveChat', () async {
    expect(
      await platform.gotoReveChat(),
      "Navigating to Reve chat screen",
    );
  });
}
