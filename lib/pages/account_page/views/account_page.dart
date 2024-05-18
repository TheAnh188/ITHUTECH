import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_handle.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/account_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _dissmis() async {
    await dissmis();
  }

  AccountHandle get _accountHandle => Get.find<AccountHandle>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _accountHandle.handleGetUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          _dissmis();
          return Scaffold(
            body: SafeArea(
              child: RefreshIndicator(
                edgeOffset: MySizes.size50SW,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                displacement: MySizes.size50SW,
                strokeWidth: MySizes.size2SW,
                backgroundColor: MyColors.blue,
                color: MyColors.white,
                onRefresh: () {
                  return _accountHandle.handleGetUserInfo();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  child: Obx(
                    () => Padding(
                      padding: EdgeInsets.fromLTRB(MySizes.size20SW,
                          MySizes.size40SW, MySizes.size20SW, MySizes.size20SW),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: MyColors.lightGrey,
                                radius: MySizes.size35SW,
                                child: Icon(
                                  MyIcons.account,
                                  size: MySizes.size35SW,
                                  color: MyColors.white,
                                ),
                              ),
                              SizedBox(width: MySizes.size10SW),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MySizes.size5SW),
                                      child: Text(
                                        '${_accountHandle.accountResponse.value.nickname}',
                                        style:
                                            MyTextStyles.content25BoldBlackSW,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.INFO_UPDATE);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            MySizes.size10SW,
                                            MySizes.size5SW,
                                            MySizes.size10SW,
                                            MySizes.size5SW),
                                        decoration: BoxDecoration(
                                          color: MyColors.lightGrey,
                                          borderRadius: BorderRadius.circular(
                                              MySizes.size15SW),
                                        ),
                                        child: Text(
                                          'Cập nhật thông tin cá nhân',
                                          style: MyTextStyles
                                              .content14MediumBlackSW,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: MySizes.size40SW),
                          Text(
                            ' Tổng Quan',
                            style: MyTextStyles.content22BoldBlackSW,
                          ),
                          SizedBox(height: MySizes.size20SW),
                          Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                AccountListTile(
                                  title: _accountHandle
                                          .accountResponse.value.username ??
                                      '',
                                  iconData: MyIcons.frameUser,
                                ),
                                AccountListTile(
                                  title: _accountHandle
                                          .accountResponse.value.email ??
                                      '',
                                  iconData: MyIcons.mail,
                                ),
                                _accountHandle.accountResponse.value
                                                .className !=
                                            null &&
                                        _accountHandle.accountResponse.value
                                            .className!.isNotEmpty
                                    ? AccountListTile(
                                        title: _accountHandle.accountResponse
                                                .value.className ??
                                            '',
                                        iconData: MyIcons.frameChartBar,
                                      )
                                    : const SizedBox(),
                                const AccountListTile(
                                  title: 'Công nghệ thông tin',
                                  iconData: MyIcons.map,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MySizes.size10SW),
                          Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                const AccountListTile(
                                  title: 'Đánh giá ứng dụng',
                                  iconData: MyIcons.star,
                                ),
                                AccountListTile(
                                  title: 'Phản hồi/Hỗ trợ',
                                  iconData: MyIcons.message2,
                                  function: () async {
                                    final Uri emailLaunchUri = Uri(
                                      scheme: 'mailto',
                                      path: 'bp.khuyen@hutech.edu.vn',
                                      queryParameters: {'subject': 'Feedback'},
                                    );

                                    if (!await launchUrl(emailLaunchUri)) {
                                      throw Exception(
                                          'Could not launch $emailLaunchUri');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MySizes.size10SW),
                          const Card(
                            color: Colors.white,
                            child: AccountListTile(
                              logout: true,
                              title: 'Đăng xuất',
                              iconData: Icons.logout,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        if (snapshot.data == false) {
          _dissmis();
        }
        return const Scaffold();
      },
    );
  }
}
