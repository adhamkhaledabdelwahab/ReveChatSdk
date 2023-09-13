import 'package:flutter_test/flutter_test.dart';
import 'package:reve_chat_sdk/reve_chat_sdk.dart';
import 'package:reve_chat_sdk/reve_chat_sdk_platform_interface.dart';
import 'package:reve_chat_sdk/reve_chat_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:reve_chat_sdk/user_model.dart';

class MockReveChatSdkPlatform
    with MockPlatformInterfaceMixin
    implements ReveChatSdkPlatform {
  @override
  Future<String?> gotoReveChat() => Future.value(
        "Navigating to Reve chat screen",
      );

  @override
  Future<String?> initReveChat(String accountId) => Future.value(
        'Reve chat initialized successfully',
      );

  @override
  Future<String?> setReveChatDeviceToken(String deviceToken) => Future.value(
        'Reve chat device toke id set up successfully',
      );

  @override
  Future<String?> setReveChatVisitorInfo(UserModel userModel) => Future.value(
        'Reve chat visitor info set up successfully',
      );
}

void main() {
  final ReveChatSdkPlatform initialPlatform = ReveChatSdkPlatform.instance;

  test('$MethodChannelReveChatSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelReveChatSdk>());
  });

  test('initReveChat', () async {
    ReveChatSdk reveChatSdkPlugin = ReveChatSdk();
    MockReveChatSdkPlatform fakePlatform = MockReveChatSdkPlatform();
    ReveChatSdkPlatform.instance = fakePlatform;

    expect(
      await reveChatSdkPlugin.initReveChat("accountId"),
      'Reve chat initialized successfully',
    );
  });

  test('setReveChatVisitorInfo', () async {
    ReveChatSdk reveChatSdkPlugin = ReveChatSdk();
    MockReveChatSdkPlatform fakePlatform = MockReveChatSdkPlatform();
    ReveChatSdkPlatform.instance = fakePlatform;
    UserModel userModel = UserModel(
      name: "name",
      email: "email",
      phoneNumber: "phoneNumber",
    );

    expect(
      await reveChatSdkPlugin.setReveChatVisitorInfo(userModel),
      'Reve chat visitor info set up successfully',
    );
  });

  test('setReveChatDeviceToken', () async {
    ReveChatSdk reveChatSdkPlugin = ReveChatSdk();
    MockReveChatSdkPlatform fakePlatform = MockReveChatSdkPlatform();
    ReveChatSdkPlatform.instance = fakePlatform;

    expect(
      await reveChatSdkPlugin.setReveChatDeviceToken("deviceToken"),
      'Reve chat device toke id set up successfully',
    );
  });

  test('gotoReveChat', () async {
    ReveChatSdk reveChatSdkPlugin = ReveChatSdk();
    MockReveChatSdkPlatform fakePlatform = MockReveChatSdkPlatform();
    ReveChatSdkPlatform.instance = fakePlatform;

    expect(
      await reveChatSdkPlugin.gotoReveChat(),
      "Navigating to Reve chat screen",
    );
  });
}
