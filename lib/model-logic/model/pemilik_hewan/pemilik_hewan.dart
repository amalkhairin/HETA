
class PemilikHewan {
  int? _id;
  String? _fullname;
  String? _username;
  String? _email;
  String? _password;

  static int? _idTemp;
  static String? _fullnameTemp;
  static String? _usernameTemp;
  static String? _emailTemp;
  static String? _passwordTemp;

  static final PemilikHewan instance = PemilikHewan._internal();

  // factory PemilikHewan()

  factory PemilikHewan(Map<String, dynamic> jsonData){
    var data = jsonData['result'][0];
    _idTemp = data['id'];
    _fullnameTemp = data['fullname'];
    _usernameTemp = data['username'];
    _emailTemp = data['email'];
    _passwordTemp = data['password'];
    return instance;
  }

  PemilikHewan._internal(){
    this._id = _idTemp;
    this._fullname = _fullnameTemp;
    this._username = _usernameTemp;
    this._email = _emailTemp;
    this._password = _passwordTemp;
  }

  int? get id => this._id;

  set id(int? value) => this._id = value;

  String? get fullname => this._fullname;

  set fullname(value) => this._fullname = value;

  String? get username => this._username;

  set username(value) => this._username = value;

  String? get email => this._email;

  set email(value) => this._email = value;

  String? get password => this._password;

  set password(value) => this._password = value;

}