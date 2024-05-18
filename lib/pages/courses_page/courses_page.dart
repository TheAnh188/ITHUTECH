import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/coming_soon.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(message: 'Khoá học sẽ sớm được mở',);
  }
}
