import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/utils/validator.dart';
import 'package:nuntium/widgets/custom_button.dart';
import 'package:nuntium/widgets/custom_password_field.dart';
import 'package:nuntium/widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordOneController = TextEditingController();
  final passwordTwoController = TextEditingController();

  final emailFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final passwordOneFocusNode = FocusNode();
  final passwordTwoFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordOneController.dispose();
    passwordTwoController.dispose();

    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordOneFocusNode.dispose();
    passwordTwoFocusNode.dispose();
    ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Nuntium 👋",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AvailableFonts.primaryFont,
            color: blackPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 27,
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1.5,
        ),
        Text(
          "Hello, I guess you are new around here. You can start using the application after sign up.",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AvailableFonts.primaryFont,
            color: greyPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 17,
            letterSpacing: 0.5,
          ),
        )
      ],
    );

    final usernameField = CustomTextField(
      fieldIcon: FlutterIcons.user_ant,
      currentFocus: usernameFocusNode,
      nextFocus: emailFocusNode,
      fieldHintText: "Email",
      fieldValidator: Validator.emailValidator,
      fieldController: emailController,
      fieldTextInputAction: TextInputAction.next,
    );

    final emailField = CustomTextField(
      fieldIcon: FlutterIcons.email_outline_mco,
      currentFocus: emailFocusNode,
      nextFocus: passwordOneFocusNode,
      fieldHintText: "Email",
      fieldValidator: Validator.emailValidator,
      fieldController: emailController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordOneField = CustomPasswordField(
      fieldIcon: FlutterIcons.lock_outline_mco,
      currentFocus: passwordOneFocusNode,
      nextFocus: passwordTwoFocusNode,
      fieldHintText: "Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordOneController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordTwoField = CustomPasswordField(
      fieldIcon: FlutterIcons.lock_outline_mco,
      currentFocus: passwordTwoFocusNode,
      fieldHintText: "Repeat Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordTwoController,
      fieldTextInputAction: TextInputAction.done,
    );

    final registrationForm = Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 5,
        ),
        child: Column(
          children: <Widget>[
            usernameField,
            SizedBox(
              height: 10.0,
            ),
            emailField,
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
      ),
    );

    final registrationFormBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
      ),
      child: CustomButton(
          buttonColor: purplePrimary,
          buttonText: "Sign Up",
          buttonHeight: SizeConfig.blockSizeVertical * 6,
          buttonWidth: SizeConfig.blockSizeHorizontal * 100,
          buttonOnPressed: () {
            Navigator.of(context).pushNamed(
              preSettingViewRoute,
            );
          }),
    );

    final signIn = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 5,
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Already have an account?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: blackLighter,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Sign in',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: blackPrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(context, loginViewRoute);
                    },
                )
              ]),
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 5,
              left: SizeConfig.blockSizeHorizontal * 5,
              right: SizeConfig.blockSizeHorizontal * 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title,
                registrationForm,
                registrationFormBtn,
                signIn
              ],
            ),
          ),
        ),
      ),
    );
  }
}
