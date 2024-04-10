// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;

Future<String> obterFraseAleatoriaAction() async {
  // Adicione seu código de função aqui!
  final collection = FirebaseFirestore.instance.collection('phrases');
  final querySnapshot = await collection.get();
  final totalFrases = querySnapshot.docs.length;

  // Verifica se a coleção está vazia e retorna uma mensagem de erro se verdadeiro
  if (totalFrases == 0) {
    return 'The books on the table';
  }

  // Gera um índice aleatório e obtém o documento correspondente
  final randomIndex = math.Random().nextInt(totalFrases);
  final randomDocSnapshot = querySnapshot.docs[randomIndex];

  // Tenta obter o campo 'text' do documento aleatório e retorna a frase
  try {
    final fraseAleatoria = randomDocSnapshot.get('text');
    return fraseAleatoria;
  } catch (e) {
    // Retorna uma mensagem de erro se o campo 'text' não existir ou houver outro erro
    return 'Erro ao obter a frase: ${e.toString()}';
  }
}
