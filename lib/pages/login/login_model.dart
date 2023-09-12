import '/auth/firebase_auth/auth_util.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_email widget.
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  // State field(s) for TextField_password widget.
  TextEditingController? textFieldPasswordController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)? textFieldPasswordControllerValidator;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldPasswordVisibility = false;
    headerModel = createModel(context, () => HeaderModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldEmailController?.dispose();
    textFieldPasswordController?.dispose();
    headerModel.dispose();
    drawerMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
