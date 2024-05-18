// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Create your Animation Example
enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final double begin;

  const FadeAnimation(this.delay, this.begin, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500))
          .thenTween('x', Tween(begin: begin, end: 0.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
            offset: Offset(value.get("x"), 0), child: child),
      ),
    );
  }
}
