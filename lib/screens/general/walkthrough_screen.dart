import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  PageController controller;
  int currentPage = 1;
  Random rnd;

  var someImages = [
    'assets/images/wallpapers/wallpaper (1).png',
    'assets/images/wallpapers/wallpaper (2).png',
    'assets/images/wallpapers/wallpaper (3).png',
    'assets/images/wallpapers/wallpaper (4).png',
    'assets/images/wallpapers/wallpaper (5).png',
    'assets/images/wallpapers/wallpaper (6).png',
    'assets/images/wallpapers/wallpaper (7).png',
    'assets/images/wallpapers/wallpaper (8).png',
    'assets/images/wallpapers/wallpaper (9).png',
    'assets/images/wallpapers/wallpaper (10).png',
    'assets/images/wallpapers/wallpaper (11).png',
    'assets/images/wallpapers/wallpaper (12).png',
    'assets/images/wallpapers/wallpaper (13).png',
    'assets/images/wallpapers/wallpaper (14).png',
    'assets/images/wallpapers/wallpaper (15).png',
    'assets/images/wallpapers/wallpaper (16).png',
    'assets/images/wallpapers/wallpaper (17).png',
    'assets/images/wallpapers/wallpaper (18).png',
    'assets/images/wallpapers/wallpaper (19).png',
    'assets/images/wallpapers/wallpaper (20).png',
    'assets/images/wallpapers/wallpaper (21).png',
    'assets/images/wallpapers/wallpaper (22).png',
    'assets/images/wallpapers/wallpaper (23).png',
    'assets/images/wallpapers/wallpaper (24).png',
    'assets/images/wallpapers/wallpaper (25).png',
    'assets/images/wallpapers/wallpaper (26).png',
    'assets/images/wallpapers/wallpaper (27).png',
    'assets/images/wallpapers/wallpaper (28).png',

  ];

  List<String> titles = ["Latest News", "Accurate News", "Comprehensive News"];
  List<String> details = [
    "News as it happens\nbe the first to be informed",
    "News unadulterated \nbe rest assured it's authentic",
    "News covering all topics \nbrowse all categories of news",
  ];

  @override
  initState() {
    super.initState();
    controller = PageController (
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }


  Image img() {
    int min = 0;
    int max = someImages.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String imageName = someImages[r].toString();
    return Image.asset(
      imageName,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
              ),
              child: Center (
                child: Container (
                  height: SizeConfig.blockSizeVertical * 50,
                  child: imageBuilder (),
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotColor: greyLight,
                dotWidth: 10.0,
                dotHeight: 10.0,
                expansionFactor: 3,
                radius: 10,
                spacing: 5,
              ),
            ),

            Column(
              children: [
                Text(
                  titles[currentPage],
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 30.0,
                    fontFamily: AvailableFonts.primaryFont,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2.0,
                ),
                Text(
                  details[currentPage],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: greyPrimary,
                    fontSize: 18.0,
                    fontFamily: AvailableFonts.primaryFont,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            // Spacer (),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 3,
                bottom: SizeConfig.blockSizeVertical * 5,
              ),
              child: CustomButton(
                buttonColor: purplePrimary,
                buttonText: "Next",
                buttonHeight: SizeConfig.blockSizeVertical * 6,
                buttonWidth: SizeConfig.blockSizeHorizontal * 70,
                buttonOnPressed: () => Navigator.of(context).pushReplacementNamed(welcomeViewRoute),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageBuilder () {
    return PageView.builder (
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        controller: controller,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedBuilder (
            animation: controller,
            builder: (context, child) {
              double value = 1.0;

              if (controller.position.haveDimensions) {
                value = controller.page - index;
                value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
              }

              return Center (
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * 450,
                  width: Curves.easeOut.transform(value) * 420,
                  child: child,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                elevation: 5,
                child: img(),
              ),
            ),
          );
        });
  }
}
