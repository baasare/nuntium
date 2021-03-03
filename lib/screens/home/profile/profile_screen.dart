import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/screens/home/profile/language_change_screen.dart';
import 'package:nuntium/screens/home/profile/password_change_screen.dart';
import 'package:nuntium/screens/home/profile/privacy_policy_screen.dart';
import 'package:nuntium/screens/home/profile/terms_conditions_screen.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:page_transition/page_transition.dart';


class ProfileScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProfileScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool notificationStatus = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = PreferredSize(
      preferredSize: Size(
        SizeConfig.blockSizeHorizontal * 100,
        SizeConfig.blockSizeVertical * 22,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: AvailableFonts.primaryFont,
                  color: blackPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2.5,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/wallpapers/wallpaper (13).png",
                      fit: BoxFit.cover,
                      height: SizeConfig.blockSizeVertical * 10,
                      width: SizeConfig.blockSizeVertical * 10,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Eren Turkmen",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AvailableFonts.primaryFont,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1.0,
                      ),
                      Text(
                        "ertuken@gmail.com",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AvailableFonts.primaryFont,
                          color: greyPrimary,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 3,
          left: SizeConfig.blockSizeHorizontal * 3,
          right: SizeConfig.blockSizeHorizontal * 3,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileListItem(
                title: "Notification",
                icon: CupertinoSwitch(
                  value: notificationStatus,
                  activeColor: purplePrimary,
                  onChanged: (value) {
                    setState(() {
                      notificationStatus = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3.0,
              ),
              ProfileListItem(
                page: LanguageChangeScreen(),
                title: "Language",
                icon: Icon(
                  FlutterIcons.right_ant,
                  color: greyDarker,
                  size: 15,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3.0,
              ),
             ProfileListItem(
               page: PasswordChangeScreen(),
                title: "Change Password",
                icon: Icon(
                  FlutterIcons.right_ant,
                  color: greyDarker,
                  size: 15,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3.0,
              ),
              ProfileListItem(
                page: PrivacyPolicyScreen(),
                title: "Privacy",
                icon: Icon(
                  FlutterIcons.right_ant,
                  color: greyDarker,
                  size: 15,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3.0,
              ),
              ProfileListItem(
                page: TermsConditionScreen(),
                title: "Terms & Condition",
                icon: Icon(
                  FlutterIcons.right_ant,
                  color: greyDarker,
                  size: 15,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(loginViewRoute, (Route<dynamic> route) => false);
                },
                child: Container(
                  height: SizeConfig.blockSizeVertical * 7,
                  padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 4,
                    right: SizeConfig.blockSizeHorizontal * 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: greyLighter,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign Out",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AvailableFonts.primaryFont,
                          color: greyPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Icon(
                        FlutterIcons.logout_ant,
                        color: greyDarker,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget page;

  const ProfileListItem({Key key, this.title, this.icon, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            ctx: context,
            type: PageTransitionType.fade,
            child: page,
          ),
        );
      },
      child: Container(
        height: SizeConfig.blockSizeVertical * 7,
        padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 4,
          right: SizeConfig.blockSizeHorizontal * 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          color: greyLighter,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AvailableFonts.primaryFont,
                color: greyPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 17,
                letterSpacing: 0.5,
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
