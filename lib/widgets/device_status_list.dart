import 'package:flutter/material.dart';

class DeviceStatusList extends StatelessWidget {
  final List<Map<String, dynamic>> devices = [
    {'name': 'Light', 'status': 'off', 'suggestion': 'Turn on'},
    {'name': 'Fan', 'status': 'on', 'suggestion': 'Turn off'},
    {'name': 'Door', 'status': 'open', 'suggestion': 'close the door'}
    // Add more devices as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(devices[index]['name']),
          subtitle: Text('Status: ${devices[index]['status']}'),
          trailing: ElevatedButton(
            onPressed: () {
              // Implement the suggestion action
            },
            child: Text(devices[index]['suggestion']),
          ),
        );
      },
    );
  }
}
