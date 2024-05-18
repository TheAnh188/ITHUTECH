import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/utils/texts.dart';

class Introduction extends StatelessWidget {
  const Introduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.08.sh,
          alignment: Alignment.bottomCenter,
          // color: Colors.amber,
          child: Text(
            textAlign: TextAlign.justify,
            Texts.introductoryText1,
            style: MyTextStyles.content24MediumDarkRedkSW,
            maxLines: 1,
          ),
        ),
        SizedBox(
          // height: 0.27.sw,
          // height: 0.14.sh,
          child: Text(
            textScaler: const TextScaler.linear(1.1),
            Texts.introductoryText2,
            style: MyTextStyles.content18RegularBlackSW,
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          // height: 0.65.sw,
          // height: 0.38.sh,
          child: Text(
            textScaler: const TextScaler.linear(1.1),
            Texts.introductoryText3,
            style: MyTextStyles.content18RegularBlackSW,
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          // height: 0.23.sw,
          // height: 0.14.sh,
          child: Text(
            textScaler: const TextScaler.linear(1.1),
            Texts.introductoryText4,
            style: MyTextStyles.content18RegularBlackSW,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
