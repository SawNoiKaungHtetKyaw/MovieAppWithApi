import 'package:flutter/material.dart';
import 'package:movie_project/constants/strings.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import 'easy_text.dart';
import '../utils/extension.dart';

class ActorListItemView extends StatelessWidget {
  const ActorListItemView(
      {super.key,
      required this.actorList,
      required this.controller});
  final List<dynamic> actorList;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: kActorBoxHeight,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: actorList.length,
          itemBuilder: (context, index) => ActorsCard(
            actor: actorList[index],
          ),
        ));
  }
}

class ActorsCard extends StatelessWidget {
  const ActorsCard({Key? key, required this.actor}) : super(key: key);
  final dynamic actor;

  @override
  Widget build(BuildContext context) {
    String? image = actor.profilePath;
    var imageUrl = image?.getImage() ?? '';

    var popularity = actor.popularity.toString();
    var like = popularity.split('.');
    return Container(
      width: kActorBoxWidth,
      height: kActorBoxHeight,
      margin: const EdgeInsets.only(left: kSP10x),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage((image != null) ? imageUrl : kNullImage),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          const Positioned(
            right: kSP10x,
            top: kSP10x,
            child: Icon(
              Icons.favorite_border,
              color: kWhite,
            ),
          ),
          Positioned(
            bottom: kSP10x,
            left: kSP10x,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyText(
                  text: actor.name ?? "",
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.thumb_up,
                      color: kPlayButtonColor,
                      size: 14,
                    ),
                    const SizedBox(
                      width: kSP10x,
                    ),
                    EasyText(
                      text: "YOU LIKE ${like[0]} MOVIES",
                      fontSize: kFontSize12x,
                      color: kTitleHintText,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
