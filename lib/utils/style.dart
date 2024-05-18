import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {
  static const Color blue = Color.fromRGBO(33, 150, 243, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color green = Color.fromRGBO(76, 175, 80, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color grey = Color.fromRGBO(158, 158, 158, 1);
  static const Color lightGrey = Color.fromRGBO(224, 224, 224, 1);
  static const Color lightGreyAccent = Color.fromRGBO(199, 200, 204, 1);
  static const Color greyAccent = Color.fromRGBO(180, 180, 184, 1);
  static const Color red = Color.fromRGBO(244, 67, 54, 1);
  static const Color greenAccent = Color.fromRGBO(105, 240, 174, 1);
  static const Color darkRed = Color.fromRGBO(207, 7, 7, 1);
  static const Color lightGreen = Color.fromRGBO(81, 203, 85, 1);
  static const Color orange = Color.fromRGBO(255, 140, 0, 1);
  static const Color lightBlueAccent = Color.fromRGBO(64, 196, 255, 1);
  static const Color blueGrey = Color.fromRGBO(96, 125, 139, 1);
  static const Color blueEgg = Color.fromRGBO(154, 234, 252, 1.0);
  static const Color lightBlue = Color.fromRGBO(3, 169, 244, 1);
  static const Color lightRed = Color.fromRGBO(255, 104, 104, 1);
  static const Color lightBrown = Color(0xFFFFF2E1);
  static const Color darkBlue = Color(0xFF387ADF);
  static const Color blueDart = Color.fromRGBO(8, 38, 71, 1.0);
}

class MySizes {
  static double size1SW = 0.00243309 * Get.width;
  static double size2SW = 0.004866 * Get.width;
  static double size5SW = 0.0121 * Get.width;
  static double size8SW = 0.019 * Get.width;
  static double size10SW = 0.0243309 * Get.width;
  static double size12SW = 0.03 * Get.width;
  static double size14SW = 0.034 * Get.width;
  static double size15SW = 0.035 * Get.width;
  static double size16SW = 0.039 * Get.width;
  static double size17SW = 0.041 * Get.width;
  static double size18SW = 0.044 * Get.width;
  static double size20SW = 0.0486618 * Get.width;
  static double size22SW = 0.0535 * Get.width;
  static double size24SW = 0.0584 * Get.width;
  static double size25SW = 0.06 * Get.width;
  static double size26SW = 0.06326 * Get.width;
  static double size28SW = 0.068 * Get.width;
  static double size30SW = 0.075 * Get.width;
  static double size32SW = 0.078 * Get.width;
  static double size35SW = 0.0851 * Get.width;
  static double size40SW = 0.097 * Get.width;
  static double size45SW = 0.1094 * Get.width;
  static double size48SW = 0.11678 * Get.width;
  static double size50SW = 0.1216 * Get.width;
  static double size55SW = 0.1338 * Get.width;
  static double size56SW = 0.1362 * Get.width;
  static double size60SW = 0.146 * Get.width;
  static double size65SW = 0.158 * Get.width;
  static double size70SW = 0.1703163 * Get.width;
  static double size72SW = 0.175 * Get.width;
  static double size80SW = 0.194 * Get.width;
  static double size120SW = 0.292 * Get.width;
  static double size85SW = 0.2 * Get.width;
  static double size90SW = 0.2189 * Get.width;
  static double size100SW = 0.2433 * Get.width;
  static double size110SW = 0.2676 * Get.width;
  static double size130SW = 0.3163 * Get.width;
  static double size135SW = 0.328467 * Get.width;
  static double size145SW = 0.35279 * Get.width;
  static double size150SW = 0.3649 * Get.width;
  static double size160SW = 0.389 * Get.width;
  static double size165SW = 0.40146 * Get.width;
  static double size170SW = 0.4136253 * Get.width;
  static double size175SW = 0.42579 * Get.width;
  static double size180SW = 0.4379562 * Get.width;
  static double size190SW = 0.4622 * Get.width;
  static double size200SW = 0.4866 * Get.width;
  static double size210SW = 0.5109 * Get.width;
  static double size220SW = 0.5352798 * Get.width;
  static double size245SW = 0.596 * Get.width;
  static double size250SW = 0.6082725 * Get.width;
  static double size280SW = 0.6812652 * Get.width;
  static double size300SW = 0.73 * Get.width;
}

class MyTextStyles {
  static TextStyle content17MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size17SW,
  );

  static TextStyle content15RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-REGULAR',
    fontSize: MySizes.size15SW,
  );

  static TextStyle content12MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size12SW,
  );
  static TextStyle content15MediumDarkRedSW = TextStyle(
    color: MyColors.darkRed,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size15SW,
  );

  static TextStyle content18RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-REGULAR',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content18MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content24MediumDarkRedkSW = TextStyle(
    color: MyColors.darkRed,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size24SW,
  );
  static TextStyle content30MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size30SW,
  );
  static TextStyle content30MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size30SW,
  );
  static TextStyle content25MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size25SW,
  );
  static TextStyle content26MediumBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size26SW,
  );
  static TextStyle content17RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-REGULAR',
    fontSize: MySizes.size17SW,
  );
  static TextStyle content17MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size17SW,
  );
  static TextStyle content16RegularBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-REGULAR',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content16RegularWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-REGULAR',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content16MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content32BoldBlackWS = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size32SW,
  );
  static TextStyle content20MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content14MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size14SW,
  );
  static TextStyle content22MediumBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size22SW,
  );
  static TextStyle content20MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content18MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content90BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size90SW,
  );
  static TextStyle content100BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size100SW,
  );
  static TextStyle content80BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size80SW,
  );
  static TextStyle content15BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size15SW,
  );
  static TextStyle content14MediumGreySW = TextStyle(
    color: MyColors.grey,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size14SW,
  );
  static TextStyle content25BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size25SW,
  );
  static TextStyle content22BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size22SW,
  );

  static TextStyle content16BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content18BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size18SW,
  );
  static TextStyle content14MediumDarkBlueSW = TextStyle(
    color: MyColors.darkBlue,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size14SW,
  );
  static TextStyle content16BoldRedSW = TextStyle(
    color: MyColors.red,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size16SW,
  );

  static TextStyle content16BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size16SW,
  );
  static TextStyle content15BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size15SW,
  );
  static TextStyle content18BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size18SW,
  );

  static TextStyle content20BoldWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content20BoldBlackSW = TextStyle(
    color: MyColors.black,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size20SW,
  );

  static TextStyle content16RegularBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-REGULAR',
    fontSize: MySizes.size16SW,
  );

  static TextStyle content16BoldBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size16SW,
  );

  static TextStyle content18BoldBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size18SW,
  );

  static TextStyle content20BoldBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-BOLD',
    fontSize: MySizes.size20SW,
  );

  static TextStyle content20MediumBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size20SW,
  );
  static TextStyle content22MediumBlueSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size22SW,
  );
  static TextStyle content15MediumWhiteSW = TextStyle(
    color: MyColors.white,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size15SW,
  );

  static TextStyle content14MediumBleSW = TextStyle(
    color: MyColors.blue,
    fontFamily: 'SF-UI-MEDIUM',
    fontSize: MySizes.size14SW,
  );
}
