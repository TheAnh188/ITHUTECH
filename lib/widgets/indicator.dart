import 'package:flutter/cupertino.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MySizes.size24SW,
      margin: EdgeInsets.only(right: MySizes.size5SW),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.white : MyColors.grey,
        borderRadius: BorderRadius.circular(MySizes.size12SW),
      ),
    );
  }
}
