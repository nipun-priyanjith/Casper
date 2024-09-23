import 'package:casper/constants/color.dart';
import 'package:casper/constants/descreption.dart';
import 'package:casper/constants/style.dart';
import 'package:casper/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //funtion to togel
  final Function togel;
  const Register({super.key, required this.togel});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  //form key
  final _formkey = GlobalKey<FormState>();
  //emailes and pw statues
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE8DCD1),
        appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Color(0xFFE8DCD1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [
                //descreption
                const Text(
                  descreption,
                  style: decsriptionStyle,
                ),
                Center(
                    child: Image.asset(
                  'assets/man.png',
                  height: 300,
                )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          //email
                          TextFormField(
                            style: const TextStyle(color: Color(0xFF494949)),
                            decoration: textInputDecoration,
                            validator: (val) => val?.isEmpty == true
                                ? "enter a valide email"
                                : null,
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //pasword
                          TextFormField(
                            obscureText: true,
                            style: const TextStyle(color: Color(0xFF494949)),
                            decoration: textInputDecoration.copyWith(
                                hintText: "Password"),
                            validator: (val) => val!.length < 8
                                ? "Enter valide password"
                                : null,
                            onChanged: (val) {
                              password = val;
                            },
                          ),
                          //account texts
                          const SizedBox(
                            height: 20,
                          ),

                          //error
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                          const Text(
                            "login with shosal account",
                            style: decsriptionStyle,
                          ),
                          //google with login
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                                child: Image.asset(
                              'assets/google.png',
                              height: 50,
                            )),
                          ),
                          //text
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                " have account?",
                                style: decsriptionStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                //go to register page
                                onTap: () {
                                  widget.togel();
                                },
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Color(0xFFE85E56),
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //button
                          GestureDetector(
                            //method for login user button
                            onTap: () async {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                //error
                                setState(() {
                                  error = "please enter valide email";
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE8DCD1),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 2, color: Color(0xFF494949))),
                              child: const Center(
                                  child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Color(0xFF494949),
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          )
                          //register
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
