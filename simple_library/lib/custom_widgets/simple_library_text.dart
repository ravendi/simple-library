import 'package:flutter/material.dart';
import 'package:simplelibrary/constants/app_colors.dart';

class SimpleLibraryText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const SimpleLibraryText({Key key, this.text, this.fontSize = 20, this.color = AppColors.primaryText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Satisfy',
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
