import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_dio.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class AccountHandle extends GetxController {
  AccountDio accountDio;

  AccountHandle({required this.accountDio});
  final accountResponse = AccountResponse().obs;

  Future<bool> handleGetUserInfo() async {
    var response = await accountDio.getUserInfo();
    if (response.statusCode == 200) {
      if (response.data != null) {
        accountResponse.value = response.data!;
      }
      return true;
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: response.message!,
      );
      return false;
    }
  }

  // Future<AccountResponse> handleGetInfo() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bool sucess = await AccountDio().getUserInfo();
  //   if (sucess) {
  //     var json = jsonDecode(pref.getString('infoUser')!);
  //     _accountResponse = AccountResponse.fromJson(json);
  //   }
  //   return _accountResponse;
  // }
}
