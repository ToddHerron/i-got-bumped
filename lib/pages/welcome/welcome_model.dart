import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
