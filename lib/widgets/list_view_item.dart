import 'package:flutter/cupertino.dart';

class ListViewItem extends StatelessWidget {
  final String path;
  final BoxFit? boxFit;

  const ListViewItem({super.key, required this.path, required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: boxFit,
    );
  }
}
