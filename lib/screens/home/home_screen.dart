import 'package:flutter/material.dart';
import 'package:nuntium/screens/home/bookmark_screen.dart';
import 'package:nuntium/screens/home/bulletin_screen.dart';
import 'package:nuntium/screens/home/category_screen.dart';
import 'package:nuntium/screens/home/profile/profile_screen.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image(
              image: _currentIndex == 0
                  ? AvailableIcons.homeActive["assetImage"]
                  : AvailableIcons.homeInActive["assetImage"],
              height: SizeConfig.blockSizeVertical * 3,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: _currentIndex == 1
                  ? AvailableIcons.categoriesActive["assetImage"]
                  : AvailableIcons.categoriesInActive["assetImage"],
              height: SizeConfig.blockSizeVertical * 3,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: _currentIndex == 2
                  ? AvailableIcons.bookmarkActive["assetImage"]
                  : AvailableIcons.bookmarkInActive["assetImage"],
              height: SizeConfig.blockSizeVertical * 3,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: _currentIndex == 3
                  ? AvailableIcons.profileActive["assetImage"]
                  : AvailableIcons.profileInActive["assetImage"],
              height: SizeConfig.blockSizeVertical * 3,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            label: "",
          ),
        ],
      ),
      body: [
        BulletinScreen(),
        CategoryScreen(
          scaffoldKey: _scaffoldKey,
        ),
        BookmarkScreen(
          scaffoldKey: _scaffoldKey,
        ),
        ProfileScreen(
          scaffoldKey: _scaffoldKey,
        ),
      ][_currentIndex],
    );
  }
}
