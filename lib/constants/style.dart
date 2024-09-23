import 'package:casper/constants/color.dart';
import 'package:flutter/material.dart';

const TextStyle decsriptionStyle = TextStyle(
  fontSize: 13,
  color: Color(0xFF494949),
  fontWeight: FontWeight.w400,
);

const textInputDecoration = InputDecoration(
  hintText: "email",
  hintStyle: TextStyle(color: Color(0xFF494949), fontSize: 15),
  fillColor: Color(0xFFE8DCD1),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF494949), width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF494949), width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  // set text color to white
  labelStyle: TextStyle(color: Color(0xFF494949)),
);
