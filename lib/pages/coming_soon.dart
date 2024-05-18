import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key, this.isCanBack = false, required this.message});

  final bool? isCanBack;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        toolbarHeight: MySizes.size85SW,
        leadingWidth: MySizes.size65SW,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: isCanBack == true ? const BackArrowButton() : null,
      ),
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Images.comingsoon,
                ),
              ),
            ),
            child: Text(
              message,
              style: MyTextStyles.content18BoldBlackSW,
            ),
          ),
        ),
      ),
    );
  }
}
