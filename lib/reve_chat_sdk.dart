import 'package:flutter/services.dart';
import 'package:reve_chat_sdk/user_model.dart';

import 'reve_chat_sdk_platform_interface.dart';

class ReveChatSdk {
  /// Initializes Reve chat with given account id
  ///
  /// Account id found at ReveChat user dashboard at integrations/mobile-sdk
  ///
  /// throws exceptions if error happens
  Future<String?> initReveChat(String accountId) async {
    try {
      return await ReveChatSdkPlatform.instance.initReveChat(accountId);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// register user data to Reve chat
  ///
  /// throws exceptions if error happens
  Future<String?> setReveChatVisitorInfo(UserModel userModel) async {
    try {
      return await ReveChatSdkPlatform.instance.setReveChatVisitorInfo(
        userModel,
      );
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// register device token into Reve chat to receive notifications
  ///
  /// device token can be found from firebase getToken() method
  ///
  /// throws exceptions if error happens
  Future<String?> setReveChatDeviceToken(String deviceToken) async {
    try {
      return await ReveChatSdkPlatform.instance.setReveChatDeviceToken(
        deviceToken,
      );
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// navigating to Reve chat screen
  ///
  /// throws exceptions if error happens
  Future<String?> gotoReveChat() async {
    try {
      return await ReveChatSdkPlatform.instance.gotoReveChat();
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
