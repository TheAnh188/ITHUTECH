import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/coming_soon.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(isCanBack: true, message: 'Phản hồi sẽ sớm được mở',);
  }
}
