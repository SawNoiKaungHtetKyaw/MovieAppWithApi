import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/pages/movie_details_page/movie_details_widget/rating_and_vote_Itemview.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../constants/strings.dart';
import '../../../data/vos/movie_details_vo.dart';
import '../../../widgets/easy_text.dart';
import '../../../widgets/gradient_box.dart';
import '../../../utils/extension.dart';

class AppBarAndImageItemView extends StatelessWidget {
  const AppBarAndImageItemView(
      {Key? key, required this.onTap, required this.movieDetails})
      : super(key: key);

  final MovieDetailsVo movieDetails;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var image = movieDetails.backdropPath;
    var imageUrl = image?.getImage() ?? '';
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kSecondaryColor,
      floating: true,
      expandedHeight: kDetailImageHeight,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            //Detail image
            DeatilImageView(
              movieDetailImage: (image != null) ? imageUrl : kNullImage,
            ),

            //Gradient Box
            const GradientBox(),

            //App bar back and search icon, rating , vote and movie name
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kSP10x, vertical: kSP20x),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //App Bar Back And search icons
                    BackAndSearchIconView(
                      onTap: () => onTap(),
                    ),

                    const Spacer(),

                    //Rating and vote showing
                    RatingAndVoteItemView(movieDetails: movieDetails),

                    const SizedBox(height: kSP10x),

                    //Details movie name
                    EasyText(
                      text: "${movieDetails.title}",
                      fontSize: kFontSize24x,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DeatilImageView extends StatelessWidget {
  const DeatilImageView({
    Key? key,
    required this.movieDetailImage,
  }) : super(key: key);

  final String movieDetailImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Hero(
          tag: movieDetailImage,
          child: CachedNetworkImage(
            imageUrl: movieDetailImage,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ));
  }
}


class BackAndSearchIconView extends StatelessWidget {
  const BackAndSearchIconView({Key? key, required this.onTap})
      : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: kBlack.withOpacity(0.6),
          child: IconButton(
            onPressed: () {
              onTap();
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: kWhite,
              size: kIconSize20x,
            ),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.search_rounded,
          size: kIconSize34x,
          color: kWhite,
        )
      ],
    );
  }
}
