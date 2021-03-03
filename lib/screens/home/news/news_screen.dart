import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/screens/home/news/news_detail_screen.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/utils/validator.dart';
import 'package:nuntium/widgets/custom_text_field.dart';
import 'package:nuntium/widgets/list_items/category_list_item.dart';
import 'package:nuntium/widgets/list_items/recommendation_list_item.dart';
import 'package:page_transition/page_transition.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final List<String> _categories = [
    "Random",
    "Sports",
    "Politics",
    "Life",
    "Gaming",
    "Animals",
    "Nature",
    "Food",
    "Art",
    "History",
    "Fashion",
    "Covid 19",
    "Middle East",
  ];

  String _selectedCategory = "Random";

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

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
              "Discover things of this world",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AvailableFonts.primaryFont,
                color: greyPrimary,
                fontWeight: FontWeight.w400,
                fontSize: 17,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3.5,
            ),
            CustomTextField(
              fieldIcon: FlutterIcons.search_evi,
              currentFocus: searchFocusNode,
              fieldHintText: "Search",
              fieldValidator: Validator.textValidator,
              fieldController: searchController,
              fieldTextInputAction: TextInputAction.done,
            )
          ],
        ),
      ),
    );

    final categories = ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      children: _categories.map((category) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCategory = category;
            });
          },
          child: CategoryListViewItem(category, _selectedCategory == category),
        );
      }).toList(),
    );

    final randomBulletin = ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      children: _categories.map((category) {
        return GestureDetector(
          onTap: () {
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
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 3,
              left: SizeConfig.blockSizeVertical * 2,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8),
                      BlendMode.dstATop,
                    ),
                    child: Image.asset(
                      AvailableImages.placeholder["assetPath"],
                      fit: BoxFit.cover,
                      width: SizeConfig.blockSizeHorizontal * 70,
                    ),
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.blockSizeVertical * 12,
                  left: SizeConfig.blockSizeHorizontal * 5,
                  child: Text(
                    "Politics",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: AvailableFonts.primaryFont,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        letterSpacing: 1.0),
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.blockSizeVertical * 5,
                  left: SizeConfig.blockSizeHorizontal * 5,
                  child: SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 60,
                    child: Text(
                      "A Simple Trick For Creating Color Palettes Quickly",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AvailableFonts.primaryFont,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: SizeConfig.blockSizeVertical * 3,
                  right: SizeConfig.blockSizeHorizontal * 5,
                  child: Icon(
                    FlutterIcons.bookmark_outline_mco,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          SizeConfig.blockSizeHorizontal * 100,
          SizeConfig.blockSizeVertical * 25,
        ),
        child: appBar,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 5,
              child: categories,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 40,
              child: randomBulletin,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 3,
                left: SizeConfig.blockSizeVertical * 2,
                right: SizeConfig.blockSizeVertical * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended for you",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: AvailableFonts.primaryFont,
                      color: blackPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "See All",
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
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 3,
                left: SizeConfig.blockSizeVertical * 2,
                right: SizeConfig.blockSizeVertical * 2,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _categories.length,
                itemBuilder: (context, position) {
                  return RecommendationViewItem("");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
