// ignore_for_file: unnecessary_getters_setters

class UserModel {
  String _name;
  String _email;
  String _phoneNumber;

  UserModel({
    required String name,
    required String email,
    required String phoneNumber,
  })  : _name = name,
        _email = email,
        _phoneNumber = phoneNumber;

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Map<String, dynamic> toMap() => {
        'username': _name,
        'userEmail': _email,
        'phoneNumber': _phoneNumber,
      };
}
