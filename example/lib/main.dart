import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:reve_chat_sdk/reve_chat_sdk.dart';
import 'package:reve_chat_sdk/user_model.dart';

final reveChatSdkPlugin = ReveChatSdk();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await reveChatSdkPlugin.initReveChat("accountId");
  if(Platform.isAndroid){
    await reveChatSdkPlugin.setReveChatDeviceToken("deviceToken");
  }
  await reveChatSdkPlugin.setReveChatVisitorInfo(
    UserModel(
      name: "username",
      email: "emailAddress",
      phoneNumber: "phoneNumber",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Reve Chat Testing'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: reveChatSdkPlugin.gotoReveChat,
            child: const Text("Technical Support"),
          ),
        ),
      ),
    );
  }
}
