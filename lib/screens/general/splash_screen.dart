import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuntium/models/user_model.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _accessToken, _walkThroughSeen;
  bool _isLoggedIn = true, _hasSeenWalkThrough = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    _accessToken = myPrefs.getString(SavedPreferencesKeys.userTokenKey);
    _walkThroughSeen = myPrefs.getBool(SavedPreferencesKeys.seenWalkThroughKey);

    print("ACCESS TOKEN VALUE: $_accessToken");

    if (_accessToken == null || _accessToken == "") {
      setState(() {
        _isLoggedIn = false;
      });
      print("USER IS NOT LOGGED IN");
    } else {
      final UserModel _userState = UserModel();
      _userState.setUserState();

      print("USER IS LOGGED IN");
    }

    if (_walkThroughSeen == null || _walkThroughSeen == false) {
      setState(() {
        _hasSeenWalkThrough = false;
      });
      print("USER HAS NOT SEEN WALK THROUGH");
    } else {
      print("USER HAS SEEN WALK THROUGH");
    }

    Timer(Duration(seconds: 3), () {

      Navigator.of(context).pushNamedAndRemoveUntil(
          walkThroughViewRoute, (Route<dynamic> route) => false);

      // if (_isLoggedIn) {
      //   Navigator.of(context).pushNamedAndRemoveUntil(
      //       homeViewRoute, (Route<dynamic> route) => false);
      // } else {
      //   if (_hasSeenWalkThrough) {
      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //         registrationViewRoute, (Route<dynamic> route) => false);
      //   } else {
      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //         walkThroughViewRoute, (Route<dynamic> route) => false);
      //   }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: purplePrimary,
      body: Container(
        color: purplePrimary,
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(
                  SizeConfig.blockSizeHorizontal * 30,
                ),
                child: Image.asset(
                  AvailableImages.appLogo["assetPath"],
                  height: SizeConfig.blockSizeVertical * 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
