import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../constants/strings.dart';
import '../../../widgets/easy_text.dart';

class MovieDescriptionAndButtonItemView extends StatelessWidget {
  const MovieDescriptionAndButtonItemView({
    Key? key,
    required this.overview
  }) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: Column(
        children: [
          EasyText(
            text: overview,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: kSP10x, horizontal: kSP10x),
                      backgroundColor: kPlayButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle,
                    color: kBlack.withOpacity(0.6),
                  ),
                  label: const EasyText(
                    text: kPlayTrailer,
                    fontWeight: FontWeight.bold,
                    fontSize: kFontSize14x,
                  )),
              const SizedBox(
                width: kSP10x,
              ),
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: kSP10x, horizontal: kSP10x),
                      side: const BorderSide(color: kWhite, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: kPlayButtonColor,
                  ),
                  label: const EasyText(
                    text: kRateMovie,
                    fontWeight: FontWeight.bold,
                    fontSize: kFontSize14x,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
