import Flutter
import UIKit
import ReveChatSDK

public class ReveChatSdkPlugin: NSObject, FlutterPlugin {

  private var userModel : UserModel?
  private var navigationController: UINavigationController?
    
    override init(){}

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "reve_chat_sdk", binaryMessenger: registrar.messenger())
    let instance = ReveChatSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  func onAttached(to engine: FlutterEngine) {
      navigationController = engine.viewController?.navigationController
  }
    
  func onDetached(from engine: FlutterEngine) {
    navigationController = nil
  }
    
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "initReveChat":
        self.initReveChat(call, result: result)
     case "setReveChatVisitorInfo":
        self.setReveChatVisitorInfo(call, result: result)
     case "gotoReveChat":
        self.gotoReveChat(result: result)
      default:
          result(FlutterMethodNotImplemented)
    }
  }
    
    private func initReveChat(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            let accountId = call.arguments as! String
            let reveChatManager = ReveChatManager()
            reveChatManager.setupAccount(with: accountId)
            /* for title while chatting */
            reveChatManager.setChatTitle("Lets chat")
            /* for theme color while chatting*/
            reveChatManager.themeColor = UIColor.blue
            /* for background color*/
            reveChatManager.backgroundColor = UIColor.yellow
            /* for navigation bar color*/
            reveChatManager.navBarColor = UIColor.gray
            /* for tint color of header */
            reveChatManager.headerTintColor = UIColor.red
            /* for title color while chatting*/
            reveChatManager.headerTextColor = UIColor.black
            /* for incoming chat bubble color*/
            reveChatManager.incomingBubbleColor = UIColor.blue
            /* for outgoing chat bubble color*/
            reveChatManager.outgoingBubbleColor = UIColor.yellow
            result("Reve chat initialized successfully")
        } catch {
            let e = FlutterError.init(code: "500",
                                    message: "Error initialize Reve chat",
                                    details: error.localizedDescription)
            print("initReveChat error: \(error)")
            result(e)
        }
    }

   private func setReveChatVisitorInfo(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
       do {
           let json = call.arguments as! Dictionary<String, Any>
           self.userModel = UserModel.fromMap(json)
           result("Reve chat visitor info set up successfully")
       } catch {
           let e = FlutterError.init(code: "500",
                                   message: "Error setting up Reve chat visitor info",
                                   details: error.localizedDescription)
           print("setReveChatVisitorInfo error: \(error)")
           result(e)
       }
   }

   private func gotoReveChat(result: @escaping FlutterResult) {
       do {
           let reveChatManager = ReveChatManager()
           reveChatManager.initiateReveChat(with: self.userModel!.getName(),
           visitorEmail: self.userModel!.getEmail(),
           visitorMobile: self.userModel!.getPhoneNumber(),
           loginState: LOGGED_IN,
           onNavigationViewController: self.navigationController )
           result("Navigating to Reve chat screen")
       } catch {
           let e = FlutterError.init(code: "500",
                                   message: "Error navigating to Reve chat screen",
                                   details: error.localizedDescription)
           print("gotoReveChat error: \(error)")
           result(e)
       }
   }
}
