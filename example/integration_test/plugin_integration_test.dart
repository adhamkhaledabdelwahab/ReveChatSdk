// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:reve_chat_sdk/reve_chat_sdk.dart';
import 'package:reve_chat_sdk/user_model.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('initReveChat test', (WidgetTester tester) async {
    final ReveChatSdk plugin = ReveChatSdk();
    final String? message = await plugin.initReveChat("accountId");
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(message?.isNotEmpty, true);
  });

  testWidgets('setReveChatVisitorInfo test', (WidgetTester tester) async {
    final ReveChatSdk plugin = ReveChatSdk();
    final String? message = await plugin.setReveChatVisitorInfo(
      UserModel(
        name: "name",
        email: "email",
        phoneNumber: "phoneNumber",
      ),
    );
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(message?.isNotEmpty, true);
  });

  testWidgets('setReveChatDeviceToken test', (WidgetTester tester) async {
    final ReveChatSdk plugin = ReveChatSdk();
    final String? message = await plugin.setReveChatDeviceToken("deviceToken");
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(message?.isNotEmpty, true);
  });

  testWidgets('gotoReveChat test', (WidgetTester tester) async {
    final ReveChatSdk plugin = ReveChatSdk();
    final String? message = await plugin.gotoReveChat();
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(message?.isNotEmpty, true);
  });
}
