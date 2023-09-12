import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'airports_details_model.dart';
export 'airports_details_model.dart';

class AirportsDetailsWidget extends StatefulWidget {
  const AirportsDetailsWidget({
    Key? key,
    required this.airportCode,
  }) : super(key: key);

  final String? airportCode;

  @override
  _AirportsDetailsWidgetState createState() => _AirportsDetailsWidgetState();
}

class _AirportsDetailsWidgetState extends State<AirportsDetailsWidget> {
  late AirportsDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AirportsDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firebaseAirportCount = await queryAirportsRecordCount(
        queryBuilder: (airportsRecord) =>
            airportsRecord.where('code_icao', isEqualTo: widget.airportCode),
      );
      if (_model.firebaseAirportCount == 0) {
        _model.apiResultAirportInfo =
            await FlightAwareGroup.airportInformationCall.call(
          airportCode: widget.airportCode,
        );
        if ((_model.apiResultAirportInfo?.succeeded ?? true)) {
          _model.firestoreResultAirportDocCreate =
              await actions.createAirportDocument(
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .airportCode(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString()
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .codeICAO(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .codeIATA(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            '- add to API call -',
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .name(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .type(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<double>(
              FlightAwareGroup.airportInformationCall
                  .elevation(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toDouble(),
              0.0,
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .city(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .state(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<double>(
              FlightAwareGroup.airportInformationCall.longitude(
                (_model.apiResultAirportInfo?.jsonBody ?? ''),
              ),
              0.0,
            ),
            valueOrDefault<double>(
              FlightAwareGroup.airportInformationCall.latitude(
                (_model.apiResultAirportInfo?.jsonBody ?? ''),
              ),
              0.0,
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .timezone(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .countryCode(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .wikiURL(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
            valueOrDefault<String>(
              FlightAwareGroup.airportInformationCall
                  .airportFlightsUrl(
                    (_model.apiResultAirportInfo?.jsonBody ?? ''),
                  )
                  .toString(),
              '- unavailable -',
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<AirportsRecord>(
      stream: AirportsRecord.getDocument(
          functions.getAirportsDocReference(widget.airportCode!)),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).accent3,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
            ),
          );
        }
        final airportsDetailsAirportsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).accent3,
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.drawerMenuModel,
                updateCallback: () => setState(() {}),
                child: DrawerMenuWidget(),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_left,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: HeaderWidget(
                  pageTitle: 'Airport Details',
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryBackground,
                      FlutterFlowTheme.of(context).accent3
                    ],
                    stops: [0.7, 0.9],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return (MediaQuery.sizeOf(context).width * 0.8);
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return MediaQuery.sizeOf(context).width;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return MediaQuery.sizeOf(context).width;
                              } else {
                                return MediaQuery.sizeOf(context).width;
                              }
                            }(),
                            decoration: BoxDecoration(),
                            child: AutoSizeText(
                              airportsDetailsAirportsRecord.name,
                              style: FlutterFlowTheme.of(context).headlineLarge,
                              minFontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return (MediaQuery.sizeOf(context).width * 0.8);
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return MediaQuery.sizeOf(context).width;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return MediaQuery.sizeOf(context).width;
                              } else {
                                return MediaQuery.sizeOf(context).width;
                              }
                            }(),
                            decoration: BoxDecoration(),
                            child: AutoSizeText(
                              airportsDetailsAirportsRecord.airportCode,
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 24.0,
                                  ),
                              minFontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            airportsDetailsAirportsRecord.type,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            airportsDetailsAirportsRecord.city,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          if (airportsDetailsAirportsRecord.state !=
                              '- unavailable -')
                            Text(
                              FFLocalizations.of(context).getText(
                                'x3k017s7' /* ,  */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          if (airportsDetailsAirportsRecord.state !=
                              '- unavailable -')
                            Text(
                              airportsDetailsAirportsRecord.state,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          if (airportsDetailsAirportsRecord.countryCode !=
                              '- unavailable -')
                            Text(
                              FFLocalizations.of(context).getText(
                                '30gh9xoa' /* ,  */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          if (airportsDetailsAirportsRecord.countryCode !=
                              '- unavailable -')
                            Text(
                              airportsDetailsAirportsRecord.countryCode,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'wiasq862' /* Time Zone  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              airportsDetailsAirportsRecord.timezone,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '1rnqsxiz' /* Longitude */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              airportsDetailsAirportsRecord.longitude
                                  .toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '9phewkqe' /* Latitude */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              airportsDetailsAirportsRecord.latitude.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await launchURL(
                                    airportsDetailsAirportsRecord.wikiUrl);
                              },
                              text:
                                  '${airportsDetailsAirportsRecord.name} Wikipedia Page',
                              options: FFButtonOptions(
                                width: 325.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                                hoverColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                hoverElevation: 3.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: '${airportsDetailsAirportsRecord.name} Map',
                              options: FFButtonOptions(
                                width: 325.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                                hoverColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                hoverElevation: 3.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
