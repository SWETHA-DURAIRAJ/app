import 'package:flutter/material.dart';
import 'package:fss/nav.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fss/sizeconfig.dart';

class wifi extends StatefulWidget {
  const wifi({Key? key}) : super(key: key);

  @override
  State<wifi> createState() => _wifiState();
}

class _wifiState extends State<wifi> {
  @override
  TextEditingController SSID = TextEditingController();
  TextEditingController PASS = TextEditingController();
  String ssid = "";
  String pass = "";
  Widget build(BuildContext context) {
    final wifiField = Container(
      //    margin: EdgeInsets.only(top: 10),

      //  padding: EdgeInsets.only(left: 10),
      child: TextFormField(
          autofocus: false,
          controller: SSID,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.wifi),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "ssid",
              filled: true,
              //  fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ))),
    );
    final passwordField = TextFormField(
        autofocus: false,
        controller: PASS,
        obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          filled: true,
          //  fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ));
    final signUpButton = ElevatedButton(
      onPressed: () async {
        ssid = SSID.text;
        pass = PASS.text;
        ssid.replaceAll('', '%');

        pass!.replaceAll('', '%');

        http.Response response = await http.post(
            Uri.parse("http://192.168.4.1/setting?ssid=$ssid&pass=$pass"));
        //   http://192.168.4.1/setting?ssid=Vijay&pass=9876543210
        //    print(ssid);
        //  print(pass);
        print("body = ${response.body}");
        print("status = ${response.statusCode}");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Nav()),
        );
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          primary: Color(0xf270cafc),
          shadowColor: Color(0xfff9f9f9)),
      child: Text(
        "SUBMIT",
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
              child: Stack(
                children: <Widget>[
                  Container(
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
                      physics: AlwaysScrollableScrollPhysics(),
                      /*       physics: NeverScrollableScrollPhysics(),*/
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 100.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WIFI',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 10,
                                  fontFamily: 'Salsa',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Credentials!',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 10,
                                  fontFamily: 'Salsa',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                height: SizeConfig.safeBlockHorizontal * 25,
                                child: Image(
                                  image: AssetImage("img/WIFI.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 25),
                          wifiField,
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                          passwordField,
                          SizedBox(height: SizeConfig.safeBlockHorizontal * 25),
                          signUpButton,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
