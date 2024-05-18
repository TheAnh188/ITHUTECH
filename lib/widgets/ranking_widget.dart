import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/fade_animation.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_response.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class RankingWidget extends StatelessWidget {
  final double height;
  final String path;
  final Standing standing;
  final int ranking;
  final Color? color;
  final TextStyle? style;

  const RankingWidget({
    super.key,
    required this.height,
    required this.path,
    required this.standing,
    required this.ranking,
    required this.color,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.0,
      0,
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: MySizes.size80SW,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MySizes.size120SW,
            child: Center(
              child: Text(
                // standing.nickname ?? '',
                standing.nickname
                        ?.substring(standing.nickname!.lastIndexOf(' ')) ??
                    '',
                style: MyTextStyles.content15BoldBlackSW,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: MySizes.size5SW),
          Container(
            width: MySizes.size100SW,
            padding: EdgeInsets.symmetric(horizontal: MySizes.size10SW),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySizes.size15SW),
              color: MyColors.lightGrey.withOpacity(.5),
            ),
            child: Center(
              child: Text(
                'Điểm: ${standing.score}',
                style: MyTextStyles.content16RegularBlackSW,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: MySizes.size10SW),
          Container(
            width: MySizes.size120SW,
            height: height,
            decoration: BoxDecoration(color: color),
            child: Center(
              child: Text(
                '$ranking',
                style: style,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
