import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/contests_page/api/contests_dio.dart';
import 'package:hutech_check_in_app/pages/contests_page/api/contests_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContestsHandle extends ChangeNotifier {
  late ContestsResponse _contestsResponse = ContestsResponse();

  List<Contest>? getContestsData() {
    return _contestsResponse.data?.contest!;
  }

  Future<ContestsResponse> handleGetAllContests() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool sucess = await ContestsDio().getAllContests();
    if (sucess) {
      var json = jsonDecode(pref.getString('contests')!);
      _contestsResponse = ContestsResponse.fromJson(json);
    }
    return _contestsResponse;
  }
}
