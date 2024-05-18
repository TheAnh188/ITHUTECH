import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/placeholders.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHomePage extends StatelessWidget {
  const LoadingHomePage({super.key});

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
          SizedBox(height: MySizes.size10SW),
          BannerPlaceholder(
            radius: MySizes.size10SW,
            width: double.infinity,
            height: MySizes.size220SW,
          ),
          SizedBox(height: MySizes.size20SW),
          Row(
            children: [
              BannerPlaceholder(
                radius: MySizes.size45SW,
                width: MySizes.size45SW,
                height: MySizes.size45SW,
              ),
              SizedBox(width: MySizes.size8SW),
              Column(
                children: [
                  BannerPlaceholder(
                    width: MySizes.size250SW,
                    height: MySizes.size8SW,
                  ),
                  SizedBox(height: MySizes.size10SW),
                  BannerPlaceholder(
                    width: MySizes.size250SW,
                    height: MySizes.size8SW,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: MySizes.size20SW),
          BannerPlaceholder(
            radius: MySizes.size10SW,
            width: double.infinity,
            height: MySizes.size220SW,
          ),
          SizedBox(height: MySizes.size20SW),
          Row(
            children: [
              BannerPlaceholder(
                radius: MySizes.size45SW,
                width: MySizes.size45SW,
                height: MySizes.size45SW,
              ),
              SizedBox(width: MySizes.size8SW),
              Column(
                children: [
                  BannerPlaceholder(
                    width: MySizes.size250SW,
                    height: MySizes.size8SW,
                  ),
                  SizedBox(height: MySizes.size10SW),
                  BannerPlaceholder(
                    width: MySizes.size250SW,
                    height: MySizes.size8SW,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
