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

class AirportsDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AirportsDetails widget.
  int? firebaseAirportCount;
  // Stores action output result for [Backend Call - API (Airport Information)] action in AirportsDetails widget.
  ApiCallResponse? apiResultAirportInfo;
  // Stores action output result for [Custom Action - createAirportDocument] action in AirportsDetails widget.
  String? firestoreResultAirportDocCreate;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerMenuModel.dispose();
    headerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
