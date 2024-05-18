import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class Category extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  const Category({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: MySizes.size20SW),
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: MySizes.size5SW),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.blue : MyColors.lightGrey,
        borderRadius: BorderRadius.circular(MySizes.size80SW),
      ),
      child: Container(
        color: Colors.amber,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? MyColors.white : MyColors.grey,
              size: MySizes.size20SW,
            ),
            SizedBox(width: MySizes.size5SW),
            Text(
              title,
              style: TextStyle(
                  color: isSelected ? MyColors.white : MyColors.grey,
                  fontSize: MySizes.size17SW,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
