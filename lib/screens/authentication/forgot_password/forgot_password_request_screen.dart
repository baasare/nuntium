import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/utils/validator.dart';
import 'package:nuntium/widgets/custom_button.dart';
import 'package:nuntium/widgets/custom_text_field.dart';

class ForgotPasswordRequestScreen extends StatefulWidget {
  @override
  _ForgotPasswordRequestScreenState createState() =>
      _ForgotPasswordRequestScreenState();
}

class _ForgotPasswordRequestScreenState
    extends State<ForgotPasswordRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forgot Password 🤔",
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
          "We need your email address so we can send you the password reset code.",
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
      fieldHintText: "Email",
      fieldValidator: Validator.emailValidator,
      fieldController: emailController,
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
          ],
        ),
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
      ),
      child: CustomButton(
        buttonColor: purplePrimary,
        buttonText: "Next",
        buttonHeight: SizeConfig.blockSizeVertical * 6,
        buttonWidth: SizeConfig.blockSizeHorizontal * 100,
        buttonOnPressed: () {
          Navigator.of(context).pushNamed(
            verificationViewRoute,
          );
        },
      ),
    );

    final signIn = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 20,
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Remember the password?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: blackLighter,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Try Again',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: blackPrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
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
                right: SizeConfig.blockSizeHorizontal * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[title, loginForm, submitBtn, signIn],
            ),
          ),
        ),
      ),
    );
  }
}
