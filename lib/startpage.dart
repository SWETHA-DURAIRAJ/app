import 'package:flutter/material.dart';
import 'package:fss/register.dart';
import 'package:fss/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fss/sizeconfig.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              //  height: MediaQuery.of(context).size.height - 250,
              // width: MediaQuery.of(context).size.width,
              height: SizeConfig.screenHeight * 0.65,
              width: SizeConfig.screenWidth,
              child: Image(
                image: AssetImage("img/home.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Make life ',
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 9,
                      fontFamily: 'Salsa',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'easy',
                        style: TextStyle(color: Color(0xf270cafc))),
                    TextSpan(
                        text: ' with',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 9,
                            fontFamily: 'Salsa',
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: "  Fortified Security System",
                        style:
                            TextStyle(color: Color.fromRGBO(254, 201, 37, 1.0)))
                  ],
                )),
            SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    primary: Color(0xf270cafc),
                    shadowColor: Color(0xfff9f9f9)),
                child: Text(
                  "GET STARTED",
                  style: GoogleFonts.righteous(
                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              /* RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: () {},
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.lightBlue),*/

              /*  RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToRegister,
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange),*/
            ]),
          ],
        ),
      ),
    );
  }
}
