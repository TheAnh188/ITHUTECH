import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/placeholders.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAssignmentPage extends StatelessWidget {
  const LoadingAssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 500),
      baseColor: MyColors.lightGrey,
      highlightColor: MyColors.lightGrey.withOpacity(.5),
      enabled: true,
      direction: ShimmerDirection.ltr,
      child: Column(
        children: [
          SizedBox(height: MySizes.size30SW),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          ),
          BannerPlaceholder(
            margin: true,
            width: double.infinity,
            height: MySizes.size80SW,
          )
        ],
      ),
    );
  }
}
