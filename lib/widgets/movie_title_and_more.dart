import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import 'easy_text.dart';

class MovieTitleAndMore extends StatelessWidget {
  String title, more;
  MovieTitleAndMore({Key? key, required this.title, this.more = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP10x),
      child: Row(
        children: [
          EasyText(
            text: title,
            fontWeight: FontWeight.bold,
            color: kTitleTextColor,
            fontSize: kFontSize14x,
          ),
          const Spacer(),
          EasyText(
            text: more,
            fontWeight: FontWeight.bold,
            color: kWhite,
            fontSize: kFontSize12x,
            underLine: TextDecoration.underline,
          ),
        ],
      ),
    );
  }
}
