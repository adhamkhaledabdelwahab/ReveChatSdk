import Flutter
import UIKit
import ReveChatSDK

public class ReveChatSdkPlugin: NSObject, FlutterPlugin {

  private var userModel : UserModel?
  private var viewController : UIViewController?
    
    init(_ navC : UIViewController){
      self.viewController = navC
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "reve_chat_sdk", binaryMessenger: registrar.messenger())
    let navigationController = UIApplication.shared.delegate!.window!!.rootViewController!
    let instance = ReveChatSdkPlugin(navigationController)
    registrar.addMethodCallDelegate(instance, channel: channel)
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
    
    private func initChat(_ json : Any?) throws {
        let accountId = json as! String
        print("Account Id: \(accountId)")
        let reveChatManager = ReveChatManager()
        reveChatManager.setupAccount(with: accountId)
    }
    
    private func initReveChat(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            try initChat(call.arguments)
            result("Reve chat initialized successfully")
        } catch {
            let e = FlutterError.init(code: "500",
                                    message: "Error initialize Reve chat",
                                    details: error.localizedDescription)
            print("initReveChat error: \(error)")
            result(e)
        }
    }
    
    private func fetchUser(_ json : Any?) throws {
        let json = json as! Dictionary<String, Any>
        self.userModel = UserModel.fromMap(json)
    }

   private func setReveChatVisitorInfo(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
       do {
           try fetchUser(call.arguments)
           result("Reve chat visitor info set up successfully")
       } catch {
           let e = FlutterError.init(code: "500",
                                   message: "Error setting up Reve chat visitor info",
                                   details: error.localizedDescription)
           print("setReveChatVisitorInfo error: \(error)")
           result(e)
       }
   }
    
    private func navigate() throws {
        let reveChatManager = ReveChatManager()
         reveChatManager.initiateReveChat(
         with: self.userModel!.getName(),
         visitorEmail: self.userModel!.getEmail(),
         visitorMobile: self.userModel!.getPhoneNumber(),
         loginState: LOGGED_IN,
         onNavigationViewController: self.viewController!.navigationController
         )
    }

   private func gotoReveChat(result: @escaping FlutterResult) {
       do {
           try navigate()
           result("Navigating to Reve chat screen")
       } catch{
           let e = FlutterError.init(code: "500",
                                   message: "Error navigating to Reve chat screen",
                                   details: error.localizedDescription)
           print("gotoReveChat error: \(error)")
           result(e)
       }
   }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
