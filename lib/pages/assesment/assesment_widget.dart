import '/auth/firebase_auth/auth_util.dart';
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
import 'assesment_model.dart';
export 'assesment_model.dart';

class AssesmentWidget extends StatefulWidget {
  const AssesmentWidget({super.key});

  @override
  State<AssesmentWidget> createState() => _AssesmentWidgetState();
}

class _AssesmentWidgetState extends State<AssesmentWidget>
    with TickerProviderStateMixin {
  late AssesmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconTriggered2 = false;
  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 1000.ms,
          begin: Offset(-10.0, 0.0),
          end: Offset(20.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 1150.ms,
          duration: 1000.ms,
          begin: Offset(20.0, 0.0),
          end: Offset(-10.0, 0.0),
        ),
      ],
    ),
    'iconOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FlipEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 850.ms,
          begin: 1.0,
          end: 2.0,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ShakeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 1870.ms,
          hz: 12,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssesmentModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'assesment'});
    _model.textFieldAssesmentController ??= TextEditingController();
    _model.textFieldAssesmentFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/vnimc_1.png',
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ASSESMENT_PAGE_Stack_fe4j3aej_ON_TAP');
                                      logFirebaseEvent(
                                          'Stack_update_page_state');
                                      setState(() {
                                        _model.isTextSaved = false;
                                      });
                                    },
                                    child: Container(
                                      height: 50.0,
                                      child: Stack(
                                        children: [
                                          if ((!_model.isAssessmentDone ||
                                                  !_model
                                                      .isAssessmentSuccess) &&
                                              !_model.isTextSaved)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textFieldAssesmentController,
                                                  focusNode: _model
                                                      .textFieldAssesmentFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textFieldAssesmentController',
                                                    Duration(milliseconds: 0),
                                                    () async {
                                                      logFirebaseEvent(
                                                          'ASSESMENT_textFieldAssesment_ON_TEXTFIEL');
                                                      logFirebaseEvent(
                                                          'textFieldAssesment_update_page_state');
                                                      setState(() {
                                                        _model.isAssessmentDone =
                                                            false;
                                                        _model.wordsWithError =
                                                            _model
                                                                .textFieldAssesmentController
                                                                .text;
                                                        _model.isTextSaved =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    alignLabelWithHint: false,
                                                    hintText:
                                                        'Clique para escrever a frase',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    suffixIcon: Icon(
                                                      Icons.edit,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 3,
                                                  minLines: 1,
                                                  validator: _model
                                                      .textFieldAssesmentControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          if (_model.isAssessmentDone &&
                                              _model.isAssessmentSuccess)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ASSESMENT_PAGE_HtmlViewResult_ON_TAP');
                                                logFirebaseEvent(
                                                    'HtmlViewResult_update_page_state');
                                                setState(() {
                                                  _model.isAssessmentDone =
                                                      false;
                                                });
                                              },
                                              child: Html(
                                                data: functions
                                                    .processWordScoreListToHtml(
                                                        _model.wordScoreList
                                                            .toList()),
                                                onLinkTap: (url, _, __, ___) =>
                                                    launchURL(url!),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.isAssessmentDone ||
                                    _model.isAssessmentLoading)
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FF9300),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            if (_model.isAssessmentSuccess &&
                                                !_model.isAssessmentLoading)
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF6E7B6),
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (_model
                                                                  .scoreTitle ==
                                                              'Muito bem')
                                                            Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/muitobom-removebg-preview.png',
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${_model.scoreValue?.toString()}%',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w900,
                                                                            lineHeight:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (_model
                                                                  .scoreTitle ==
                                                              'Quase lá')
                                                            Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/qausela-removebg-preview.png',
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${_model.scoreValue?.toString()}%',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w900,
                                                                            lineHeight:
                                                                                2.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (_model
                                                                  .scoreTitle ==
                                                              'Dá pra melhorar')
                                                            Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/ruim-removebg-preview.png',
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${_model.scoreValue?.toString()}%',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w900,
                                                                            lineHeight:
                                                                                2.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              _model.scoreTitle,
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .scoreText,
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (!_model.isAssessmentSuccess &&
                                                !_model.isAssessmentLoading)
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0x32FF9300),
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor:
                                                              Color(0x004B986C),
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 50.0,
                                                          fillColor:
                                                              Color(0x00C4454D),
                                                          icon: Icon(
                                                            Icons.error_outline,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Ops, ocorreu algum erro 😥',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      getJsonField(
                                                                        _model
                                                                            .speechaceIntermediaryResponse!
                                                                            .jsonBody,
                                                                        r'''$.detail_message''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.isAssessmentLoading)
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              CircularPercentIndicator(
                                                            percent: 0.8,
                                                            radius: 30.0,
                                                            lineWidth: 4.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                          ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'progressBarOnPageLoadAnimation']!),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Analisando áudio...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation']!),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_model.isAssessmentDone)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.restart_alt_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ASSESMENT_restart_alt_sharp_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          setState(() {
                                            _model.isAssessmentDone = false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ASSESMENT_PAGE_RandomPhraseButton_ON_TAP');
                                    logFirebaseEvent(
                                        'RandomPhraseButton_custom_action');
                                    _model.fraseAleatoria = await actions
                                        .obterFraseAleatoriaAction();
                                    logFirebaseEvent(
                                        'RandomPhraseButton_set_form_field');
                                    setState(() {
                                      _model.textFieldAssesmentController
                                          ?.text = valueOrDefault<String>(
                                        _model.fraseAleatoria,
                                        'test',
                                      );
                                    });
                                    logFirebaseEvent(
                                        'RandomPhraseButton_widget_animation');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation1'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation1']!
                                          .controller
                                          .forward();
                                    }
                                    logFirebaseEvent(
                                        'RandomPhraseButton_update_page_state');
                                    setState(() {
                                      _model.isAssessmentDone = false;
                                      _model.isTextSaved = false;
                                    });

                                    setState(() {});
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.exchangeAlt,
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    size: 25.0,
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation1']!,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_model.audioRecording)
                                      FlutterFlowTimer(
                                        initialTime:
                                            _model.recordTimerMilliseconds,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller:
                                            _model.recordTimerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.recordTimerMilliseconds =
                                              value;
                                          _model.recordTimerValue = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Playfair Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    if (!_model.audioRecording)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ASSESMENT_startRecordingButton_ON_TAP');
                                          logFirebaseEvent(
                                              'startRecordingButton_request_permissions');
                                          await requestPermission(
                                              microphonePermission);
                                          if (!((await getPermissionStatus(
                                                  microphonePermission)) &&
                                              !functions.isTextFieldEmpty(_model
                                                  .textFieldAssesmentController
                                                  .text))) {
                                            return;
                                          }
                                          logFirebaseEvent(
                                              'startRecordingButton_update_page_state');
                                          setState(() {
                                            _model.audioRecording = true;
                                          });
                                          logFirebaseEvent(
                                              'startRecordingButton_update_page_state');
                                          setState(() {
                                            _model.isAssessmentDone = false;
                                          });
                                          if (_model.audioRecording == true) {
                                            logFirebaseEvent(
                                                'startRecordingButton_timer');
                                            _model.recordTimerController
                                                .onStartTimer();
                                            logFirebaseEvent(
                                                'startRecordingButton_start_audio_recordi');
                                            await startAudioRecording(
                                              context,
                                              audioRecorder:
                                                  _model.audioRecorder ??=
                                                      AudioRecorder(),
                                            );
                                          } else {
                                            return;
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/micWBackground-removebg-preview.png',
                                            width: 70.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (_model.audioRecording)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ASSESMENT_PAGE_stopRecording_ON_TAP');
                                          var _shouldSetState = false;
                                          logFirebaseEvent(
                                              'stopRecording_stop_audio_recording');
                                          await stopAudioRecording(
                                            audioRecorder: _model.audioRecorder,
                                            audioName: 'recordedFileBytes.mp3',
                                            onRecordingComplete:
                                                (audioFilePath, audioBytes) {
                                              _model.audiorecord =
                                                  audioFilePath;
                                              _model.recordedFileBytes =
                                                  audioBytes;
                                            },
                                          );

                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'stopRecording_timer');
                                          _model.recordTimerController
                                              .onResetTimer();

                                          logFirebaseEvent(
                                              'stopRecording_update_page_state');
                                          setState(() {
                                            _model.audioRecording = false;
                                            _model.isAssessmentLoading = true;
                                          });
                                          logFirebaseEvent(
                                              'stopRecording_upload_file_to_firebase');
                                          {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedFiles =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .recordedFileBytes
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.recordedFileBytes]
                                                  : <FFUploadedFile>[];
                                              selectedFiles =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                              );
                                              downloadUrls = (await Future.wait(
                                                selectedFiles.map(
                                                  (f) async => await uploadData(
                                                      f.storagePath, f.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedFiles.length &&
                                                downloadUrls.length ==
                                                    selectedFiles.length) {
                                              setState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }

                                          logFirebaseEvent(
                                              'stopRecording_cloud_function');
                                          try {
                                            final result =
                                                await FirebaseFunctions
                                                        .instanceFor(
                                                            region: 'us-west1')
                                                    .httpsCallable(
                                                        'speechAceIntermediary')
                                                    .call({
                                              "uploadURL":
                                                  _model.uploadedFileUrl,
                                              "text": _model
                                                  .textFieldAssesmentController
                                                  .text,
                                              "userId": currentUserUid,
                                            });
                                            _model.speechaceIntermediaryResponse =
                                                SpeechAceIntermediaryCloudFunctionCallResponse(
                                              data: result.data,
                                              succeeded: true,
                                              resultAsString:
                                                  result.data.toString(),
                                              jsonBody: result.data,
                                            );
                                          } on FirebaseFunctionsException catch (error) {
                                            _model.speechaceIntermediaryResponse =
                                                SpeechAceIntermediaryCloudFunctionCallResponse(
                                              errorCode: error.code,
                                              succeeded: false,
                                            );
                                          }

                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'stopRecording_custom_action');
                                          _model.isSuccess =
                                              await actions.isAssessmentSuccess(
                                            getJsonField(
                                              _model
                                                  .speechaceIntermediaryResponse!
                                                  .jsonBody,
                                              r'''$.data.status''',
                                            ).toString(),
                                          );
                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'stopRecording_update_page_state');
                                          setState(() {
                                            _model.isAssessmentDone = true;
                                          });
                                          if (!_model.isSuccess!) {
                                            logFirebaseEvent(
                                                'stopRecording_update_page_state');
                                            setState(() {
                                              _model.isAssessmentSuccess =
                                                  false;
                                              _model.isAssessmentLoading =
                                                  false;
                                            });
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                          logFirebaseEvent(
                                              'stopRecording_update_page_state');
                                          setState(() {
                                            _model.scoreValue = getJsonField(
                                              _model
                                                  .speechaceIntermediaryResponse
                                                  ?.jsonBody,
                                              r'''$.data.text_score.speechace_score.pronunciation''',
                                            );
                                            _model.wordScoreList = getJsonField(
                                              _model
                                                  .speechaceIntermediaryResponse!
                                                  .jsonBody,
                                              r'''$.data.text_score.word_score_list''',
                                              true,
                                            )!
                                                .toList()
                                                .cast<dynamic>();
                                            _model.isAssessmentSuccess = true;
                                            _model.isAssessmentLoading = false;
                                          });
                                          logFirebaseEvent(
                                              'stopRecording_custom_action');
                                          _model.scoreText =
                                              await actions.getScoreText(
                                            getJsonField(
                                              _model
                                                  .speechaceIntermediaryResponse!
                                                  .jsonBody,
                                              r'''$.data.text_score.speechace_score.pronunciation''',
                                            ),
                                          );
                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'stopRecording_custom_action');
                                          _model.scoreTitle =
                                              await actions.getScoreTitle(
                                            getJsonField(
                                              _model
                                                  .speechaceIntermediaryResponse!
                                                  .jsonBody,
                                              r'''$.data.text_score.speechace_score.pronunciation''',
                                            ),
                                          );
                                          _shouldSetState = true;
                                          // Update Score and Date Lesson
                                          logFirebaseEvent(
                                              'stopRecording_UpdateScoreandDateLesson');

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'averageScore':
                                                    FieldValue.arrayUnion(
                                                        [_model.scoreValue]),
                                                'lastLessonCompletedAt':
                                                    FieldValue
                                                        .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          if (functions.hasOffensiveUpdate(
                                                  currentUserDocument!
                                                      .updateOffensiveDays!
                                                      .millisecondsSinceEpoch) ==
                                              false) {
                                            // offensiveDays+1
                                            logFirebaseEvent(
                                                'stopRecording_offensiveDays+1');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'offensiveDays':
                                                      FieldValue.increment(1),
                                                  'updateOffensiveDays':
                                                      FieldValue
                                                          .serverTimestamp(),
                                                },
                                              ),
                                            });
                                          } else {
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/stopAudioBackground_(1).png',
                                            width: 70.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ASSESMENT_PAGE_TTSButton_ON_TAP');
                                        logFirebaseEvent(
                                            'TTSButton_widget_animation');
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation2'] !=
                                            null) {
                                          setState(
                                              () => hasIconTriggered2 = true);
                                          SchedulerBinding.instance
                                              .addPostFrameCallback((_) async =>
                                                  await animationsMap[
                                                          'iconOnActionTriggerAnimation2']!
                                                      .controller
                                                      .forward(from: 0.0));
                                        }
                                        logFirebaseEvent(
                                            'TTSButton_custom_action');
                                        await actions.talkToMe(
                                          _model.textFieldAssesmentController
                                              .text,
                                        );
                                      },
                                      child: Icon(
                                        Icons.volume_up,
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                        size: 30.0,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'iconOnActionTriggerAnimation2']!,
                                        hasBeenTriggered: hasIconTriggered2),
                                  ],
                                ),
                              ].divide(SizedBox(width: 50.0)),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 0.0))
                          .addToStart(SizedBox(height: 0.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
