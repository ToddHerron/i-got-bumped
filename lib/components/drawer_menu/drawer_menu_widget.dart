import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_menu_model.dart';
export 'drawer_menu_model.dart';

class DrawerMenuWidget extends StatefulWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  _DrawerMenuWidgetState createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends State<DrawerMenuWidget> {
  late DrawerMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 315.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).warning,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Login');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'bu13z8np' /* Login */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            if (loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Login');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            Navigator.pop(context);

                            context.pushNamedAuth('Home', context.mounted);
                          },
                          text: FFLocalizations.of(context).getText(
                            '63v60c45' /* Logout */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Login');
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'djturhhp' /* Language */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                      FaIcon(
                        FontAwesomeIcons.language,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownLanguageValueController ??=
                          FormFieldController<String>(null),
                      options: ['en', 'fr', 'es', 'de', 'zh'],
                      optionLabels: [
                        FFLocalizations.of(context).getText(
                          '77zv02i0' /* English */,
                        ),
                        FFLocalizations.of(context).getText(
                          '9n0x9rqu' /* French */,
                        ),
                        FFLocalizations.of(context).getText(
                          'xa7bx3xp' /* Spanish */,
                        ),
                        FFLocalizations.of(context).getText(
                          'mjk7ryeh' /* German */,
                        ),
                        FFLocalizations.of(context).getText(
                          'b7zigtn6' /* Chinese  */,
                        )
                      ],
                      onChanged: (val) async {
                        setState(() => _model.dropDownLanguageValue = val);
                        if (_model.dropDownLanguageValue == 'fr') {
                          setAppLanguage(context, 'fr');
                        } else {
                          if (_model.dropDownLanguageValue == 'es') {
                            setAppLanguage(context, 'es');
                          } else {
                            if (_model.dropDownLanguageValue == 'de') {
                              setAppLanguage(context, 'de');
                            } else {
                              if (_model.dropDownLanguageValue == 'zh') {
                                setAppLanguage(context, 'zh_Hans');
                              } else {
                                if (_model.dropDownLanguageValue == 'en') {
                                  setAppLanguage(context, 'en');
                                }
                              }
                            }
                          }

                          if (loggedIn) {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              languageCode: valueOrDefault(
                                  currentUserDocument?.languageCode, ''),
                            ));
                          }
                        }
                      },
                      width: 263.0,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Nunito',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        '8ll0a10f' /* Choose a language... */,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      fillColor: FlutterFlowTheme.of(context).primary,
                      elevation: 3.0,
                      borderColor: FlutterFlowTheme.of(context).primaryText,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('PaxLegalRightsList');
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 238.0,
                    height: 35.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'fo79ckpo' /* Passenger Legal Rights */,
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).titleLarge,
                        minFontSize: 10.0,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Airports');
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 238.0,
                    height: 35.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'zgznuexn' /* Airport Information */,
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).titleLarge,
                        minFontSize: 10.0,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
