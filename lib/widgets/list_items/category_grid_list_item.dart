import 'package:flutter/material.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';

class GridViewItem extends StatelessWidget {
  final String _category;
  final bool _isSelected;

  GridViewItem(this._category, this._isSelected);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
