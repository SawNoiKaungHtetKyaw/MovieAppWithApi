
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../constants/strings.dart';
import '../../../widgets/easy_text.dart';

class CheckMovieAndShowTimes extends StatelessWidget {
  const CheckMovieAndShowTimes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kSP10x),
      padding: const EdgeInsets.all(kSP20x),
      width: double.maxFinite,
      height: kCheckMovieShowTimesBoxHeight,
      color: kPrimaryColor,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EasyText(
                text: kCheckMovieShowtimes,
                fontSize: kFontSize24x,
                fontWeight: FontWeight.w500,
              ),
              EasyText(
                text: kSeemore,
                fontSize: kFontSize14x,
                fontWeight: FontWeight.bold,
                color: kPlayButtonColor,
                underLine: TextDecoration.underline,
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.location_on,
            size: kIconSize50x,
            color: kWhite,
          )
        ],
      ),
    );
  }
}
