import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _showOnboarding = prefs.getBool('ff_showOnboarding') ?? _showOnboarding;
    });
    _safeInit(() {
      _firstLogin = prefs.getBool('ff_firstLogin') ?? _firstLogin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showOnboarding = false;
  bool get showOnboarding => _showOnboarding;
  set showOnboarding(bool _value) {
    _showOnboarding = _value;
    prefs.setBool('ff_showOnboarding', _value);
  }

  bool _firstLogin = true;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool _value) {
    _firstLogin = _value;
    prefs.setBool('ff_firstLogin', _value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
