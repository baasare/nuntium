import 'package:flutter/material.dart';
import 'package:nuntium/routes/routes.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';
import 'package:nuntium/widgets/custom_button.dart';

class PreSettingScreen extends StatefulWidget {
  @override
  _PreSettingScreenState createState() => _PreSettingScreenState();
}

class _PreSettingScreenState extends State<PreSettingScreen> {
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

  List<String> _selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select your favorite topics",
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
          "Select some of your favorite topics to let us suggest better news for you.",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AvailableFonts.primaryFont,
            color: greyPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 17,
            letterSpacing: 0.5,
          ),
        )
      ],
    );

    final categories = GridView.count(
      childAspectRatio: 2.5,
      crossAxisCount: 2,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      padding: EdgeInsets.symmetric(horizontal: 00.0, vertical: 20.0),
      children: _categories.map((category) {
        return GestureDetector(
          onTap: () {
            if (!_selectedCategories.contains(category)) {
              setState(() {
                _selectedCategories.add(category);
              });
            } else {
              setState(() {
                _selectedCategories.remove(category);
              });
            }
            // _selectedIcons.clear();
          },
          child: GridViewItem(category, _selectedCategories.contains(category)),
        );
      }).toList(),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
      ),
      child: CustomButton(
        buttonColor: purplePrimary,
        buttonText: "Next",
        buttonHeight: SizeConfig.blockSizeVertical * 6,
        buttonWidth: SizeConfig.blockSizeHorizontal * 100,
        buttonOnPressed: () {
          Navigator.of(context).pushNamed(
            verificationViewRoute,
          );
        },
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 5,
              bottom: SizeConfig.blockSizeVertical * 5,
              left: SizeConfig.blockSizeHorizontal * 5,
              right: SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title,
              Expanded(child: categories),
              submitBtn,
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  final String _category;
  final bool _isSelected;

  GridViewItem(this._category, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        _category,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: AvailableFonts.primaryFont,
          color: _isSelected ? Colors.white : greyDarker,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      fillColor: _isSelected ? purplePrimary : greyLighter,
      onPressed: null,
    );
  }
}
