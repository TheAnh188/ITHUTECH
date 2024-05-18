import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class InvertedClipper extends CustomClipper<Path> {
  late Size scanArea;
  late double borderRadius;
  InvertedClipper({required this.scanArea, this.borderRadius = 20.0});

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height / 2),
              width: scanArea.width,
              height: scanArea.height),
          Radius.circular(borderRadius - 4)))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

// ignore: must_be_immutable
class QRScannerOverlay extends StatelessWidget {
  late final Widget clippedWidget;
  final Color? overlayColor;
  final Color borderColor;
  final double borderRadius;
  final double borderStrokeWidth;

  QRScannerOverlay({
    super.key,
    String? imagePath,
    this.overlayColor = Colors.black54,
    Size? scanAreaSize,
    double? scanAreaWidth,
    double? scanAreaHeight,
    this.borderColor = Colors.white,
    this.borderRadius = 20,
    this.borderStrokeWidth = 4,
  }) {
    // Check preconditions for the the scan area
    assert(
      (scanAreaWidth == null && scanAreaHeight == null) ||
          (scanAreaWidth != null && scanAreaHeight != null),
      'You must set both scanAreaWidth and scanAreaHeight!',
    );
    assert(
      (scanAreaSize == null) ||
          ((scanAreaWidth == null) && (scanAreaHeight == null)),
      'You can only set one of scanAreaSize or scanAreaWidth/scanAreaHeight!',
    );

    if (imagePath != null) {
      clippedWidget = Image.asset(
        imagePath,
        fit: BoxFit.cover,
        opacity: const AlwaysStoppedAnimation(.9),
      );
    } else {
      clippedWidget =
          DecoratedBox(decoration: BoxDecoration(color: overlayColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    // If no scanAreaSize or scanAreaWidth/scanAreaHeight are set, use a default
    final standardScanArea = Size.square(0.85 * Get.width);
    return Stack(children: [
      ClipPath(
        clipper: InvertedClipper(
          scanArea: standardScanArea,
          borderRadius: borderRadius,
        ),
        child: SizedBox.expand(
          child: clippedWidget,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          foregroundPainter: BorderPainter(
            borderRadius: borderRadius,
            borderColor: borderColor,
            borderStrokeWidth: borderStrokeWidth,
          ),
          child: SizedBox(
            width: (standardScanArea.width) + MySizes.size25SW,
            height: (standardScanArea.height) + MySizes.size25SW,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders
class BorderPainter extends CustomPainter {
  final double borderRadius;
  final Color borderColor;
  final double borderStrokeWidth;
  const BorderPainter({
    required this.borderRadius,
    required this.borderColor,
    required this.borderStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final tRadius = 3 * borderRadius;
    final rect = Rect.fromLTWH(
      borderStrokeWidth,
      borderStrokeWidth,
      size.width - 2 * borderStrokeWidth,
      size.height - 2 * borderStrokeWidth,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    final clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderStrokeWidth,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
