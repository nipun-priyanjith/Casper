class AiAssistant {
  static const List<String> doorCommands = [
    'open the door',
    'door open',
    'open door',
    'i need to open door',
    'can you open the door',
    'open this door'
  ];

  static const List<String> windowCommands = [
    'open the window',
    'window open',
    'open window',
    'i need to open window',
    'can you open the window',
    'open this window'
  ];

  static const List<String> lightCommands = [
    'turn on the light',
    'light on',
    'switch on the light',
    'i need to turn on the light',
    'can you turn on the light',
    'light up'
  ];

  static const List<String> gateCommands = [
    'open the gate',
    'gate open',
    'open gate',
    'i need to open the gate',
    'can you open the gate',
    'open this gate'
  ];

  static String getResponse(String text) {
    text = text.toLowerCase();
    if (doorCommands.any((command) => text.contains(command))) {
      return 'I will open the door for you';
    } else if (windowCommands.any((command) => text.contains(command))) {
      return 'I will open the window for you';
    } else if (lightCommands.any((command) => text.contains(command))) {
      return 'I will turn on the light for you';
    } else if (gateCommands.any((command) => text.contains(command))) {
      return 'I will open the gate for you';
    } else if (text.isNotEmpty) {
      // If the command is not understood and the text is not empty

      return '';
    } else {
      // For empty or partial commands, return an empty string
      return '';
    }
  }
}
