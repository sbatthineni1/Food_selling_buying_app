import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vendor_application/authentication/auth_screen.dart';
import 'package:vendor_application/global/global.dart';

import '../mainScreens/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    

    Timer(const Duration(seconds: 3), () async {
      if(firebaseAuth.currentUser != null){
        //if seller already logged in
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      }
      else {
        // if seller is not logged in
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("images/splash.jpg"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Sell Food Online",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 40,
                        fontFamily: "Signatra",
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
