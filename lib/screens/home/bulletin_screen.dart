import 'package:flutter/material.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';

class BulletinScreen extends StatefulWidget {
  @override
  _BulletinScreenState createState() => _BulletinScreenState();
}

class _BulletinScreenState extends State<BulletinScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = SafeArea(
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
              "Browse",
              style: TextStyle(
                color: blackPrimary,
                fontSize: 40.0,
                fontFamily: AvailableFonts.primaryFont,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1.0,),
            Text(
              "Discover things of this world",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: greyPrimary,
                fontSize: 22.0,
                fontFamily: AvailableFonts.primaryFont,
                fontWeight: FontWeight.w200,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: appBar,
        preferredSize: Size(
          SizeConfig.blockSizeHorizontal * 100,
          SizeConfig.blockSizeVertical * 40,
        ),
      ),
      body: Column(),
    );
  }
}
