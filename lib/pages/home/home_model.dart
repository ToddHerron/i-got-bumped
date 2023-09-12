import '/backend/backend.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown_airline widget.
  String? dropDownAirlineValue;
  FormFieldController<String>? dropDownAirlineValueController;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
