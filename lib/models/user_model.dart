import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuntium/services/local_storage_service.dart';
import 'package:nuntium/utils/constants.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

UserLogin userLoginFromJson(String s) => UserLogin.fromJson(json.decode(s));

UserOtp userOtpFromJson(String s) => UserOtp.fromJson(json.decode(s));

String userModelToJson(UserModel data) => json.encode(data.toJson());

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

String userOtpToJson(UserOtp data) => json.encode(data.toJson());

UserModel currentUser = new UserModel();

class UserModel extends ChangeNotifier {
  UserModel({
    this.id,
    this.userName,
    this.email,
    this.fullName,
    this.avatar,
    this.phoneNumber,
    this.userType,
    this.password,
    this.token,
  });

  dynamic id;
  String userName;
  String email;
  String fullName;
  String avatar;
  String phoneNumber;
  String userType;
  String password;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        userName: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        userType: json["user_type"] == null ? null : json["user_type"],
        password: json["password"] == null ? null : json["password"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": userName == null ? null : userName,
        "email": email == null ? null : email,
        "full_name": fullName == null ? null : fullName,
        "avatar": avatar == null ? null : avatar,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "user_type": userType == null ? null : userType,
        "password": password == null ? null : password,
        "token": token == null ? null : token,
      };

  setUserState() async {
    String jsonUser = await LocalStorageService.getFromDisk(
        SavedPreferencesKeys.currentUserKey);
    if (jsonUser != null) {
      currentUser = userModelFromJson(jsonUser);
    }
  }

  UserModel get getCurrentUserState {
    return currentUser;
  }

  void setUser(UserModel user, {bool callApi = true}) async {
    currentUser.id = user.id ?? "";
    currentUser.email = user.email ?? "";
    currentUser.userName = user.userName ?? "";
    currentUser.fullName = user.fullName ?? "";
    currentUser.avatar = user.avatar ?? "";
    currentUser.phoneNumber = user.phoneNumber ?? "";
    currentUser.userType = user.userType ?? "";
    currentUser.token = user.token ?? "";

    String jsonUser = userModelToJson(currentUser);
    LocalStorageService.saveToDisk(
        SavedPreferencesKeys.currentUserKey, jsonUser);

    if (callApi) {
      // final client = http.Client();
      // UserAuthenticationService.updateUserDetails(currentUser, client);
    }

    notifyListeners();
  }
}

class UserLogin {
  UserLogin({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class UserOtp {
  UserOtp({
    this.otp,
    this.phoneNumber,
  });

  String otp;
  String phoneNumber;

  factory UserOtp.fromJson(Map<String, dynamic> json) => UserOtp(
        otp: json["otp"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "phone_number": phoneNumber,
      };
}
