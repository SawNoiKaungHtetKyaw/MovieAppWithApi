import 'package:flutter/material.dart';
import 'package:movie_project/bloc/home_page_bloc.dart';
import 'package:movie_project/constants/colors.dart';
import 'package:movie_project/constants/demis.dart';
import 'package:movie_project/constants/strings.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/pages/home_page/home_page_widget/best_actor_list_itemview.dart';
import 'package:movie_project/pages/home_page/home_page_widget/show_case_itemview.dart';
import 'package:movie_project/widgets/easy_text.dart';
import 'package:movie_project/widgets/movie_title_and_more.dart';
import 'package:movie_project/pages/home_page/home_page_widget/title_and_movie_list.dart';
import 'package:provider/provider.dart';

import '../../data/vos/actors_vo.dart';
import 'home_page_widget/check_movie_show_time.dart';
import 'home_page_widget/movie_by_genre_itemview.dart';
import 'home_page_widget/now_playing_banner_itemview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller
    final PageController controller = PageController();
    final ScrollController scrollController = ScrollController();

    //Page
    int page = 1;

    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(page, 0),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const EasyText(
            text: kDiscover,
            fontSize: kFontSize18x,
            fontWeight: FontWeight.bold,
            color: kWhite,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: kSP10x),
              child: Icon(
                Icons.search,
                size: kIconSize28x,
              ),
            )
          ],
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///Banner Movie List ItemView
              Selector<HomePageBloc, List<MovieVo>>(
                  selector: (_, bloc) => bloc.getNowPlayingMovieList,
                  builder: (_, value, child) => (value.isNotEmpty)
                      ? NowPlayingBannerItemView(
                          getNowPlayingMovieList: value,
                          pageController: controller,
                          onDottedClick: (index) {
                            controller.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        )),

              //Best Popular Movies and serials ItemView
              Selector<HomePageBloc, List<MovieVo>>(
                  selector: (_, bloc) => bloc.getPopularMovieList,
                  builder: (_, value, child) => (value.isNotEmpty)
                      ? BestPopularMovieAndSerialsItemView(
                          movie: value,
                          title: kBestPopularMAndS,
                          controller: scrollController)
                      : const Center(
                          child: CircularProgressIndicator(),
                        )),

              //Check Movie Showtimes ItemView
              const CheckMovieAndShowTimes(),

              //Movie by genre ItemView
              const MovieByGenreItemView(),

              //sized box
              const SizedBox(height: kSP10x),

              //ShowCases ItemView
              Column(
                children: [
                  MovieTitleAndMore(
                    title: kShowcases,
                    more: kMoreShowCases,
                  ),
                  const ShowCasesItemView(),
                ],
              ),

              //sized box
              const SizedBox(height: kSP20x),

              //Actor List Builder ItemView
              Selector<HomePageBloc, List<ActorsVo>>(
                selector: (_, bloc) => bloc.getActorsList,
                builder: (_, actors, child) => (actors.isNotEmpty)
                    ? BestActorListItemView(
                        actorList: actors,
                        title: kBestActors,
                        more: kMoreActors)
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),

              //sized box
              const SizedBox(height: kSP20x)
            ],
          ),
        ),
      ),
    );
  }
}
