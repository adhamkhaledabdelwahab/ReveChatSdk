import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:reve_chat_sdk/user_model.dart';

import 'reve_chat_sdk_method_channel.dart';

abstract class ReveChatSdkPlatform extends PlatformInterface {
  /// Constructs a ReveChatSdkPlatform.
  ReveChatSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ReveChatSdkPlatform _instance = MethodChannelReveChatSdk();

  /// The default instance of [ReveChatSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelReveChatSdk].
  static ReveChatSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ReveChatSdkPlatform] when
  /// they register themselves.
  static set instance(ReveChatSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> initReveChat(String accountId) {
    throw UnimplementedError('initReveChat() has not been implemented.');
  }

  Future<String?> setReveChatVisitorInfo(UserModel userModel) {
    throw UnimplementedError(
      'setReveChatVisitorInfo() has not been implemented.',
    );
  }

  Future<String?> setReveChatDeviceToken(String deviceToken) {
    throw UnimplementedError(
      'setReveChatDeviceToken() has not been implemented.',
    );
  }

  Future<String?> gotoReveChat() {
    throw UnimplementedError('gotoReveChat() has not been implemented.');
  }
}
