import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:reve_chat_sdk/user_model.dart';

import 'reve_chat_sdk_platform_interface.dart';

/// An implementation of [ReveChatSdkPlatform] that uses method channels.
class MethodChannelReveChatSdk extends ReveChatSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('reve_chat_sdk');

  @override
  Future<String?> initReveChat(String accountId) async {
    final message = await methodChannel.invokeMethod<String>(
      'initReveChat',
      accountId,
    );
    return message;
  }

  @override
  Future<String?> setReveChatVisitorInfo(UserModel userModel) async {
    final message = await methodChannel.invokeMethod<String>(
      'setReveChatVisitorInfo',
      userModel.toMap(),
    );
    return message;
  }

  @override
  Future<String?> setReveChatDeviceToken(String deviceToken) async {
    final message = await methodChannel.invokeMethod<String>(
      'setReveChatDeviceToken',
      deviceToken,
    );
    return message;
  }

  @override
  Future<String?> gotoReveChat() async {
    final message = await methodChannel.invokeMethod<String>(
      'gotoReveChat',
    );
    return message;
  }
}
