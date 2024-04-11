// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

Future<dynamic> speechAceRequest(
    String audioUrl, String text, String userId) async {
  try {
    // Lê o arquivo de áudio como bytes
    print('AUDIO URL');
    print(audioUrl);
    File audioFile = File(audioUrl);
    print('AUDIO FILE');
    print(audioFile);
    var audioBytes = await audioFile.readAsBytes();
    print('AUDIO BYTES');
    print(audioBytes);
    // Cria um MultipartFile a partir dos bytes do arquivo
    var multipartFile = MultipartFile.fromBytes(
      'user_audio_file',
      audioBytes,
      filename: 'audio.mp3', // Nome do arquivo
    );
    print('MULTIPARTFILE');
    print(multipartFile);
    // Cria o FormData e anexa o MultipartFile e os outros campos
    var request = MultipartRequest(
      'POST',
      Uri.parse(
          'https://warm-caverns-48629-92fab798385f.herokuapp.com/https://api.speechace.co/api/scoring/text/v9/json?key=QkY5kzFVjyOTTKKxCpsubNJb0FScjl83l3vOnnxgzxoe2sStMAVyfh4SOo1dSTpPDd6raan9pRX6j20EhNJ5ukQ9IhPRijMveOSt18RdyaTAVf3s7mT32llA%2FSlEofBY&dialect=en-us&user_id=$userId'),
    );
    request.files.add(multipartFile);
    request.fields['text'] = text;
    request.fields['include_unknown_words'] = '1';

    print('REQUEST');
    print(request);
    // Envia a requisição
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Upload bem-sucedido');
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('Falha no upload: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao enviar o arquivo: $e');
  }
}
