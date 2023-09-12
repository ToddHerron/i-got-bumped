import '/backend/backend.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'pax_legal_rights_list_model.dart';
export 'pax_legal_rights_list_model.dart';

class PaxLegalRightsListWidget extends StatefulWidget {
  const PaxLegalRightsListWidget({Key? key}) : super(key: key);

  @override
  _PaxLegalRightsListWidgetState createState() =>
      _PaxLegalRightsListWidgetState();
}

class _PaxLegalRightsListWidgetState extends State<PaxLegalRightsListWidget> {
  late PaxLegalRightsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaxLegalRightsListModel());
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
        backgroundColor: FlutterFlowTheme.of(context).accent1,
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
                'f0nm67bn' /* Passenger Legal Rights */,
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
                  FlutterFlowTheme.of(context).accent1
                ],
                stops: [0.7, 0.9],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FlutterFlowCheckboxGroup(
                          options: [
                            FFLocalizations.of(context).getText(
                              'jf20dj8h' /* English */,
                            ),
                            FFLocalizations.of(context).getText(
                              'xf0wjr9s' /* French */,
                            )
                          ],
                          onChanged: (val) =>
                              setState(() => _model.checkboxGroupValues = val),
                          controller: _model.checkboxGroupValueController ??=
                              FormFieldController<List<String>>(
                            [
                              FFLocalizations.of(context).getText(
                                '4u7689zx' /* English */,
                              )
                            ],
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          checkboxBorderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                          unselectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          checkboxBorderRadius: BorderRadius.circular(4.0),
                          initialized: _model.checkboxGroupValues != null,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      CountriesRecord>(
                    pagingController: _model.setListViewController(
                      CountriesRecord.collection
                          .whereIn(
                              'LanguageCode',
                              functions.convertLangNameListToLangCodeList(
                                  _model.checkboxGroupValues?.toList(),
                                  FFLocalizations.of(context).languageCode))
                          .orderBy('CountryName'),
                    ),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<CountriesRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
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
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
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

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewCountriesRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(
                                listViewCountriesRecord.billOfRightsURL);
                          },
                          child: ListTile(
                            title: Text(
                              listViewCountriesRecord.countryName,
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            subtitle: Text(
                              listViewCountriesRecord.docTitle,
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
