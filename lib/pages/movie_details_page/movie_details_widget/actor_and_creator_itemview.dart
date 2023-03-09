import 'package:flutter/material.dart';
import 'package:movie_project/widgets/actor_list_builder.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../widgets/movie_title_and_more.dart';

class ActorAndCreatorItemView extends StatelessWidget {
  const ActorAndCreatorItemView(
      {super.key,
      required this.actorList,
      required this.title,
      required this.more});
  final List<dynamic> actorList;
  final String title, more;

  @override
  Widget build(BuildContext context) {
    //controller
    final ScrollController _controller = ScrollController();
    return Container(
      width: double.infinity,
      height: kActorListBoxHeight,
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MovieTitleAndMore(
            title:title,
            more: more,
          ),
          ActorListItemView(actorList: actorList, controller: _controller),
          const SizedBox(
            height: kSP20x,
          )
        ],
      ),
    );
  }
}
