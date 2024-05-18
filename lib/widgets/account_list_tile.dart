import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class AccountListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String? route;
  final bool? logout;
  final Function? function;

  const AccountListTile({
    super.key,
    required this.iconData,
    required this.title,
    this.route,
    this.logout,
    this.function,
  });

  LoginHandle get _loginHandle => Get.find<LoginHandle>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (function != null) {
          function!();
        }
        if (logout == null) {
          if (route != null) {
            Navigator.pushNamed(context, route!);
          }
        } else {
          await _loginHandle.handleLogout();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size20SW, vertical: MySizes.size8SW),
        child: Row(
          children: [
            CircleAvatar(
              radius: MySizes.size20SW,
              backgroundColor: MyColors.lightGrey,
              child: Icon(
                iconData,
                size: MySizes.size24SW,
                color: MyColors.black,
              ),
            ),
            SizedBox(width: MySizes.size10SW),
            Expanded(
              child: Text(
                title,
                style: MyTextStyles.content18MediumBlackSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
