import 'package:flutter/material.dart';
import 'package:nuntium/screens/home/category/category_screen.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class CategoriesScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CategoriesScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<String> _categories = [
    "🏈  Sports",
    "⚖  Politics",
    "🌝  Life",
    "🎮  Gaming",
    "🐻  Animals",
    "🌴  Nature",
    "🍔  Food",
    "🎨  Art",
    "🧾  History",
    "👗  Fashion",
    "😷  Covid 19",
    "⚔️ Middle East",
  ];

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
              "Categories",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AvailableFonts.primaryFont,
                color: blackPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 27,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1.5,
            ),
            Text(
              "Thousands of articles in each category",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AvailableFonts.primaryFont,
                color: greyPrimary,
                fontWeight: FontWeight.w400,
                fontSize: 17,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );

    final categories = GridView.count(
      childAspectRatio: 2.5,
      crossAxisCount: 2,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 00.0, vertical: 10.0),
      children: _categories.map((category) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                ctx: context,
                type: PageTransitionType.fade,
                child: CategoryScreen(),
              ),
            );
          },
          child: GridViewItem(category),
        );
      }).toList(),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          SizeConfig.blockSizeHorizontal * 100,
          SizeConfig.blockSizeVertical * 15,
        ),
        child: appBar,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 3,
            right: SizeConfig.blockSizeHorizontal * 3,
          ),
          child: Column(
            children: [
              Expanded(child: categories),
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  final String _category;

  GridViewItem(this._category);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        _category,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: AvailableFonts.primaryFont,
          color: greyDarker,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: greyLighter,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      fillColor: Colors.white,
      onPressed: null,
    );
  }
}
