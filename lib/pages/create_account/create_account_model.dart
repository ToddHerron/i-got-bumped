import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_FirstName widget.
  TextEditingController? textFieldFirstNameController;
  String? Function(BuildContext, String?)?
      textFieldFirstNameControllerValidator;
  // State field(s) for TextField_email widget.
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  // State field(s) for TextField_password widget.
  TextEditingController? textFieldPasswordController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)? textFieldPasswordControllerValidator;
  // State field(s) for TextField_confirmPassword widget.
  TextEditingController? textFieldConfirmPasswordController;
  late bool textFieldConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      textFieldConfirmPasswordControllerValidator;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldPasswordVisibility = false;
    textFieldConfirmPasswordVisibility = false;
    headerModel = createModel(context, () => HeaderModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFirstNameController?.dispose();
    textFieldEmailController?.dispose();
    textFieldPasswordController?.dispose();
    textFieldConfirmPasswordController?.dispose();
    headerModel.dispose();
    drawerMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
