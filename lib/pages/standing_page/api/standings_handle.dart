import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_dio.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class StandingHandle extends GetxController {
  StandingsDio standingsDio;

  StandingHandle({required this.standingsDio});

  final standings = <Standing>[].obs;

  Future<bool> handleGetStandings(int contestId) async {
    var response = await standingsDio.getStandings(contestId);
    standings.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        standings.addAll(response.data!.standing!);
      }
      return true;
    } else {
      SnackbarCustom.showError(
        message: response.message!,
        context: navigatorKey.currentContext!,
      );
      return false;
    }
  }

  // List<Standing>? getStandingData() {
  //   return _standingResponse.data?.standing;
  // }

  // Future<StandingResponse> handleGetStanding(int contestId) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bool sucess = await StandingDio().getStanding(contestId);
  //   if (sucess) {
  //     var json = jsonDecode(pref.getString('standing')!);
  //     _standingResponse = StandingResponse.fromJson(json);
  //   }
  //   return _standingResponse;
  // }
}
