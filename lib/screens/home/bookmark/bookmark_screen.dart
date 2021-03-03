import 'package:flutter/material.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/widgets/list_items/bookmark_list_item.dart';

class BookmarkScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const BookmarkScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final bookmarks = [
    "vugbh",
    "vugbh",
    "vugbh",
    "vugbh",
    "vugbh",
    "vugbh",
    "vugbh",
    "vugbh",
    "vugbh",
  ];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bookmarks",
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
                "Saved articles to the library",
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
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: bookmarks.length == 0
          ? Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
                bottom: SizeConfig.blockSizeVertical * 5,
                left: SizeConfig.blockSizeHorizontal * 8,
                right: SizeConfig.blockSizeHorizontal * 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: greyLighter,
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset(
                      AvailableIcons.bookmarkEmpty["assetPath"],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3.5,
                  ),
                  Text(
                    "You haven't saved any articles yet.\n"
                    "Start reading and bookmarking them now.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AvailableFonts.primaryFont,
                      color: blackPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3,
                  left: SizeConfig.blockSizeHorizontal * 3,
                  right: SizeConfig.blockSizeHorizontal * 3,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: bookmarks.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, position) {
                          return BookmarkViewItem("");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

