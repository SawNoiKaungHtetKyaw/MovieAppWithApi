import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_project/utils/extension.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../data/vos/movie_details_vo.dart';
import '../../../widgets/easy_text.dart';

class RatingAndVoteItemView extends StatelessWidget {
  const RatingAndVoteItemView({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  final MovieDetailsVo movieDetails;

  @override
  Widget build(BuildContext context) {
    String releaseDate = movieDetails.releaseDate ?? '0-0-0';
    var split = releaseDate.split('-');
    String releaseYear = split[0];

    int vote = movieDetails.voteCount?? 0;
    return Row(
      children: [
        Container(
          width: kReleaseDateBoxWidth,
          height: kReleaseDateBoxHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: kPlayButtonColor, borderRadius: BorderRadius.circular(40)),
          child: EasyText(
            text: releaseYear,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Rating Bar
            RatingBarView(rating: movieDetails.voteAverage ?? 0),
            const SizedBox(
              width: kSP10x,
            ),

            //     //Vote or Votes
            EasyText(
              text: vote.toString().getVote(),
              fontWeight: FontWeight.bold,
              color: kTitleHintText,
            ),
          ],
        ),

        // //Movie Rating number
        EasyText(
          text: "${movieDetails.voteAverage}",
          fontSize: kFontSize50x,
        )
      ],
    );
  }
}

class RatingBarView extends StatelessWidget {
  const RatingBarView({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    var rate = rating / 2;
    return RatingBar(
      initialRating: rate,
      itemSize: kRatingSize16x,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: kPlayButtonColor,
        ),
        half: const Icon(
          Icons.star_half,
          color: kPlayButtonColor,
        ),
        empty: const Icon(
          Icons.star,
          color: kRatingEmptyColor,
        ),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
