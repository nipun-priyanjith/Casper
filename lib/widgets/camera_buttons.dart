import 'package:flutter/material.dart';

class CameraButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Implement notify functionality
          },
          child: Text('Notify'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            // Implement live functionality
          },
          child: Text('Live'),
        ),
      ],
    );
  }
}
