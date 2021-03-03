import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/utils/validator.dart';
import 'package:nuntium/widgets/custom_button.dart';
import 'package:nuntium/widgets/custom_password_field.dart';

class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final currentPasswordController = TextEditingController();
  final passwordOneController = TextEditingController();
  final passwordTwoController = TextEditingController();
  final currentPasswordFocusNode = FocusNode();
  final passwordOneFocusNode = FocusNode();
  final passwordTwoFocusNode = FocusNode();

  @override
  void dispose() {
    currentPasswordController.dispose();
    passwordOneController.dispose();
    passwordTwoController.dispose();
    passwordOneFocusNode.dispose();
    passwordTwoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = PreferredSize(
      preferredSize: Size(
        SizeConfig.blockSizeHorizontal * 100,
        SizeConfig.blockSizeVertical * 15,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20.0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: blackPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: Text(
                  "Language Change",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AvailableFonts.primaryFont,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final currentPasswordField = CustomPasswordField(
      fieldIcon: FlutterIcons.lock_outline_mco,
      currentFocus: currentPasswordFocusNode,
      nextFocus: passwordOneFocusNode,
      fieldHintText: "Current Password",
      fieldValidator: Validator.textValidator,
      fieldController: currentPasswordController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordOneField = CustomPasswordField(
      fieldIcon: FlutterIcons.lock_outline_mco,
      currentFocus: passwordOneFocusNode,
      nextFocus: passwordTwoFocusNode,
      fieldHintText: "New Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordOneController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordTwoField = CustomPasswordField(
      fieldIcon: FlutterIcons.lock_outline_mco,
      currentFocus: passwordTwoFocusNode,
      fieldHintText: "Repeat New Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordTwoController,
      fieldTextInputAction: TextInputAction.done,
    );

    final loginForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          currentPasswordField,
          SizedBox(
            height: 10.0,
          ),
          passwordOneField,
          SizedBox(
            height: 10.0,
          ),
          passwordTwoField,
        ],
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 5,
      ),
      child: CustomButton(
        buttonColor: purplePrimary,
        buttonText: "Change Password",
        buttonHeight: SizeConfig.blockSizeVertical * 7,
        buttonWidth: SizeConfig.blockSizeHorizontal * 100,
        buttonOnPressed: () {
          Navigator.of(context).pushNamed(
            verificationViewRoute,
          );
        },
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
                left: SizeConfig.blockSizeHorizontal * 5,
                right: SizeConfig.blockSizeHorizontal * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                loginForm,
                submitBtn,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
