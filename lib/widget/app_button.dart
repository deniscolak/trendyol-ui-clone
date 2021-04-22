import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:trendyol_ui_clone/constants.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;

  AppButton({this.type, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
            color: getButtonColor(type),
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: getBorderColor(type), width: 1)),
        child: Center(
          child: Text(
            this.text,
            style: GoogleFonts.openSans(
              color: getTextColor(type),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return Constants.primaryColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Constants.primaryColor;
  }
}

Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return kBlackColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Colors.white;
  }
}

Color getBorderColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return kBlackColor;
    case ButtonType.PRIMARY:
      return Colors.transparent;
    default:
      return Colors.white;
  }
}
