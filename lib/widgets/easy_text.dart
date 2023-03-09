import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';

class EasyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underLine;

  const EasyText(
      {super.key,
      required this.text,
      this.color = kWhite,
      this.fontSize = kFontSize14x,
      this.fontWeight = FontWeight.normal,
      this.underLine = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: underLine
              ),
    );
  }
}
