import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_confirm_model.dart';
export 'confirm_confirm_model.dart';

class ConfirmConfirmWidget extends StatefulWidget {
  const ConfirmConfirmWidget({super.key});

  @override
  State<ConfirmConfirmWidget> createState() => _ConfirmConfirmWidgetState();
}

class _ConfirmConfirmWidgetState extends State<ConfirmConfirmWidget> {
  late ConfirmConfirmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmConfirmModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: StreamBuilder<List<FacilitiesRecord>>(
        stream: queryFacilitiesRecord(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: Color(0xFF322E5C),
                  size: 50.0,
                ),
              ),
            );
          }
          List<FacilitiesRecord> bottomSheetEditFacilitiesRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final bottomSheetEditFacilitiesRecord =
              bottomSheetEditFacilitiesRecordList.isNotEmpty
                  ? bottomSheetEditFacilitiesRecordList.first
                  : null;
          return Container(
            width: 350.0,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x3B1D2429),
                  offset: Offset(0.0, -3.0),
                )
              ],
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Are you sure to continue with this option?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Raleway',
                          color: Color(0xFF2F2F2F),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('Button_backend_call');

                        await ConFacilityRecord.collection
                            .doc()
                            .set(createConFacilityRecordData(
                              conGuestName:
                                  bottomSheetEditFacilitiesRecord?.guestName,
                              conGuestFacility: bottomSheetEditFacilitiesRecord
                                  ?.guestFacility,
                              conGuestNumber:
                                  bottomSheetEditFacilitiesRecord?.guestNumber,
                              conFacilityDate:
                                  bottomSheetEditFacilitiesRecord?.facilityDate,
                              conFacilityCity:
                                  bottomSheetEditFacilitiesRecord?.facilityCity,
                              conGuestEmail:
                                  bottomSheetEditFacilitiesRecord?.guestEmail,
                            ));
                        logFirebaseEvent('Button_backend_call');
                        unawaited(
                          () async {
                            _model.conf = await ConfirmCall.call(
                              email:
                                  bottomSheetEditFacilitiesRecord?.guestEmail,
                            );
                          }(),
                        );
                        logFirebaseEvent('Button_backend_call');
                        await bottomSheetEditFacilitiesRecord!.reference
                            .delete();
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed(
                          'all_pages',
                          queryParameters: {
                            'tabbarpageindex': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 600),
                            ),
                          },
                        );

                        setState(() {});
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).success,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFF14181B),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('Button_backend_call');
                        unawaited(
                          () async {
                            _model.canc = await CancelCall.call(
                              email:
                                  bottomSheetEditFacilitiesRecord?.guestEmail,
                            );
                          }(),
                        );
                        logFirebaseEvent('Button_backend_call');
                        await bottomSheetEditFacilitiesRecord!.reference
                            .delete();
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed(
                          'all_pages',
                          queryParameters: {
                            'tabbarpageindex': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 600),
                            ),
                          },
                        );

                        setState(() {});
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFFFF0005),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
