import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Future<String?> getNickName() async {
  LocalStorageRepo localRepo = Get.find();
  return localRepo.getNickName();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: MySizes.size50SW),
            child: Column(
              children: <Widget>[
                Image.asset(
                  Images.logo,
                  width: Get.width * 0.3,
                ),
                Container(
                  width: Get.width * 0.85,
                  alignment: Alignment.center,
                  child: Text(
                    "Hệ thống hỗ trợ học tập cho Sinh viên\n Khoa Công nghệ thông tin HUTECH",
                    textAlign: TextAlign.center,
                    style: MyTextStyles.content16BoldWhiteSW,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Text("Xin chào", style: MyTextStyles.content20BoldBlackSW),
              FutureBuilder(
                future: getNickName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? '',
                      style: MyTextStyles.content20BoldBlackSW,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
          Image.asset(Images.banner),
        ],
      ),
    );
  }
}
