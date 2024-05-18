import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/placeholders.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContestPage extends StatelessWidget {
  const LoadingContestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 500),
      baseColor: MyColors.lightGrey,
      highlightColor: MyColors.lightGrey.withOpacity(.5),
      enabled: true,
      direction: ShimmerDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentPlaceholder(width: double.infinity, height: MySizes.size20SW),
          SizedBox(height: MySizes.size10SW),
          ContentPlaceholder(width: double.infinity, height: MySizes.size20SW),
          SizedBox(height: MySizes.size25SW),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySizes.size25SW),
            child: Row(
              children: [
                CategoryPlaceholder(
                    width: MySizes.size175SW, height: MySizes.size45SW),
                CategoryPlaceholder(
                    width: MySizes.size175SW, height: MySizes.size45SW),
              ],
            ),
          ),
          SizedBox(height: MySizes.size25SW),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            width: double.infinity,
            height: MySizes.size80SW,
          )
        ],
      ),
    );
  }
}
