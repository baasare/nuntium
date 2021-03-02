import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/widgets/custom_button.dart';
import 'package:nuntium/widgets/custom_pin_field.dart';

class VerificationScreen extends StatefulWidget {
  final String otp, phoneNumber, verificationType;

  const VerificationScreen(
      {Key key, this.otp, this.phoneNumber, this.verificationType})
      : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _pinCode = "";
  bool _saving = false;

  Timer _timer;
  int _seconds = 60;
  int _countDown = 10;
  int _countDownCalls = 0;
  bool _countingDown = false;

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verification Code ✅",
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
          "You need to enter 4-digit code we sent to your email address.",
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

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 3,
      ),
      child: CustomButton(
          buttonColor: purplePrimary,
          buttonText: "Confirm",
          buttonHeight: SizeConfig.blockSizeVertical * 6,
          buttonWidth: SizeConfig.blockSizeHorizontal * 100,
          buttonOnPressed: () {
            Navigator.of(context).pushNamed(
              forgotPasswordViewRoute,
            );
          }
      ),
    );

    final verificationForm = Container(
        constraints: BoxConstraints(maxWidth: 500),
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 5,
        ),
        child: PinEntryTextField(
          fields: 4,
          isTextObscure: true,
          fieldWidth: SizeConfig.blockSizeHorizontal * 15,
          onSubmit: getPinCode,
          cursorColor: greyDarker,
          textColor: greyPrimary,
          boxColor: greyPrimary,
        ));

    final resendCode = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 5,
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Didn\'t receive email?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: blackLighter,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Send again',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: blackPrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigator.pushReplacementNamed(
                      //     context, registrationViewRoute);
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
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 5,
            right: SizeConfig.blockSizeHorizontal * 5,
          ),
          child: Column(
            children: <Widget>[
              title,
              verificationForm,
              submitBtn,
              resendCode,
            ],
          ),
        ),
      ),
    );
  }

  void getPinCode(String value) {
    setState(() => _pinCode = value);
    print(_pinCode);
  }

  void startTimer() {
    setState(() {
      _countingDown = true;
    });
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) => setState(
            () {
          if (_countDown < 1) {
            timer.cancel();
            setState(() {
              _countingDown = false;
              _countDownCalls++;
              _countDown = _seconds * (_countDownCalls + 2);
            });
          } else {
            _countDown = _countDown - 1;
          }
        },
      ),
    );
  }
}

