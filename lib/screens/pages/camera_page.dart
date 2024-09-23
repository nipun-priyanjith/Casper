import 'package:casper/widgets/camera_buttons.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CameraButtons(),
      ],
    );
  }
}
