import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/home_page/api/home_dio.dart';
import 'package:hutech_check_in_app/pages/home_page/api/news_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class HomeHandle extends GetxController {
  HomeDio homeDio;

  HomeHandle({required this.homeDio});

  final newsLoadMore = <News>[].obs;

  // Used to display loading indicators when _firstLoad function is running
  var isFirstLoadRunning = false.obs;

  int page = 1;
  final int pageSize = 5;

  // There is next page or not
  var hasNextPage = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllNews();
  }

  getAllNews() async {
    isFirstLoadRunning.value = true;
    var res = await homeDio.getAllNews();
    if (res.statusCode == 200) {
      if (res.data != null) {
        newsLoadMore.addAll(res.data!.news ?? []);
      }
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: res.message!,
      );
    }
    isFirstLoadRunning.value = false;
  }
}
