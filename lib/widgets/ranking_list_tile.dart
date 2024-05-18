import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_response.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class RankingListTile extends StatelessWidget {
  final Standing standing;
  final int ranking;
  const RankingListTile(
      {super.key, required this.standing, required this.ranking});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
        ),
        margin: EdgeInsets.only(
          left: MySizes.size20SW,
          right: MySizes.size20SW,
          bottom: MySizes.size5SW,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: MySizes.size30SW,
                    height: MySizes.size30SW,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(MySizes.size15SW),
                      border: Border.all(
                        color: MyColors.lightGrey,
                        width: MySizes.size2SW,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      '$ranking',
                      style: MyTextStyles.content14MediumGreySW,
                    )),
                  ),
                  SizedBox(width: MySizes.size10SW),
                  SizedBox(
                    width: MySizes.size190SW,
                    child: Text(
                      standing.nickname ?? '',
                      style: MyTextStyles.content17RegularBlackSW,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MySizes.size90SW,
                child: Text(
                  'Điểm: ${standing.score ?? ''}',
                  style: MyTextStyles.content17MediumBlackSW,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ));
  }
}
