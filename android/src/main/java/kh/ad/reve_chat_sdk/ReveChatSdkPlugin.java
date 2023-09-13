package kh.ad.reve_chat_sdk;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.revesoft.revechatsdk.model.VisitorInfo;
import com.revesoft.revechatsdk.state.LoginState;
import com.revesoft.revechatsdk.ui.activity.ReveChatActivity;
import com.revesoft.revechatsdk.utils.ReveChat;

import java.util.HashMap;

/**
 * ReveChatSdkPlugin
 */
public class ReveChatSdkPlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;
    private Context mContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        mContext = flutterPluginBinding.getApplicationContext();
        channel = new MethodChannel(
                flutterPluginBinding.getBinaryMessenger(),
                "reve_chat_sdk"
        );
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "initReveChat":
                initReveChat(call, result);
                break;
            case "setReveChatVisitorInfo":
                setReveChatVisitorInfo(call, result);
                break;
            case "setReveChatDeviceToken":
                setReveChatDeviceToken(call, result);
                break;
            case "gotoReveChat":
                gotoReveChat(result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void initReveChat(@NonNull MethodCall call, @NonNull Result result) {
        try {
            String accountId = (String) call.arguments;
            ReveChat.init(accountId);
            result.success("Reve chat initialized successfully");
        } catch (Exception e) {
            Log.e("initReveChat", e.getMessage());
            result.error(
                    "500",
                    "Error initialize Reve chat",
                    e.getMessage()
            );
        }
    }

    @SuppressWarnings("unchecked")
    private void setReveChatVisitorInfo(@NonNull MethodCall call, @NonNull Result result) {
        try {
            HashMap<String, ?> json = (HashMap<String, ?>) call.arguments;
            UserModel user = UserModel.fromMap(json);
            LoginState loginState = LoginState.LOGGED_IN;
            VisitorInfo visitorInfo = new VisitorInfo.Builder()
                    .name(user.getName())
                    .email(user.getEmail())
                    .phoneNumber(user.getPhoneNumber())
                    .appLoginState(loginState)
                    .build();
            ReveChat.setVisitorInfo(visitorInfo);
            result.success("Reve chat visitor info set up successfully");
        } catch (Exception e) {
            Log.e("setReveChatVisitorInfo", e.getMessage());
            result.error(
                    "500",
                    "Error setting up Reve chat visitor info",
                    e.getMessage()
            );
        }
    }

    private void setReveChatDeviceToken(@NonNull MethodCall call, @NonNull Result result) {
        try {
            String deviceTokenId = (String) call.arguments;
            ReveChat.setDeviceTokenId(deviceTokenId);
            result.success("Reve chat device toke id set up successfully");
        } catch (Exception e) {
            Log.e("setReveChatDeviceToken", e.getMessage());
            result.error(
                    "500",
                    "Error setting up Reve chat device token id",
                    e.getMessage()
            );
        }
    }

    private void gotoReveChat(@NonNull Result result) {
        try {
            Intent mIntent = new Intent(mContext, ReveChatActivity.class);
            mIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            mContext.startActivity(mIntent);
            result.success("Navigating to Reve chat screen");
        } catch (Exception e) {
            Log.e("gotoReveChat", e.getMessage());
            result.error(
                    "500",
                    "Error navigating to Reve chat screen",
                    e.getMessage()
            );
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}