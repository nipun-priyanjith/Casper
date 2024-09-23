import 'package:casper/screens/authentication/login.dart';
import 'package:casper/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //togel page [register and sign in ]
  bool singinPage = true;
  void switchPages() {
    setState(() {
      singinPage = !singinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (singinPage == true) {
      return Sign_In(
        togel: switchPages,
      );
    } else {
      return Register(togel: switchPages);
    }
  }
}
