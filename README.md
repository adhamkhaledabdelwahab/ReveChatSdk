# reve_chat_sdk

ReveChatSDK

## Getting Started

this plugin is for android and ios devices, it registers app to ReveChat bot with your account id 
which can be found at ReveChat dashboard at integrate mobile sdk, so by setting account id 
and user data to start chat with registered technical support.

## Setup

About chat colors all can be customized from ReveChat Dashboard

ReveChat => https://www.revechat.com

## Android SETUP
* manifest.xml file => add
  ```txt
      <uses-permission android:name="android.permission.INTERNET"/>
  ```
* strings.xml file => add 
    ```txt
        <string name="revechatsdk_title_chat_window">specified title</string>
    ```
* colors.xml file => add for ReveChat screen primary
    * ```txt
        <color name="revechatsdk_colorPrimary">color in hex</color>
      ```
    * ```txt
        <color name="revechatsdk_colorPrimaryDark">color in hex</color>
      ```

## IOS SETUP
* min ios: 11
* pod file => add in case of error in cdn
    ```txt
       source 'https://github.com/CocoaPods/Specs.git'
    ```
* pod file => add
  ```txt
     use_frameworks!
     project 'Runner', {
     'Debug' => :debug,
     'Profile' => :release,
     'Release' => :release,
     }
  ```
* info.plist => add
```txt
  <key>NSPhotoLibraryUsageDescription</key>
  <string>description to use photo library</string>
  <key>NSCameraUsageDescription</key>
  <string>description to use camera</string>
  <key>NSAppTransportSecurity</key>        <dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/></dict>
  <key>NSMicrophoneUsageDescription</key>
  <string>Add your description here</string>
  <key>NSCameraUsageDescription</key>
  <string>Add your description here</string>
```
* AppDelegate.swift (Required):
```swift
  override func application(
    _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let navC = UINavigationController(rootViewController: window.rootViewController!)
    navC.isNavigationBarHidden = true
    window.rootViewController = navC
    window.makeKeyAndVisible()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
```
* AppDelegate.swift => add for background notification
```swift
    import UIKit
    import Flutter

    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
        var backgroundUpdateTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)
    
        override func applicationDidBecomeActive(_ application: UIApplication) {
            application.applicationIconBadgeNumber = 0
            self.endBackgroundUpdateTask()
        }
        
        override func applicationWillResignActive(_ application: UIApplication) {
            self.backgroundUpdateTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            self.endBackgroundUpdateTask()
            })
        }
        
        func endBackgroundUpdateTask() {
            UIApplication.shared.endBackgroundTask(self.backgroundUpdateTask)
            self.backgroundUpdateTask = UIBackgroundTaskIdentifier.invalid
        }
    }
```

Add the plugin into pubspec.yaml

Initialize the plugin in the main function as following:

```dart
    import 'package:reve_chat_sdk/reve_chat_sdk.dart';
    import 'package:reve_chat_sdk/user_model.dart';
    
    final reveChatSdkPlugin = ReveChatSdk();
    
    Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await reveChatSdkPlugin.initReveChat(accountId);
      if(Platform.isAndroid){
        await reveChatSdkPlugin.setReveChatDeviceToken(deviceToken);
      }
      await reveChatSdkPlugin.setReveChatVisitorInfo(
        UserModel(
          name: username,
          email: userEmailAddress,
          phoneNumber: userPhoneNumber,
        ),
      );
      runApp(const MyApp());
    }
```

## How to use plugin?

all you can do to start chatting is to call this function in onPress of button

```dart
    final reveChatSdkPlugin = ReveChatSdk();
    void chat() => reveChatSdkPlugin.gotoReveChat();
```

## FAQs (General issues faced while integrating)
1. I am facing the following error in console \n
   ld: library not found for -lAFNetworking \n
   Reason : in your pod file use_frameworks! line is commented. \n
   Solution : Uncomment use_frameworks! line and build again
2. Getting Crash when initiating revechat sdk \n
   reason : the pod has been updated on the cocoa pods \n
   solution : run ‘pod update‘ in the terminal on your project path
