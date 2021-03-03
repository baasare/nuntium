import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:share/share.dart';


class NewsDetailScreen extends StatefulWidget {
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String link = "https://www.bbc.com/news/election/us2020/results";
  String subject = "The latest situation in the presidential election";

  void _share(BuildContext context, String link, subject) {
    final RenderBox box = context.findRenderObject();
    Share.share(
      link,
      subject: subject,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 5,
        bottom: SizeConfig.blockSizeVertical * 15,
        left: SizeConfig.blockSizeHorizontal * 3,
        right: SizeConfig.blockSizeHorizontal * 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              FlutterIcons.md_arrow_back_ion,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Icon(
                FlutterIcons.bookmark_outline_mco,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2.5,
              ),
              InkWell(
                onTap: () => _share(context, link, subject),
                child: Icon(
                  FlutterIcons.share_outline_mco,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/placeholder.png",
            fit: BoxFit.cover,
            height: SizeConfig.blockSizeVertical * 60,
            width: SizeConfig.blockSizeHorizontal * 100,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar,
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 3,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RawMaterialButton(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 5,
                              right: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            child: Text(
                              "Politics",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: AvailableFonts.primaryFont,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          fillColor: purplePrimary,
                          onPressed: null,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 1.5,
                        ),
                        Text(
                          "The latest situation in the presidential election",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AvailableFonts.primaryFont,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 0.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 5,
                      right: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Article",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AvailableFonts.primaryFont,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: 0.0,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 3.5,
                        ),
                        Text(
                          "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\n"
                          "For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.\n\n"
                          "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. \n\n"
                          "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.\n\n"
                          "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. \n\n"
                          "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.\n\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AvailableFonts.primaryFont,
                            color: greyPrimary,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            wordSpacing: 2.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
