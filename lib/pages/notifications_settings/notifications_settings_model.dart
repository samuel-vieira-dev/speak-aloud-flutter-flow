import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'notifications_settings_widget.dart' show NotificationsSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsSettingsModel
    extends FlutterFlowModel<NotificationsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for switchPushNotifications widget.
  bool? switchPushNotificationsValue;
  // State field(s) for switchEmail widget.
  bool? switchEmailValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
