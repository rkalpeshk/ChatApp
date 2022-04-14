import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedchat/screens/login_screen.dart';
import 'package:speedchat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:speedchat/components/rounded_button.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationColor, animationBorder;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       duration: Duration(seconds: 2),
//       // vsync: this,
//     );

// //    animationBorder = BorderRadiusTween(
// //            begin: BorderRadius.circular(0), end: BorderRadius.circular(30))
// //        .animate(controller);

//     animationColor = ColorTween(begin: Colors.blueGrey, end: Colors.white)
//         .animate(controller);
//     controller.forward();

//     controller.addListener(() {
//       setState(() {});
//     });
//   }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,//animationColor.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset("assets/image/logo.png"),
                height: 150,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TypewriterAnimatedTextKit(

              speed: Duration(milliseconds: 500),
              totalRepeatCount: 2,
              text: ['Speed chat'],
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              buttonText: "Log In",
              colour: Colors.lightBlueAccent,
            ),
            SizedBox(
              height: 24,
            ),
            RoundedButton(
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              buttonText: "Register",
              colour: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
