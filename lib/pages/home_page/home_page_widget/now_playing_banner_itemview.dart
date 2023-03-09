import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_project/pages/movie_details_page/movie_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../constants/strings.dart';
import '../../../data/vos/movie_vo.dart';
import '../../../widgets/easy_text.dart';
import '../../../widgets/gradient_box.dart';
import '../../../utils/extension.dart';

class NowPlayingBannerItemView extends StatelessWidget {
  const NowPlayingBannerItemView(
      {super.key,
      required this.getNowPlayingMovieList,
      required this.pageController,
      required this.onDottedClick});

  final List<MovieVo> getNowPlayingMovieList;
  final PageController pageController;
  final Function(int) onDottedClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      padding: const EdgeInsets.only(bottom: kSP10x),
      child: Column(
        children: [
          SizedBox(
              width: double.maxFinite,
              height: kBannerBoxHeight,
              child: (getNowPlayingMovieList.isNotEmpty)
                  ? BannerPageView(
                      pageController: pageController,
                      getNowPlayingMovieList: getNowPlayingMovieList)
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
          const SizedBox(height: kSP5x),
          Center(
            child: SmoothPageIndicator(
              onDotClicked: (index) => onDottedClick(index),
              controller: pageController,
              count: 5,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                  spacing: kSP10x,
                  radius: kSP20x,
                  dotWidth: kSP10x,
                  dotHeight: kSP10x,
                  dotColor: Colors.grey,
                  activeDotColor: kPlayButtonColor),
            ),
          )
        ],
      ),
    );
  }
}

class BannerPageView extends StatelessWidget {
  const BannerPageView({
    super.key,
    required this.pageController,
    required this.getNowPlayingMovieList,
  });

  final PageController pageController;
  final List<MovieVo> getNowPlayingMovieList;

  @override
  Widget build(BuildContext context) {
    List<MovieVo> temp = [];
    Random random = Random();
    for (int i = 0; i < 5; i++) {
      int index = random.nextInt(getNowPlayingMovieList.length);
      temp.add(getNowPlayingMovieList[index]);
    }
    return PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          var image = temp[index].backdropPath;
          String imageUrl = image?.getImage() ?? '';
          var title = temp[index].title;

          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MovieDetails(id: temp[index].id ?? 0))),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.network(
                  (image != null) ? imageUrl : kNullImage,
                  fit: BoxFit.cover,
                )),
                const Positioned.fill(child: GradientBox()),
                Positioned(
                    left: kSP10x,
                    right: kSP10x,
                    bottom: kSP20x,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: EasyText(
                        text: title ?? '',
                        fontSize: kFontSize24x,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
