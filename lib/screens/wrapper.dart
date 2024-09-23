import 'package:casper/models/UserModel.dart';
import 'package:casper/screens/authentication/authenticate.dart';
import 'package:casper/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //the user datathat provideer provides this can be a user data or can be null
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
