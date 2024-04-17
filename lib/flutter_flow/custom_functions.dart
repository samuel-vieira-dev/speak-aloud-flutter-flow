import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String processWordScoreListToHtml(List<dynamic>? wordScoreList) {
  if (wordScoreList == null) return "";

  var htmlString =
      '<div style="text-align: center; font-weight: bold; font-size: 14px; word-wrap: break-word;">';

  for (var wordScore in wordScoreList) {
    for (var syllable in wordScore['syllable_score_list']) {
      var score = syllable['quality_score'];
      var color = score >= 90
          ? '#4B986C'
          : score >= 75
              ? '#F3C344'
              : '#C4454D';

      htmlString +=
          "<span style='color: $color;'>${syllable['letters']}</span>";
    }
    htmlString += " "; // Espaço entre as palavras
  }

  htmlString += '</div>';
  return htmlString;
}

bool isTextFieldEmpty(String? text) {
  if (text == null || text == '' || text == ' ') {
    return true;
  }
  return false;
}

String calcularMediaAjustada(List<int> listaNotas) {
  // Verifica se a lista está vazia para evitar divisão por zero
  if (listaNotas.isEmpty) {
    return "0.0";
  }

  // Calcula a soma de todos os valores na lista
  int somaTotal = listaNotas.fold(0, (soma, nota) => soma + nota);

  // Calcula a média dos valores na escala de 0 a 100
  double mediaOriginal = somaTotal / listaNotas.length;

  // Ajusta a média para a escala de 0.0 a 5.0
  double mediaAjustada = (mediaOriginal * 5) / 100;

  // Arredonda para uma casa decimal e retorna como string
  return mediaAjustada.toStringAsFixed(1);
}

bool hasOffensiveUpdate(int updateOffensiveDaysTimestamp) {
// Obtenha o timestamp atual
  int dateNowTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch;

// Compare com o timestamp de updateOffensiveDays
  //int updateOffensiveDaysTimestamp;  Este seria o valor recuperado do seu banco de dados

// Calcule a diferença em milissegundos
  int difference = dateNowTimestamp - updateOffensiveDaysTimestamp;

// Defina o número de milissegundos em 24 horas
  int twentyFourHoursInMilliseconds = 24 * 60 * 60 * 1000;

// Verifique se a diferença é menor ou igual a 24 horas
  bool offensiveUpdatedInLast24Hours =
      difference <= twentyFourHoursInMilliseconds;

  return offensiveUpdatedInLast24Hours;

// Use essa booleana para decidir se incrementa, mantém ou zera o contador
}

bool hasLoginInLast24hours(int lastLoginTimestamp) {
  // Obtenha o timestamp atual
  int dateNowTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch;

  // Calcule a diferença em milissegundos
  int difference = dateNowTimestamp - lastLoginTimestamp;

  // Defina o número de milissegundos em 24 horas
  int twentyFourHoursInMilliseconds = 24 * 60 * 60 * 1000;

  // Verifica se tem login nas ultimas 24 horas
  bool loginInLast24Hours = difference <= twentyFourHoursInMilliseconds;

  return loginInLast24Hours;
}
