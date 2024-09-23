import 'package:casper/widgets/ai.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  late FlutterTts _flutterTts;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) {
          print('onError: ${val.errorMsg}');
          setState(() {
            _text = 'Error: ${val.errorMsg}';
          });
        },
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = val.recognizedWords;
              print('Recognized Words: $_text');
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
                print("Confidence: $_confidence");
              }
              _handleCommand(_text);
            });
          },
          listenFor: Duration(seconds: 60),
          pauseFor: Duration(seconds: 5),
          partialResults: true,
          onSoundLevelChange: (level) => print('Sound level: $level'),
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
        print("Speech recognition not available");
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _handleCommand(String text) {
    String response = AiAssistant.getResponse(text);
    _speak(response);
  }

  Future<void> _speak(String text) async {
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8DCD1),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'You said: $_text',
                style: TextStyle(fontSize: 32.0, color: Color(0xFF494949)),
              ),
            ),
          ),
          Align(
            alignment: Alignment
                .bottomRight, // Position the button at the bottom right
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: FloatingActionButton.large(
                onPressed: _listen,
                backgroundColor: Color(0xFFE85E56),
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  color: Color(0xFFE8DCD1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
