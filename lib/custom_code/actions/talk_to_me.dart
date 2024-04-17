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
import 'package:audio_session/audio_session.dart';

Future<void> talkToMe(String text) async {
  // Configurar a sessão de áudio para permitir reprodução no modo silencioso
  final audioSession = await AudioSession.instance;
  await audioSession.configure(AudioSessionConfiguration.speech());
  await audioSession.setActive(true);

  FlutterTts flutterTts = FlutterTts();

  await flutterTts.setLanguage("en-US");
  await flutterTts.setSpeechRate(0.4); // Um pouco mais lento
  await flutterTts.setPitch(1.1); // Ligeiramente mais alto

  // Ajustando volume (opcional, remova se não necessário)
  await flutterTts.setVolume(0.8);

  // Listar vozes disponíveis (descomente para testar vozes)
  var voices = await flutterTts.getVoices;
  print(voices);
  await flutterTts.setVoice({"name": "en-us-x-sfg#male_2", "locale": "en-US"});

  // Falar o texto
  await flutterTts.speak(text);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
