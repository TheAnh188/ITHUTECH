import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/data/check.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/services/app_services.dart';
import 'package:hutech_check_in_app/utils/app_config.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/load_image.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Thay đổi môi trường
  Get.put<AppEnvironment>(AppEnvironment.dev());

  await AppServices.initServices();

  // Preload images
  await loadImage(const AssetImage(Images.logo));
  await loadImage(const AssetImage(Images.banner));

  // Kiểm tra đăng nhập
  bool isLoggedIn = await Get.find<LocalStorageRepo>().checkLogin();

  // Chọn màn hình khởi động
  String initialRoute = isLoggedIn ? Routes.INIT : Routes.LOGIN;

  runApp(MyApp(initialRoute: initialRoute));
}

void configSystem(BuildContext context) async {
  var size = MediaQuery.of(context).size.width;
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 0.097 * size
    ..radius = 0.0243309 * size
    ..lineWidth = 0.0121 * size
    ..animationDuration = const Duration(milliseconds: 300)
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = true
    ..dismissOnTap = false
    ..loadingStyle = EasyLoadingStyle.custom
    ..fontSize = 0.035 * size
    ..progressColor = MyColors.blue
    ..textColor = MyColors.blue
    ..backgroundColor = MyColors.white
    ..indicatorColor = MyColors.blue
    ..contentPadding = EdgeInsets.symmetric(
        vertical: 0.035 * size, horizontal: 0.0486618 * size)
    ..textPadding = EdgeInsets.only(bottom: 0.0243309 * size)
    ..textStyle = TextStyle(fontSize: 0.0486618 * size, color: MyColors.blue)
    ..animationStyle = EasyLoadingAnimationStyle.offset;
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var size10 = size * 0.0243309;
    var size15 = size * 0.035;
    var size16 = size * 0.039;
    configSystem(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Check(),
        ),
      ],
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        builder: EasyLoading.init(),
        initialRoute: initialRoute,
        getPages: AppRoutes.pages,
        title: 'IT HUTECH',
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          listTileTheme: ListTileThemeData(
            horizontalTitleGap: size10,
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: size16),
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          ),
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(
              horizontal: size10,
              vertical: size15,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
