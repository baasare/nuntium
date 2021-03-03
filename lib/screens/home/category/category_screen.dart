import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/screens/home/news/news_detail_screen.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/utils/validator.dart';
import 'package:nuntium/widgets/custom_text_field.dart';
import 'package:nuntium/widgets/list_items/category_list_item.dart';
import 'package:page_transition/page_transition.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          top: SizeConfig.blockSizeVertical * 1,
          left: SizeConfig.blockSizeHorizontal * 3,
          right: SizeConfig.blockSizeHorizontal * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                FlutterIcons.md_arrow_back_ion,
                color: blackPrimary,
                size: 30,
              ),
            ),
            Text(
              _selectedCategory,
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

    final newsBulletin = ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      children: _categories.map((category) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeVertical * 2,
            right: SizeConfig.blockSizeVertical * 2,
          ),
          child: InkWell(
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
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AvailableImages.placeholder["assetPath"],
                    fit: BoxFit.cover,
                    width: SizeConfig.blockSizeHorizontal * 100,
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
          SizeConfig.blockSizeVertical * 27,
        ),
        child: appBar,
      ),
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
              child: categories,
            ),
          ),
          Expanded(child: newsBulletin),
        ],
      ),
    );
  }
}
