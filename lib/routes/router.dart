import 'package:flutter/material.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/screens/authentication/forgot_password/forgot_password_request_screen.dart';
import 'package:nuntium/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:nuntium/screens/authentication/forgot_password/verification_screen.dart';
import 'package:nuntium/screens/authentication/login_screen.dart';
import 'package:nuntium/screens/authentication/registration_screen.dart';
import 'package:nuntium/screens/general/pre_setting_screen.dart';
import 'package:nuntium/screens/general/splash_screen.dart';
import 'package:nuntium/screens/general/walkthrough_screen.dart';
import 'package:nuntium/screens/general/welcome_screen.dart';
import 'package:nuntium/screens/home/home_screen.dart';
import 'package:nuntium/screens/test.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Map<String, dynamic> arguments = settings.arguments;
  switch (settings.name) {
    case splashViewRoute:
      return PageTransition(
        child: SplashScreen(),
        type: PageTransitionType.fade,
      );
    case walkThroughViewRoute:
      return PageTransition(
        child: WalkthroughScreen(),
        type: PageTransitionType.fade,
      );
    case welcomeViewRoute:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );
    case preSettingViewRoute:
      return PageTransition(
        child: PreSettingScreen(),
        type: PageTransitionType.fade,
      );

    case loginViewRoute:
      return PageTransition(
        child: LoginScreen(),
        type: PageTransitionType.fade,
      );
    case registrationViewRoute:
      return PageTransition(
        child: RegistrationScreen(),
        type: PageTransitionType.fade,
      );
    case forgotPasswordRequestViewRoute:
      return PageTransition(
        child: ForgotPasswordRequestScreen(),
        type: PageTransitionType.fade,
      );
    case forgotPasswordViewRoute:
      return PageTransition(
        child: ForgotPasswordScreen(),
        type: PageTransitionType.fade,
      );
    case verificationViewRoute:
      return PageTransition(
        child: VerificationScreen(),
        type: PageTransitionType.fade,
      );

    case homeViewRoute:
      return PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.fade,
      );

    case testViewRoute:
      return PageTransition(
        child: TestScreen(),
        type: PageTransitionType.fade,
      );

    default:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );
  }
}
