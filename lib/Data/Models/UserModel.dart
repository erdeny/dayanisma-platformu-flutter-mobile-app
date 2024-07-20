class UserModel {
  String? _username;
  String? _password;
  String? _name;
  String? _surname;
  String? _email;
  String? _phoneNumber;
  DateTime? _createdAt;
  String? _profilePhoto;

  UserModel(
      {String? username,
        String? password,
        String? name,
        String? surname,
        String? email,
        String? phoneNumber,
        DateTime? createdAt,
        String? profilePhoto}) {
    if (username != null) {
      this._username = username;
    }
    if (password != null) {
      this._password = password;
    }
    if (name != null) {
      this._name = name;
    }
    if (surname != null) {
      this._surname = surname;
    }
    if (email != null) {
      this._email = email;
    }
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (profilePhoto != null) {
      this._profilePhoto = profilePhoto;
    }
  }

  String? get username => _username;
  set username(String? username) => _username = username;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get surname => _surname;
  set surname(String? surname) => _surname = surname;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? createdAt) => _createdAt = createdAt;
  String? get profilePhoto => _profilePhoto;
  set profilePhoto(String? createdAt) => _profilePhoto = createdAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _password = json['password'];
    _name = json['name'];
    _surname = json['surname'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _createdAt = DateTime.parse(json['created_at']);
    _profilePhoto = json['profile_photo_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this._username;
    data['password'] = this._password;
    data['name'] = this._name;
    data['surname'] = this._surname;
    data['email'] = this._email;
    data['phone_number'] = this._phoneNumber;
    data['created_at'] = this._createdAt;
    data['profile_photo_src'] = this._profilePhoto;
    return data;
  }
}
