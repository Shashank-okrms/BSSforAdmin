import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/confirm_confirm/confirm_confirm_widget.dart';
import '/pages/empty/empty_widget.dart';
import '/pages/no_facility/no_facility_widget.dart';
import '/pages/nobooking/nobooking_widget.dart';
import '/pages/notifications/notifications_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_pages_model.dart';
export 'all_pages_model.dart';

class AllPagesWidget extends StatefulWidget {
  const AllPagesWidget({
    super.key,
    Color? btnclr,
    Color? btntxt,
    int? tabbarpageindex,
  })  : this.btnclr = btnclr ?? const Color(0xFF4A456B),
        this.btntxt = btntxt ?? Colors.white,
        this.tabbarpageindex = tabbarpageindex ?? 0;

  final Color btnclr;
  final Color btntxt;
  final int tabbarpageindex;

  @override
  State<AllPagesWidget> createState() => _AllPagesWidgetState();
}

class _AllPagesWidgetState extends State<AllPagesWidget>
    with TickerProviderStateMixin {
  late AllPagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllPagesModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabbarpageindex,
            0,
          ),
          4),
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.romtypeController ??= TextEditingController();
    _model.romtypeFocusNode ??= FocusNode();

    _model.priController ??= TextEditingController();
    _model.priFocusNode ??= FocusNode();

    _model.noController ??= TextEditingController();
    _model.noFocusNode ??= FocusNode();
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<NotificationsRecord>>(
                  stream: queryNotificationsRecord(
                    queryBuilder: (notificationsRecord) =>
                        notificationsRecord.where(
                      'city',
                      isEqualTo:
                          valueOrDefault(currentUserDocument?.selectedCity, ''),
                    ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<NotificationsRecord> stackNotificationsRecordList =
                        snapshot.data!;
                    final stackNotificationsRecord =
                        stackNotificationsRecordList.isNotEmpty
                            ? stackNotificationsRecordList.first
                            : null;
                    return Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.9, 0.71),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: NotificationsWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: FaIcon(
                                FontAwesomeIcons.solidBell,
                                color: Colors.black,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                        if (stackNotificationsRecord?.city ==
                                valueOrDefault(
                                    currentUserDocument?.selectedCity, '')
                            ? (stackNotificationsRecord != null)
                            : true)
                          Align(
                            alignment: AlignmentDirectional(0.83, 0.02),
                            child: Icon(
                              Icons.circle,
                              color: FlutterFlowTheme.of(context).error,
                              size: 15.0,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/220px-BSS_logo[1]_(1).png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(-1.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: false,
                          isScrollable: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                  ),
                          unselectedLabelStyle: TextStyle(),
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor: Color(0xFF322E5C),
                          backgroundColor: Color(0xFF322E5C),
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          borderColor: Colors.transparent,
                          unselectedBorderColor:
                              FlutterFlowTheme.of(context).primaryText,
                          borderWidth: 2.0,
                          borderRadius: 25.0,
                          elevation: 0.0,
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          buttonMargin: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Tab(
                              text: 'Events',
                            ),
                            Tab(
                              text: 'Facilites',
                            ),
                            Tab(
                              text: 'Confirmed',
                            ),
                            Tab(
                              text: 'Rooms',
                            ),
                            Tab(
                              text: 'Log Out',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
                              () async {},
                              () async {},
                              () async {},
                              () async {},
                              () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth('Login', context.mounted);
                              }
                            ][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  FutureBuilder<List<NotificationsRecord>>(
                                future: queryNotificationsRecordOnce(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<NotificationsRecord>
                                      columnNotificationsRecordList =
                                      snapshot.data!;
                                  final columnNotificationsRecord =
                                      columnNotificationsRecordList.isNotEmpty
                                          ? columnNotificationsRecordList.first
                                          : null;
                                  return SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 0.0, 12.0),
                                          child: Text(
                                            'Events',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'SuperTall',
                                                  color: Color(0xFFEC7834),
                                                  fontSize: 32.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  setState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  _model.uploadedFileUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/admin-for-b-s-s-lqnr1b/assets/jevcssjgx3hn/DSC_1489.jpg',
                                                ),
                                                width: 350.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Click the photo to change',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Raleway',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller: _model.textController1,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Event Name',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        color:
                                                            Color(0xFF31577A),
                                                        fontSize: 16.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE3DADA),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE58E6B),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                ),
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 0.0, 12.0),
                                          child: Text(
                                            'Date & Time',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Raleway',
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await showModalBottomSheet<
                                                        bool>(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            3,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child:
                                                            CupertinoDatePicker(
                                                          mode:
                                                              CupertinoDatePickerMode
                                                                  .dateAndTime,
                                                          minimumDate:
                                                              getCurrentTimestamp,
                                                          initialDateTime:
                                                              getCurrentTimestamp,
                                                          maximumDate:
                                                              DateTime(2050),
                                                          use24hFormat: false,
                                                          onDateTimeChanged:
                                                              (newDateTime) =>
                                                                  safeSetState(
                                                                      () {
                                                            _model.datePicked =
                                                                newDateTime;
                                                          }),
                                                        ),
                                                      );
                                                    });
                                              },
                                              text: 'Pick Date & Time',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Color(0xFFD3C5C5),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                  'MMMM,EEEE d  h:mm a',
                                                  _model.datePicked),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Raleway',
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await EventsRecord.collection
                                                    .doc()
                                                    .set(createEventsRecordData(
                                                      eventName: _model
                                                          .textController1.text,
                                                      eventLocation:
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.selectedCity,
                                                              ''),
                                                      eventPhoto: _model
                                                          .uploadedFileUrl,
                                                      eventDateTime:
                                                          _model.datePicked,
                                                    ));
                                                setState(() {
                                                  _model.textController1
                                                      ?.clear();
                                                });
                                                setState(() {
                                                  _model.isDataUploading =
                                                      false;
                                                  _model.uploadedLocalFile =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl = '';
                                                });
                                              },
                                              text: 'Create Event',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF322E5C),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: Text(
                                                    'All Events',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          color: Colors.black,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      StreamBuilder<
                                                          List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                        'event_location',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.selectedCity,
                                                            ''),
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          listViewEventsRecordList =
                                                          snapshot.data!;
                                                      if (listViewEventsRecordList
                                                          .isEmpty) {
                                                        return EmptyWidget();
                                                      }
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewEventsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewEventsRecord =
                                                              listViewEventsRecordList[
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          listViewEventsRecord
                                                                              .eventPhoto,
                                                                          width:
                                                                              180.0,
                                                                          height:
                                                                              150.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          listViewEventsRecord
                                                                              .eventName
                                                                              .maybeHandleOverflow(maxChars: 25),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Raleway',
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                          minFontSize:
                                                                              18.0,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          listViewEventsRecord
                                                                              .eventLocation,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Raleway',
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat('MMMM,EEEE d',
                                                                                listViewEventsRecord.eventDateTime),
                                                                            'Date Time',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Raleway',
                                                                                color: Color(0xFF404347),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w800,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat('h:mm a',
                                                                                listViewEventsRecord.eventDateTime),
                                                                            'Date Time',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Raleway',
                                                                                color: Color(0xFF404347),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w800,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          await listViewEventsRecord
                                                                              .reference
                                                                              .delete();
                                                                        },
                                                                        text:
                                                                            'Delete',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFFFF0005),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Colors.white,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  FutureBuilder<List<NotificationsRecord>>(
                                future: queryNotificationsRecordOnce(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<NotificationsRecord>
                                      columnNotificationsRecordList =
                                      snapshot.data!;
                                  final columnNotificationsRecord =
                                      columnNotificationsRecordList.isNotEmpty
                                          ? columnNotificationsRecordList.first
                                          : null;
                                  return SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  'Facilities',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'SuperTall',
                                                        color:
                                                            Color(0xFFEC7834),
                                                        fontSize: 32.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 20.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.selectedCity,
                                                          ''),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Raleway',
                                                            color: Color(
                                                                0xFF2F2F2F),
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 20.0),
                                                  child: Text(
                                                    'Select the booking to continue...',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          color:
                                                              Color(0xFF2F2F2F),
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              StreamBuilder<
                                                                  List<
                                                                      FacilitiesRecord>>(
                                                            stream:
                                                                queryFacilitiesRecord(
                                                              queryBuilder:
                                                                  (facilitiesRecord) =>
                                                                      facilitiesRecord
                                                                          .where(
                                                                'facility_city',
                                                                isEqualTo: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.selectedCity,
                                                                    ''),
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<FacilitiesRecord>
                                                                  listViewFacilitiesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              if (listViewFacilitiesRecordList
                                                                  .isEmpty) {
                                                                return NobookingWidget();
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewFacilitiesRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewFacilitiesRecord =
                                                                      listViewFacilitiesRecordList[
                                                                          listViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: ConfirmConfirmWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewFacilitiesRecord.facilityCity,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  color: Color(0xFF2F2F2F),
                                                                                  fontSize: 22.0,
                                                                                  fontWeight: FontWeight.w800,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewFacilitiesRecord.guestFacility,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  color: Color(0xFF2F2F2F),
                                                                                  fontSize: 22.0,
                                                                                  fontWeight: FontWeight.w800,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewFacilitiesRecord.guestName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  color: Color(0xFF2F2F2F),
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            listViewFacilitiesRecord.guestNumber.maybeHandleOverflow(
                                                                              maxChars: 20,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  color: Color(0xFF2F2F2F),
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                            minFontSize:
                                                                                18.0,
                                                                          ),
                                                                          Text(
                                                                            listViewFacilitiesRecord.guestEmail,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  color: Color(0xFF2F2F2F),
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewFacilitiesRecord.facilityDate,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Raleway',
                                                                                  color: Color(0xFF2F2F2F),
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
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
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  FutureBuilder<List<NotificationsRecord>>(
                                future: queryNotificationsRecordOnce(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<NotificationsRecord>
                                      columnNotificationsRecordList =
                                      snapshot.data!;
                                  final columnNotificationsRecord =
                                      columnNotificationsRecordList.isNotEmpty
                                          ? columnNotificationsRecordList.first
                                          : null;
                                  return SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 12.0, 0.0, 12.0),
                                                child: Text(
                                                  'Confirmed',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'SuperTall',
                                                        color:
                                                            Color(0xFFEC7834),
                                                        fontSize: 32.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              StreamBuilder<
                                                                  List<
                                                                      ConFacilityRecord>>(
                                                            stream:
                                                                queryConFacilityRecord(
                                                              queryBuilder:
                                                                  (conFacilityRecord) =>
                                                                      conFacilityRecord
                                                                          .where(
                                                                'con_facility_city',
                                                                isEqualTo: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.selectedCity,
                                                                    ''),
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ConFacilityRecord>
                                                                  listViewConFacilityRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              if (listViewConFacilityRecordList
                                                                  .isEmpty) {
                                                                return NoFacilityWidget();
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewConFacilityRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewConFacilityRecord =
                                                                      listViewConFacilityRecordList[
                                                                          listViewIndex];
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              listViewConFacilityRecord.conFacilityCity,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    color: Color(0xFF2F2F2F),
                                                                                    fontSize: 22.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Text(
                                                                                listViewConFacilityRecord.conGuestFacility,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Colors.black,
                                                                                      fontSize: 20.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Text(
                                                                                listViewConFacilityRecord.conGuestName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Color(0xFF2F2F2F),
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Text(
                                                                                listViewConFacilityRecord.conGuestEmail,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Color(0xFF2F2F2F),
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Text(
                                                                                listViewConFacilityRecord.conGuestNumber,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Color(0xFF2F2F2F),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Text(
                                                                                listViewConFacilityRecord.conFacilityDate,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Color(0xFF2F2F2F),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await listViewConFacilityRecord.reference.delete();
                                                                              _model.apiResulttlt = await CancelCall.call(
                                                                                email: listViewConFacilityRecord.conGuestEmail,
                                                                              );
                                                                              if ((_model.apiResulttlt?.succeeded ?? true)) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Please Wait',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Raleway',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: Colors.transparent,
                                                                                  ),
                                                                                );
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            text:
                                                                                'Cancel',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.w800,
                                                                                  ),
                                                                              elevation: 3.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  FutureBuilder<List<NotificationsRecord>>(
                                future: queryNotificationsRecordOnce(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<NotificationsRecord>
                                      columnNotificationsRecordList =
                                      snapshot.data!;
                                  final columnNotificationsRecord =
                                      columnNotificationsRecordList.isNotEmpty
                                          ? columnNotificationsRecordList.first
                                          : null;
                                  return SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 0.0, 12.0),
                                          child: Text(
                                            'Rooms',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'SuperTall',
                                                  color: Color(0xFFEC7834),
                                                  fontSize: 32.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller:
                                                _model.romtypeController,
                                            focusNode: _model.romtypeFocusNode,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Room Type',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xFF4A456B),
                                                        fontSize: 16.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE3DADA),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE58E6B),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                ),
                                            validator: _model
                                                .romtypeControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller: _model.priController,
                                            focusNode: _model.priFocusNode,
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Price',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xFF4A456B),
                                                        fontSize: 16.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE3DADA),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE58E6B),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .priControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller: _model.noController,
                                            focusNode: _model.noFocusNode,
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Number of rooms Available',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xFF4A456B),
                                                        fontSize: 16.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE3DADA),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE58E6B),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .noControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await RoomsRecord.collection
                                                    .doc()
                                                    .set(createRoomsRecordData(
                                                      price: double.tryParse(
                                                          _model.priController
                                                              .text),
                                                      city: valueOrDefault(
                                                          currentUserDocument
                                                              ?.selectedCity,
                                                          ''),
                                                      roomType: _model
                                                          .romtypeController
                                                          .text,
                                                      no: double.tryParse(_model
                                                          .noController.text),
                                                    ));

                                                context.pushNamed(
                                                  'all_pages',
                                                  queryParameters: {
                                                    'tabbarpageindex':
                                                        serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 600),
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Make Room',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF4A456B),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
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
