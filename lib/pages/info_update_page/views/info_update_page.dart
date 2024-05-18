import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_handle.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/info_update_card.dart';

class InfoUpdatePage extends StatefulWidget {
  const InfoUpdatePage({super.key});

  @override
  State<InfoUpdatePage> createState() => InfoUpdatePageState();
}

class InfoUpdatePageState extends State<InfoUpdatePage> {
  late Future<bool> handleGetInfo;

  void _loadinggg() async {
    await loading();
  }

  void _dissmis() async {
    await dissmis();
  }

  AccountHandle get _accountHandle => Get.find<AccountHandle>();

  @override
  void initState() {
    super.initState();
    handleGetInfo = _accountHandle.handleGetUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: handleGetInfo,
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
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      floating: true,
                      pinned: false,
                      snap: false,
                      scrolledUnderElevation: 0,
                      toolbarHeight: MySizes.size85SW,
                      leadingWidth: MySizes.size65SW,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      leading: const BackArrowButton(),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MySizes.size20SW),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: MySizes.size5SW),
                                    child: RichText(
                                      text: TextSpan(
                                        style:
                                            MyTextStyles.content16BoldBlackSW,
                                        children: [
                                          const TextSpan(
                                              text: 'Liên hệ qua Email '),
                                          TextSpan(
                                              text: 'bp.khuyen@hutech.edu.vn',
                                              style: MyTextStyles
                                                  .content16BoldRedSW),
                                          const TextSpan(
                                              text:
                                                  ' kèm thông tin cụ thể cần chỉnh sửa nếu có sai sót'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MySizes.size20SW),
                                  InforUpdateCard(
                                    title: 'MSSV',
                                    detail: _accountHandle
                                            .accountResponse.value.username ??
                                        '',
                                    enable: false,
                                    route: '',
                                  ),
                                  InforUpdateCard(
                                    title: 'Họ và tên',
                                    detail: _accountHandle
                                            .accountResponse.value.nickname ??
                                        '',
                                    enable: false,
                                    route: '',
                                  ),
                                  InforUpdateCard(
                                    title: 'Lớp',
                                    detail: _accountHandle
                                            .accountResponse.value.className ??
                                        '',
                                    enable: false,
                                    route: '',
                                  ),
                                  InforUpdateCard(
                                    title: 'Số điện thoại',
                                    detail: _accountHandle.accountResponse.value
                                            .phoneNumber ??
                                        '',
                                    enable: true,
                                    route: Routes.PHONE_NUMBER_UPDATE,
                                  ),
                                  InforUpdateCard(
                                    title: 'Email',
                                    detail: _accountHandle
                                            .accountResponse.value.email ??
                                        '',
                                    enable: true,
                                    route: Routes.EMAIL_UPDATE,
                                    isVerifyEmail: _accountHandle
                                            .accountResponse
                                            .value
                                            .isVerifyEmail ??
                                        0,
                                  ),
                                  SizedBox(height: MySizes.size20SW),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.PASSWORD_UPDATE);
                                    },
                                    child: Container(
                                      height: MySizes.size45SW,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: MyColors.blue,
                                        borderRadius: BorderRadius.circular(
                                            MySizes.size25SW),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Thay đổi mật khẩu',
                                          style: MyTextStyles
                                              .content20MediumWhiteSW,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          _loadinggg();
        }
        if (snapshot.data == false) {
          _dissmis();
        }
        return appBar();
      },
    );
  }

  Widget appBar() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: MySizes.size85SW,
        leadingWidth: MySizes.size65SW,
        leading: const BackArrowButton(),
      ),
    );
  }
}
