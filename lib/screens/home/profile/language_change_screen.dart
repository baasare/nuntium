import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/widgets/list_items/profile_list_item.dart';

class LanguageChangeScreen extends StatefulWidget {
  @override
  _LanguageChangeScreenState createState() => _LanguageChangeScreenState();
}

class _LanguageChangeScreenState extends State<LanguageChangeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool notificationStatus = false;

  final List<String> _languages = [
    "English",
    "French",
    "Spanish",
    "Portuguese",
  ];

  String _selectedLanguage = "English";

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
                  "Language",
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

    final languages = ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      children: _languages.map((language) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedLanguage = language;
            });
          },
          child: ProfileListItem(language, _selectedLanguage == language),
        );
      }).toList(),
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
          child: languages,
        ));
  }
}
