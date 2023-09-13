#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class **.App extends io.flutter.app.FlutterApplication { *; }
-keep class **.MainActivity extends io.flutter.embedding.android.FlutterActivity { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.plugin.editing.** { *; }

#Reve Chat Weapper
-keep class org.webrtc.** { *; }
-keep class org.webrtc.voiceengine.** { *; }
-dontwarn org.webrtc.**
-keep class com.revesoft.revechatsdk.**{*;}
-keep interface com.revesoft.revechatsdk.* { *; }
-keep enum com.revesoft.revechatsdk.* { *; }
-dontwarn com.revesoft.revechatsdk.**