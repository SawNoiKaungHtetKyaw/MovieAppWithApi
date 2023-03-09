import 'package:flutter/material.dart';
import 'package:movie_project/constants/strings.dart';
import 'package:movie_project/data/apply/movie_apply.dart';
import 'package:movie_project/data/apply/movie_apply_impl.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/pages/movie_details_page/movie_details.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../widgets/easy_text.dart';
import '../../../utils/extension.dart';

class ShowCasesItemView extends StatefulWidget {
  const ShowCasesItemView({Key? key}) : super(key: key);

  @override
  State<ShowCasesItemView> createState() => _ShowCasesItemViewState();
}

class _ShowCasesItemViewState extends State<ShowCasesItemView> {
  //Controller
  final ScrollController _controller = ScrollController();

  //List
  List<MovieVo>? showCaseList = [];

  //Variable
  int page = 1;

  //Instance object
  MovieApply movieApply = MovieApplyImpl();

  getShowCaseList() {
    movieApply.getShowCaseMovieListFromDatabaseStream(page).listen((event) {
      if (mounted) {
        setState(() {
          showCaseList = event ?? [];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getShowCaseList();

    ///Control
    _controller.addListener(() async {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          page++;
          movieApply.getPopularMovieRespone(page).then((value) {
            var temp = value ?? [];
            if (mounted) {
              setState(() {
                temp.forEach((element) {
                  showCaseList?.add(element);
                });
              });
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kShowCaseHeight,
      child: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: showCaseList?.length ?? 0,
          itemBuilder: (context, index) {
            var image = showCaseList?[index].backdropPath;
            String imageUrl = image?.getImage() ?? '';
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MovieDetails(id: showCaseList?[index].id ?? 0),)
              ),
              child: Container(
                margin: const EdgeInsets.only(left: kSP10x),
                width: kShowCaseWidth,
                height: kShowCaseHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage((image != null) ? imageUrl : kNullImage),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_circle_fill,
                        size: kIconSize50x,
                        color: kPlayButtonColor,
                      ),
                    ),
                    Positioned(
                      bottom: kSP10x,
                      left: kSP10x,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: kShowCaseWidth,
                            child: EasyText(
                              text: showCaseList?[index].title ?? '',
                              color: kWhite,
                              fontSize: kFontSize18x,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          EasyText(
                            text:
                                "Release Date - ${showCaseList?[index].releaseDate ?? ''}",
                            color: Colors.grey.shade300,
                            fontSize: kFontSize14x,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
