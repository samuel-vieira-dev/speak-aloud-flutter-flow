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

Future<void> updateStreak(String userId) async {
  var usersCollection = FirebaseFirestore.instance.collection('users');
  var userDoc = usersCollection.doc(userId);
  var userData = await userDoc.get();
  var lastLessonCompletedAt = userData['lastLessonCompletedAt'].toDate();
  var offensiveDays = userData['offensiveDays'];
  var updateOffensiveDays = userData['updateOffensiveDays'].toDate();

  var nowUtc = DateTime.now().toUtc();
  var nowUserTimezone =
      nowUtc.subtract(Duration(hours: 3)); // Ajustando para UTC-3

  var lastMidnightUserTimezone = DateTime(
      nowUserTimezone.year, nowUserTimezone.month, nowUserTimezone.day);
  var nextMidnightUserTimezone =
      lastMidnightUserTimezone.add(Duration(days: 1));

  // Verifica se a última atualização foi antes da última meia-noite no fuso UTC-3
  if (updateOffensiveDays.isBefore(lastMidnightUserTimezone)) {
    // Verifica se a última lição completada foi ontem no fuso UTC-3 (o que incrementaria a ofensiva)
    if (lastLessonCompletedAt
            .isAfter(lastMidnightUserTimezone.subtract(Duration(days: 1))) &&
        lastLessonCompletedAt.isBefore(lastMidnightUserTimezone)) {
      offensiveDays += 1;
    } else {
      // Se não houve lição ontem, a ofensiva é resetada para 0
      offensiveDays = 0;
    }
    // Atualiza a data de ofensiva para agora (deve ser dentro do intervalo atual de 24 horas)
    await userDoc.update({
      'offensiveDays': offensiveDays,
      'updateOffensiveDays': nowUtc, // Armazenamos a data de atualização em UTC
    });
  } else if (nowUserTimezone.isAfter(nextMidnightUserTimezone)) {
    // Se o usuário não fez lição no dia anterior no fuso UTC-3, a ofensiva é resetada para 0
    // e a data de atualização é definida para a próxima meia-noite
    await userDoc.update({
      'offensiveDays': 0,
      'updateOffensiveDays': nowUtc, // Próxima meia-noite em UTC
    });
  }
}
