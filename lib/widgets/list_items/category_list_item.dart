import 'package:flutter/material.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';

class CategoryListViewItem extends StatelessWidget {
  final String _category;
  final bool _isSelected;

  CategoryListViewItem(this._category, this._isSelected);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 2,
      ),
      child: RawMaterialButton(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 5,
            right: SizeConfig.blockSizeHorizontal * 5,
          ),
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
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        fillColor: _isSelected ? purplePrimary : greyLighter,
        onPressed: null,
      ),
    );
  }
}
