import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_project/constants/hive_constants.dart';
import 'package:movie_project/data/vos/actors_vo.dart';
import 'package:movie_project/data/vos/belongs_to_collection_vo.dart';
import 'package:movie_project/data/vos/cast_vo.dart';
import 'package:movie_project/data/vos/crew_vo.dart';
import 'package:movie_project/data/vos/genre_id_vo.dart';
import 'package:movie_project/data/vos/known_for_vo.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/data/vos/production_companies_vo.dart';
import 'package:movie_project/data/vos/production_countries_vo.dart';
import 'package:movie_project/data/vos/spoken_languages_vo.dart';
import 'package:movie_project/network/respone/credits_respone.dart';
import 'package:movie_project/network/respone/movie_by_genre_respone.dart';
import 'package:movie_project/pages/home_page/home_page.dart';

void main(List<String> args) async {
  await Hive.initFlutter();

  Hive.registerAdapter(MovieVoAdapter());
  Hive.registerAdapter(ActorsVoAdapter());
  Hive.registerAdapter(KnownForVoAdapter());
  Hive.registerAdapter(MovieDetailsVoAdapter());
  Hive.registerAdapter(BelongsToCollectionVoAdapter());
  Hive.registerAdapter(GenreIdVoAdapter());
  Hive.registerAdapter(ProductionCompaniesVoAdapter());
  Hive.registerAdapter(ProductionCountriesVoAdapter());
  Hive.registerAdapter(SpokenLanguagesVoAdapter());
  Hive.registerAdapter(CastVoAdapter());
  Hive.registerAdapter(CrewVoAdapter());
  Hive.registerAdapter(CreditsResponeAdapter());
  Hive.registerAdapter(MovieByGenreResponeAdapter());

  await Hive.openBox<MovieVo>(kHiveMovieBox);
  await Hive.openBox<MovieVo>(kHiveShowcaseBox);
  await Hive.openBox<ActorsVo>(kHiveActorsBox);
  await Hive.openBox<MovieDetailsVo>(kHiveMovieDetailsBox);
  await Hive.openBox<MovieByGenreRespone>(kHiveSimilarMovieBox);
  await Hive.openBox<CreditsRespone>(kHiveCreditResponeBox);
  await Hive.openBox<GenreIdVo>(kHiveGenreIdBox);
  await Hive.openBox<MovieVo>(kHiveMovieByGenreBox);
  await Hive.openBox<int>(kHiveCountBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
