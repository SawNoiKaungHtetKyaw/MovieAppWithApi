import 'package:flutter/material.dart';
import 'package:movie_project/bloc/details_page_bloc.dart';
import 'package:movie_project/pages/movie_details_page/movie_details_widget/about_flim_item_view.dart';
import 'package:movie_project/pages/movie_details_page/movie_details_widget/actor_and_creator_itemview.dart';
import 'package:movie_project/pages/movie_details_page/movie_details_widget/related_movie_list.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/demis.dart';
import '../../constants/strings.dart';
import '../../widgets/movie_title_and_more.dart';
import 'movie_details_widget/appbar_and_image_itemview.dart';
import 'movie_details_widget/genre_type_item_view.dart';
import 'movie_details_widget/movie_description_and_button_itemview.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  MovieDetails({super.key, required this.id});
  final int id;

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailsPageBloc>(
      create: (context) => DetailsPageBloc(id, 1),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: Consumer<DetailsPageBloc>(
          builder: (_, bloc, child) => (bloc.getMovieDetails == null)
              ? const Center(child: CircularProgressIndicator())
              : NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    AppBarAndImageItemView(
                        movieDetails: bloc.getMovieDetails!,
                        onTap: () {
                          Navigator.of(context).pop();
                        })
                  ],
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Movie Genres , duration and favorite
                        GenreTypeItemView(
                            genres: bloc.getMovieDetails?.genres ?? []),

                        //Title of Story Lines
                        MovieTitleAndMore(title: kStorylines),

                        //Movie description , Play trailer and rate movie button.icon
                        MovieDescriptionAndButtonItemView(
                            overview: bloc.getMovieDetails?.overview ?? ''),

                        const SizedBox(
                          height: kSP20x,
                        ),

                        // Actor List(Cast)
                        (bloc.getCastList.isNotEmpty)
                            ? ActorAndCreatorItemView(
                                actorList: bloc.getCastList,
                                title: kActors,
                                more: '',
                              )
                            : const Center(child: CircularProgressIndicator()),

                        //Sized box
                        const SizedBox(
                          height: kSP20x,
                        ),

                        //About Flim
                        AboutFlimItemView(movie: bloc.getMovieDetails),

                        //Sized box
                        const SizedBox(
                          height: kSP20x,
                        ),

                        //Creators List(Crew)
                        (bloc.getCrewList.isNotEmpty)
                            ? ActorAndCreatorItemView(
                                actorList: bloc.getCrewList,
                                title: kCreators,
                                more: kMoreCreators,
                              )
                            : const Center(child: CircularProgressIndicator()),

                        //Sized box
                        const SizedBox(
                          height: kSP20x,
                        ),

                        //Related Movies
                        RelatedMovie(
                          movie: bloc.getSimilarMovieList,
                          title: kRelatedMovies,
                          movieId: id,
                          controller: controller,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
