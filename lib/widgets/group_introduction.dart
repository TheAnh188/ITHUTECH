import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';

class GroupIntroduction extends StatelessWidget {
  const GroupIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    Group dataProvider = ModalRoute.of(context)?.settings.arguments as Group;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Giới thiệu',
          style: MyTextStyles.content20MediumWhiteSW,
        ),
        scrolledUnderElevation: 0,
        toolbarHeight: MySizes.size85SW,
        leadingWidth: MySizes.size65SW,
        backgroundColor: MyColors.darkBlue,
        leading: const BackArrowButton(
          color: MyColors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MySizes.size20SW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên lớp',
                style: MyTextStyles.content20MediumBlueSW,
              ),
              Text(
                dataProvider.name ?? '',
                style: MyTextStyles.content16RegularBlackSW,
              ),
              SizedBox(height: MySizes.size20SW),
              Text(
                'Giảng viên hướng dẫn',
                style: MyTextStyles.content20MediumBlueSW,
              ),
              Text(
                dataProvider.lecturer ?? '',
                style: MyTextStyles.content16RegularBlackSW,
              ),
              dataProvider.subject == null || dataProvider.subject == ''
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MySizes.size20SW),
                        Text(
                          'Môn học',
                          style: MyTextStyles.content20MediumBlueSW,
                        ),
                        Text(
                          dataProvider.subject ?? '',
                          style: MyTextStyles.content16RegularBlackSW,
                        ),
                      ],
                    ),
              dataProvider.description == null || dataProvider.description == ''
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MySizes.size20SW),
                        Text(
                          'Mô tả',
                          style: MyTextStyles.content20MediumBlueSW,
                        ),
                        Text(
                          dataProvider.description ?? '',
                          style: MyTextStyles.content16RegularBlackSW,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
