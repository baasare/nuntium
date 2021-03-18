import 'package:flutter/material.dart';
import 'package:nuntium/screens/home/news/news_detail_screen.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class RecommendationViewItem extends StatelessWidget {
  final String _category;

  RecommendationViewItem(this._category);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          PageTransition(
            ctx: context,
            type: PageTransitionType.fade,
            child: NewsDetailScreen(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/wallpapers/wallpaper (13).png",
                fit: BoxFit.cover,
                height: SizeConfig.blockSizeVertical * 12,
                width: SizeConfig.blockSizeVertical * 12,
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "UI/UX Design",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AvailableFonts.primaryFont,
                    color: greyPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2.5,
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 60,
                  child: Text(
                    "A Simple Trick For Creating Color Palettes Quickly",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: AvailableFonts.primaryFont,
                      color: blackPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}