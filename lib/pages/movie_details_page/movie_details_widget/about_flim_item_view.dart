import 'package:flutter/material.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/widgets/movie_title_and_more.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../constants/strings.dart';
import '../../../widgets/easy_text.dart';

class AboutFlimItemView extends StatelessWidget {
  const AboutFlimItemView({Key? key, required this.movie}) : super(key: key);

  final MovieDetailsVo? movie;

  @override
  Widget build(BuildContext context) {
    List<String?> genres = [];
    List<String?> productionCountries = [];
    var genresList = movie?.genres ?? [];
    var productionCountriesList = movie?.productionCountries ?? [];
    productionCountriesList.forEach((country) {
      productionCountries.add(country.name);
     });
    
    genresList.forEach((element) {
      genres.add(element.name);
    });
    return Column(
      children: [
        MovieTitleAndMore(title: kAboutFlim),
        const SizedBox(height: kSP10x),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP10x),
          child: Column(
            children: [
              TitleAndDescriptionView(
                  des: movie?.originalTitle ?? '', title: kOriginalTitle),
              TitleAndDescriptionView(des: genres.join(","), title: kType),
              TitleAndDescriptionView(
                  des: productionCountries.join(','),
                  title: kProduction),
              TitleAndDescriptionView(
                  des: movie?.releaseDate ?? '', title: kPremiere),
              TitleAndDescriptionView(
                  des: movie?.overview ?? '', title: kDescription),
            ],
          ),
        ),
      ],
    );
  }
}

class TitleAndDescriptionView extends StatelessWidget {
  const TitleAndDescriptionView({
    Key? key,
    required this.des,
    required this.title,
  }) : super(key: key);

  final String title, des;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSP10x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: EasyText(
              text: title,
              color: kTitleHintText,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: EasyText(
              text: des,
              color: kWhite,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
