import 'package:flutter/material.dart';
import 'package:movie_project/widgets/actor_list_builder.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../data/apply/movie_apply.dart';
import '../../../data/apply/movie_apply_impl.dart';
import '../../../widgets/movie_title_and_more.dart';

class BestActorListItemView extends StatefulWidget {
  const BestActorListItemView({super.key,required this.actorList,required this.title,required this.more});
  final List<dynamic> actorList;
  final String title, more;

  @override
  State<BestActorListItemView> createState() => _BestActorListItemViewState();
}

class _BestActorListItemViewState extends State<BestActorListItemView> {
  //Instance
  MovieApply movieApply = MovieApplyImpl();

  //Variable
  int page = 1;

  //List
  List<dynamic> actorsList = [];

  //controller
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    if (mounted) {
      setState(() {
        actorsList = widget.actorList;
      });
    }
    super.initState();
    _controller.addListener(() async {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          page++;
          await movieApply.getActorsRespone(page).then((value) {
            var temp = value ?? [];
            if (mounted) {
              setState(() {
                // ignore: avoid_function_literals_in_foreach_calls
                temp.forEach((actor) {
                  actorsList.add(actor);
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
    return Container(
      width: double.infinity,
      height: kActorListBoxHeight,
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MovieTitleAndMore(
            title: widget.title,
            more: widget.more,
          ),
          ActorListItemView(actorList: widget.actorList, controller: _controller),
          const SizedBox(
            height: kSP20x,
          )
        ],
      ),
    );
  
  }
}