// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_tts/flutter_tts.dart';

Future talkToMe(String text) async {
  // Create a TTS object
  FlutterTts flutterTts = FlutterTts();

  // Set language to English. This will use the default English voice.
  await flutterTts.setLanguage("en-US");

  // Optionally, adjust the speech rate and pitch.
  // The default values are usually fine for most cases.
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setPitch(0.7);

  // Speak
  await flutterTts.speak(text);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
