import 'package:casper/constants/color.dart';
import 'package:casper/services/auth.dart';
import 'package:flutter/material.dart';
import '../pages/command_page.dart';
import '../pages/camera_page.dart';
import '../pages/status_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Instance for AuthService
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Smart Home App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthServices _auth = AuthServices();
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    SpeechScreen(),
    StatusPage(),
    CameraPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8DCD1),
      appBar: AppBar(
        // title: Text('Smart Home App'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                  0xFFE85E56), // Teal color for the button background
              foregroundColor: Colors.white, // White color for the icon
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
            child: const Icon(Icons.logout),
          )
        ],
        backgroundColor: Color(0xFFC3BAB2),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFC3BAB2),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Command',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFE85E56),
        onTap: _onItemTapped,
      ),
    );
  }
}
