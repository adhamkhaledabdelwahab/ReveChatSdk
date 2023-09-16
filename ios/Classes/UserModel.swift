import Foundation
class UserModel
{
    private var email : String;
    private var name : String;
    private var phoneNumber : String;
    init(_ email : String, _ name : String, _ phoneNumber : String)
    {
        self.email = email;
        self.name = name;
        self.phoneNumber = phoneNumber;
    }
    func getEmail() -> String
    {
        return self.email;
    }
    func getName() -> String
    {
        return self.name;
    }
    func getPhoneNumber() -> String
    {
        return self.phoneNumber;
    }
    static func fromMap(_ json : [String : Any]) -> UserModel
    {
        let name : String = json["username"] as! String;
        let email : String = json["userEmail"] as! String;
        let phoneNumber : String = json["phoneNumber"] as! String;
        return UserModel(email, name, phoneNumber);
    }
}
