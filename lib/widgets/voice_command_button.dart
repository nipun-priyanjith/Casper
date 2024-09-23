// import 'dart:ffi';

// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class SpeeechText extends StatefulWidget {
//   const SpeeechText({super.key});

//   @override
//   State<SpeeechText> createState() => _SpeeechTextState();
// }

// class _SpeeechTextState extends State<SpeeechText> {
//   bool isLisning = false;
//   late stt.SpeechToText _speechToText;
//   String text = "press the button & start the speacking";
//   double confidance = 1.0;
//   @override
//   void initState() {
//     _speechToText = stt.SpeechToText();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Confidance: ${(confidance * 100).toStringAsFixed(1)}"),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: isLisning,
//         glowColor: Colors.blue,
//         duration: Duration(milliseconds: 1000),
//         repeat: true,
//         child: FloatingActionButton(
//           backgroundColor: Colors.blue,
//           onPressed: _catureVoice,
//           child: Icon(
//             isLisning ? Icons.mic : Icons.mic_none,
//             size: 50,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.all(30),
//           child: Column(
//             children: [
//               Text(
//                 text,
//                 style:
//                     const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _catureVoice() async {
//     if (!isLisning) {
//       bool listen = await _speechToText.initialize();
//       if (listen) {
//         setState(() => isLisning = true);
//         _speechToText.listen(
//             onResult: (result) => setState(() {
//                   text = result.recognizedWords;
//                   if (result.hasConfidenceRating && result.confidence > 0) {
//                     confidance = result.confidence;
//                   }
//                 }));
//       }
//     } else {
//       setState(() => isLisning = false);
//       _speechToText.stop();
//     }
//   }
// }










































// // import 'package:flutter/material.dart';
// // import 'package:speech_to_text/speech_to_text.dart' as stt;

// // class VoiceCommandButton extends StatefulWidget {
// //   @override
// //   _VoiceCommandButtonState createState() => _VoiceCommandButtonState();
// // }

// // class _VoiceCommandButtonState extends State<VoiceCommandButton> {
// //   late stt.SpeechToText _speech;
// //   bool _isListening = false;
// //   String _text = "Press the button and start speaking";

// //   @override
// //   void initState() {
// //     super.initState();
// //     _speech = stt.SpeechToText();
// //   }

// //   void _listen() async {
// //     if (!_isListening) {
// //       bool available = await _speech.initialize(
// //         onStatus: (val) => print('onStatus: $val'),
// //         onError: (val) => print('onError: $val'),
// //       );
// //       if (available) {
// //         setState(() => _isListening = true);
// //         _speech.listen(
// //           onResult: (val) => setState(() {
// //             _text = val.recognizedWords;
// //           }),
// //         );
// //       }
// //     } else {
// //       setState(() => _isListening = false);
// //       _speech.stop();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: <Widget>[
// //         Text(
// //           "You said:",
// //           style: TextStyle(fontSize: 20),
// //         ),
// //         SizedBox(height: 10),
// //         Text(
// //           _text,
// //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 20),
// //         FloatingActionButton(
// //           onPressed: _listen,
// //           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
// //         ),
// //       ],
// //     );
// //   }
// // }

































