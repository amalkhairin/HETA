import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSecure = true;
  bool _isLoading = false;

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
                SizedBox(height: 12,),
                Align(
                  alignment: Alignment(1, 0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Forgot Password?",),
                      style: TextButton.styleFrom(
                        primary: Color(0xFF32363A),
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
                      onPressed: (){},
                      child: Text("Sign In"),
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
                      onPressed: (){},
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
}