import 'package:flutter/material.dart';
import 'package:speedchat/components/rounded_button.dart';
import 'package:speedchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:speedchat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner=false;

  String email,passcode;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/image/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email=value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Enter email")),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    passcode=value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Enter passcode")),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPress: () async{
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    final user= await _auth.signInWithEmailAndPassword(email: email, password: passcode);
                    if(user!=null){
                      Navigator.pushReplacementNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  }
                  catch(e){
                    print(e);
                    setState(() {
                      showSpinner=false;
                    });
                  }
                },
                colour: Colors.lightBlueAccent,
                buttonText: "Log In",
              )
            ],
          ),
        ),
      ),
    );
  }
}
