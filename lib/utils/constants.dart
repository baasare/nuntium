import 'package:flutter/material.dart';

// Fonts
class AvailableFonts {
  static const primaryFont = "SFProText";
}

// Endpoints
class ApiEndpoints {
  static const baseEndpoint = "http://10.0.2.2:8000/api/v1";
}

// sharedPreferences keys
class SavedPreferencesKeys {
  static const userTokenKey = "token";
  static const userEmail = "email";
  static const currentUserKey = "current_user";
  static const seenWalkThroughKey = "walkthrough";
}

// Icons
class AvailableIcons {
  static const bookmarkActive = {
    'assetImage': AssetImage('assets/images/bookmarkActive.png'),
    'assetPath': 'assets/images/bookmarkActive.png',
  };

  static const categoriesActive = {
    'assetImage': AssetImage('assets/images/categoriesActive.png'),
    'assetPath': 'assets/images/categoriesActive.png',
  };

  static const homeActive = {
    'assetImage': AssetImage('assets/images/homeActive.png'),
    'assetPath': 'assets/images/homeActive.png',
  };

  static const profileActive = {
    'assetImage': AssetImage('assets/images/profileActive.png'),
    'assetPath': 'assets/images/profileActive.png',
  };

  static const bookmarkInActive = {
    'assetImage': AssetImage('assets/images/bookmarkInActive.png'),
    'assetPath': 'assets/images/bookmarkInActive.png',
  };

  static const categoriesInActive = {
    'assetImage': AssetImage('assets/images/categoriesInActive.png'),
    'assetPath': 'assets/images/categoriesInActive.png',
  };

  static const homeInActive = {
    'assetImage': AssetImage('assets/images/homeInActive.png'),
    'assetPath': 'assets/images/homeInActive.png',
  };

  static const profileInActive = {
    'assetImage': AssetImage('assets/images/profileInActive.png'),
    'assetPath': 'assets/images/profileInActive.png',
  };

  static const googleIcon = {
    'assetImage': AssetImage('assets/images/googleLogo.png'),
    'assetPath': 'assets/images/googleLogo.png',
  };
}

// Images
class AvailableImages {
  static const appLogo = {
    'assetImage': AssetImage('assets/images/appLogo.png'),
    'assetPath': 'assets/images/appLogo.png',
  };

  static const welcomeLogo = {
    'assetImage': AssetImage('assets/images/welcomeLogo.png'),
    'assetPath': 'assets/images/welcomeLogo.png',
  };

  static const placeholder = {
    'assetImage': AssetImage('assets/images/placeholder.png'),
    'assetPath': 'assets/images/placeholder.png',
  };
}
