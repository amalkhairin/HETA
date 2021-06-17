import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:heta_app/page-view/home_page.dart';
import 'package:heta_app/page-view/login_register/registe_pager.dart';
import 'package:heta_app/utility/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSecure = true;
  bool _isLoading = false;
  Database db = Database();
  Position? _currentPosition;
  String? _currentAddress;
  GeoCode geoCode = GeoCode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  /// menampilkan view
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 92, bottom: 72),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/img/logo.png", fit: BoxFit.fitWidth,)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                      hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: TextFormField(
                    obscureText: _isSecure,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                      hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            _isSecure = !_isSecure;
                          });
                        },
                        child: _isSecure? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 72,),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: ElevatedButton(
                      onPressed: _isLoading? (){} : () async {
                        if(_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                          setState(() {
                            _isLoading = true;
                          });
                          var res = await db.userLogin(username: _usernameController.text, password: _passwordController.text);
                          if(res != false){
                            setState(() {
                            _isLoading = false;
                          });
                            PemilikHewan user = PemilikHewan(res);
                            Log.saveString("username", _usernameController.text);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => HomePage())
                            );
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                            showDialog(
                              context: context, 
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("Login Failed!\nPlease check you internet connection"),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Ok"),
                                    )
                                  ],
                                );
                              }
                            );
                          }
                        } else {
                          showDialog(
                            context: context, 
                            builder: (context){
                              return AlertDialog(
                                content: Text("Username dan password tidak boleh kosong"),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Ok"),
                                  )
                                ],
                              );
                            }
                          );
                        }
                      },
                      child: _isLoading? CircularProgressIndicator(color: Colors.white) : Text("Sign In"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2831A5),
                        onPrimary: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I am a new user. "),
                    TextButton(
                      onPressed: _isLoading? (){} : (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RegisterPage())
                        );
                      },
                      child: Text("Sign Up"),
                      style: TextButton.styleFrom(
                        primary: Color(0xFF2831A5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
          _getAddressFromLatLng();
        });
      }).catchError((e) {
        print(e);
      });
  }

  _getAddressFromLatLng() async {
    try {
      Address _address = await geoCode.reverseGeocoding(latitude: _currentPosition!.latitude, longitude: _currentPosition!.longitude);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("address", "${_address.city}");
      setState(() {
        _currentAddress = "${_address.city}";
      });
      print(_currentAddress);
    } catch (e) {
      print(e);
    }
  }
}