import 'package:flutter/material.dart';
import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';

class ProfileListItem extends StatelessWidget {
  final String _title;
  final bool _isSelected;

  ProfileListItem(this._title, this._isSelected);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      child: Container(
        height: SizeConfig.blockSizeVertical * 7,
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 2,
          bottom: SizeConfig.blockSizeVertical * 2,
          left: SizeConfig.blockSizeHorizontal * 4,
          right: SizeConfig.blockSizeHorizontal * 4,
        ),
        margin: EdgeInsets.only(
          bottom: SizeConfig.blockSizeVertical * 2,
        ),
        color: _isSelected ? purplePrimary : greyLighter,
        child: Text(
          _title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AvailableFonts.primaryFont,
            color: _isSelected ? Colors.white : greyPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 17,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
