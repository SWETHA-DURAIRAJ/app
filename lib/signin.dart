import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fss/register.dart';
import 'package:fss/startpage.dart';
import 'package:fss/sizeconfig.dart';
import 'package:fss/wifi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  var email = "";
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4),
          hintText: "Email",
          filled: true,
          //  fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4),
          hintText: "Password",
          filled: true,
          //  fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ));
    final resetpasswordField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 4),
          hintText: "Email",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ));

    final loginButton = ElevatedButton(
      onPressed: () {
        signIn(emailController.text, passwordController.text);
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          primary: Color(0xf270cafc),
          shadowColor: Color(0xfff9f9f9)),
      child: Text(
        "Login",
        style: GoogleFonts.righteous(
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
    final resetButton = ElevatedButton(
      onPressed: () {
        resetPassword(emailController.text);
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          primary: Color(0xf270cafc),
          shadowColor: Color(0xfff9f9f9)),
      child: Text(
        "Reset",
        style: GoogleFonts.righteous(
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffffda6e),
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                      /*  reverse: true,*/

                      /*  physics: AlwaysScrollableScrollPhysics(),*/
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: SizeConfig.safeBlockHorizontal * 40,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login ',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 10,
                                  fontFamily: 'Salsa',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                height: SizeConfig.safeBlockHorizontal * 20,
                                child: Image(
                                  image: AssetImage("img/login.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          emailField,
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          passwordField,
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffffdb7f),
                                        borderRadius: new BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(20.0),
                                            topRight:
                                                const Radius.circular(20.0))),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: SingleChildScrollView(
                                      physics: NeverScrollableScrollPhysics(),
                                      reverse: true,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.safeBlockHorizontal * 10,
                                        vertical:
                                            SizeConfig.safeBlockVertical * 10,
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Forget\npassword   ',
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        8,
                                                    fontFamily: 'Salsa',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Container(
                                                  height: SizeConfig
                                                          .safeBlockHorizontal *
                                                      30,
                                                  child: Image(
                                                    image: AssetImage(
                                                        "img/forget.png"),
                                                    // fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: SizeConfig
                                                        .safeBlockHorizontal *
                                                    7),
                                            Center(child: resetpasswordField),
                                            SizedBox(
                                                height: SizeConfig
                                                        .safeBlockHorizontal *
                                                    7),
                                            resetButton,
                                            SizedBox(
                                                height: SizeConfig
                                                        .safeBlockHorizontal *
                                                    7),
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                                TextSpan(
                                                    text: "Back to ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                    text: "Login",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            print(
                                                                'Login Text Clicked');
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                              ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: Color(0xff06b7ff),
                                  fontSize: SizeConfig.safeBlockHorizontal * 4),
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          loginButton,
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " Sign up",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 5,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Login Text Clicked');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => register()),
                                      );
                                    }),
                            ]),
                          ),
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Also login with",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4),
                                ),
                              ),
                              Container(
                                height: SizeConfig.safeBlockHorizontal * 12,
                                child: Image(
                                  image: AssetImage("img/facebook.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: SizeConfig.safeBlockHorizontal * 12,
                                child: Image(
                                  image: AssetImage("img/Google.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal * 10,
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    Fluttertoast.showToast(msg: "Reset mail hase been sent");
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => wifi())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
