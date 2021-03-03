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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back 👋",
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
          "We're happy to see you again. You can continue where you left off by logging in",
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

    final emailField = CustomTextField(
      fieldIcon: FlutterIcons.email_outline_mco,
      currentFocus: emailFocusNode,
      nextFocus: passwordFocusNode,
      fieldHintText: "Email",
      fieldValidator: Validator.emailValidator,
      fieldController: emailController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordField = CustomPasswordField(
      fieldIcon: FlutterIcons.lock_outline_mco,
      currentFocus: passwordFocusNode,
      fieldHintText: "Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordController,
      fieldTextInputAction: TextInputAction.done,
    );

    final loginForm = Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 5,
        ),
        child: Column(
          children: <Widget>[
            emailField,
            SizedBox(
              height: 10.0,
            ),
            passwordField,
          ],
        ),
      ),
    );

    final loginBtn = Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 2,
        ),
        child: CustomButton(
            buttonColor: purplePrimary,
            buttonText: "Sign In",
            buttonHeight: SizeConfig.blockSizeVertical * 6,
            buttonWidth: SizeConfig.blockSizeHorizontal * 100,
            buttonOnPressed: () {
              Navigator.of(context).pushNamed(
                homeViewRoute,
              );
            }

            // if (_formKey.currentState.validate()) {
            //   SystemChannels.textInput.invokeMethod('TextInput.hide');
            //   setState(() {
            //     _saving = true;
            //   });
            //   _emailLogin(
            //       context, emailController.text, passwordController.text);
            // }

            ),
    );

    final forgotPassword = Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () =>
            Navigator.pushNamed(context, forgotPasswordRequestViewRoute),
        child: Text(
          'Forgot password?',
          style: TextStyle(
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
            fontFamily: AvailableFonts.primaryFont,
            fontSize: 13.0,
            color: greyPrimary,
          ),
        ),
      ),
    );

    final googleSignUp = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 6,
      ),
      child: SizedBox(
        height: SizeConfig.blockSizeVertical * 6,
        child: OutlineButton(
            child: Row(
              children: [
                Image.asset(
                  AvailableIcons.googleIcon["assetPath"],
                  fit: BoxFit.cover,
                  height: 25.0,
                  width: 25.0,
                ),
                Expanded(
                  child: Text(
                    "Sign In with Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: AvailableFonts.primaryFont,
                      fontSize: 15.0,
                      color: greyDarker,
                    ),
                  ),
                ),
              ],
            ),
            borderSide: BorderSide(
              width: 2,
              color: greyLighter,
              style: BorderStyle.solid,
            ),
            onPressed: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                7.0,
              ),
            )),
      ),
    );

    final signUp = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 5,
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: blackLighter,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Sign up',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: blackPrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(
                          context, registrationViewRoute);
                    },
                )
              ]),
        ),
      ),
    );

    final or = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'or',
          style: TextStyle(
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
            fontFamily: AvailableFonts.primaryFont,
            fontSize: 17.0,
            color: greyPrimary,
          ),
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
                loginForm,
                forgotPassword,
                loginBtn,
                or,
                googleSignUp,
                signUp
              ],
            ),
          ),
        ),
      ),
    );
  }
}
