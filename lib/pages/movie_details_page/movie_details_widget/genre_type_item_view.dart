import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../constants/strings.dart';
import '../../../data/vos/genre_id_vo.dart';
import '../../../widgets/easy_text.dart';

class GenreTypeItemView extends StatelessWidget {
  const GenreTypeItemView({
    Key? key,
    required this.genres,
  }) : super(key: key);

  final List<GenreIdVo> genres;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: kSP5x,
      children: [
        const Chip(
            avatar: Icon(
              Icons.schedule,
              color: kPlayButtonColor,
            ),
            side: BorderSide.none,
            backgroundColor: kSecondaryColor,
            label: EasyText(
              text: kDuration,
              fontWeight: FontWeight.bold,
            )),
        for (int i = 0; i < genres.length; i++)
          Chip(
              backgroundColor: kPrimaryColor,
              label: EasyText(
                text: "${genres[i].name}",
              )),
        const Chip(
          backgroundColor: kSecondaryColor,
          label: Icon(
            Icons.favorite_border,
            color: kWhite,
          ),
        )
      ],
    );
  }
}
