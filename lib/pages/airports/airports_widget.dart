import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'airports_model.dart';
export 'airports_model.dart';

class AirportsWidget extends StatefulWidget {
  const AirportsWidget({Key? key}) : super(key: key);

  @override
  _AirportsWidgetState createState() => _AirportsWidgetState();
}

class _AirportsWidgetState extends State<AirportsWidget> {
  late AirportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AirportsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              pageTitle: FFLocalizations.of(context).getText(
                '7j4llnoy' /* Airportwide Delays */,
              ),
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: ExpandableNotifier(
                          initialExpanded: false,
                          child: ExpandablePanel(
                            header: Text(
                              FFLocalizations.of(context).getText(
                                '3fypdw6b' /* Airports Delays */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                            ),
                            collapsed: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 68.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'gr4l1z5q' /* Airports currently experiencin... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0x8A000000),
                                      ),
                                ),
                              ),
                            ),
                            expanded: Container(
                              height: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return (MediaQuery.sizeOf(context).height *
                                      0.5);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).height *
                                      0.5);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return MediaQuery.sizeOf(context).height;
                                } else {
                                  return MediaQuery.sizeOf(context).height;
                                }
                              }(),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'txg20i09' /* These airports are experiencin... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: FlightAwareGroup
                                            .aIrportwideDelaysCall
                                            .call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewAIrportwideDelaysResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final delaysDetails =
                                                  FlightAwareGroup
                                                          .aIrportwideDelaysCall
                                                          .delays(
                                                            listViewAIrportwideDelaysResponse
                                                                .jsonBody,
                                                          )
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: delaysDetails.length,
                                                itemBuilder: (context,
                                                    delaysDetailsIndex) {
                                                  final delaysDetailsItem =
                                                      delaysDetails[
                                                          delaysDetailsIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'AirportsDetails',
                                                        queryParameters: {
                                                          'airportCode':
                                                              serializeParam(
                                                            getJsonField(
                                                              delaysDetailsItem,
                                                              r'''$..airport''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: ListTile(
                                                      title: Text(
                                                        functions
                                                            .getAirportsDocReference(
                                                                getJsonField(
                                                              delaysDetailsItem,
                                                              r'''$..airport''',
                                                            ).toString())
                                                            .id,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                      subtitle: Text(
                                                        getJsonField(
                                                          delaysDetailsItem,
                                                          r'''$..reason''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      trailing: Icon(
                                                        Icons.arrow_right,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 30.0,
                                                      ),
                                                      tileColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      dense: false,
                                                    ),
                                                  );
                                                },
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
                            theme: ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: true,
                              tapBodyToCollapse: true,
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                              expandIcon: Icons.arrow_right,
                              collapseIcon: Icons.arrow_drop_down,
                              iconSize: 30.0,
                              iconColor: FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
