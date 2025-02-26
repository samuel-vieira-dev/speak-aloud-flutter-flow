import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'assesment_widget.dart' show AssesmentWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class AssesmentModel extends FlutterFlowModel<AssesmentWidget> {
  ///  Local state fields for this page.

  bool audioRecording = false;

  bool isAssessmentDone = false;

  int? scoreValue;

  List<dynamic> wordScoreList = [];
  void addToWordScoreList(dynamic item) => wordScoreList.add(item);
  void removeFromWordScoreList(dynamic item) => wordScoreList.remove(item);
  void removeAtIndexFromWordScoreList(int index) =>
      wordScoreList.removeAt(index);
  void insertAtIndexInWordScoreList(int index, dynamic item) =>
      wordScoreList.insert(index, item);
  void updateWordScoreListAtIndex(int index, Function(dynamic) updateFn) =>
      wordScoreList[index] = updateFn(wordScoreList[index]);

  bool isAssessmentSuccess = false;

  String? wordsWithError;

  String? fullWords;

  bool isTextSaved = false;

  bool isAssessmentLoading = false;

  String? wordsWithErrorTitle;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for textFieldAssesment widget.
  FocusNode? textFieldAssesmentFocusNode;
  TextEditingController? textFieldAssesmentTextController;
  String? Function(BuildContext, String?)?
      textFieldAssesmentTextControllerValidator;
  // Stores action output result for [Backend Call - API (ValidateTextAPI)] action in IconButton widget.
  ApiCallResponse? validateTextResult;
  // Stores action output result for [Custom Action - isAssessmentSuccess] action in IconButton widget.
  bool? isValidateSuccess;
  // Stores action output result for [Custom Action - obterFraseAleatoriaAction] action in RandomPhraseButton widget.
  String? fraseAleatoria;
  // State field(s) for RecordTimer widget.
  int recordTimerMilliseconds = 0;
  String recordTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController recordTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  AudioRecorder? audioRecorder;
  String? audiorecord;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Cloud Function - speechAceIntermediary] action in stopRecording widget.
  SpeechAceIntermediaryCloudFunctionCallResponse? speechaceIntermediaryResponse;
  // Stores action output result for [Custom Action - isAssessmentSuccess] action in stopRecording widget.
  bool? isSuccess;
  // Stores action output result for [Custom Action - getScoreText] action in stopRecording widget.
  String? scoreText;
  // Stores action output result for [Custom Action - getScoreTitle] action in stopRecording widget.
  String? scoreTitle;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldAssesmentFocusNode?.dispose();
    textFieldAssesmentTextController?.dispose();

    recordTimerController.dispose();
  }
}
