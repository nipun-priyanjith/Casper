import 'package:casper/widgets/device_status_list.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: DeviceStatusList(),
        ),
      ],
    );
  }
}
