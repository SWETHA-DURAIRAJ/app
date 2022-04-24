import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Form(
                    //  key: _formKey,
                    child: Stack(children: <Widget>[
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign Up!',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Salsa',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 90,
                            child: Image(
                              image: AssetImage("img/sign.png"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "Create a Account Quickly",
                          style: TextStyle(
                              fontFamily: 'Wellfleet',
                              color: Color(0xff1a22ed),
                              fontSize: 5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Also login with",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Image(
                              image: AssetImage("img/facebook.png"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Image(
                              image: AssetImage("img/Google.png"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Salsa',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 90,
                            child: Image(
                              image: AssetImage("img/hand.png"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ])))));
  }
}
