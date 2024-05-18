import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_handle.dart';
import 'package:hutech_check_in_app/pages/qr_scanner_page/qr_scanner_overlay_shape.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final MobileScannerController _controller = MobileScannerController();
  double zoom = 0.1;
  String actualSize = '1.0x';

  @override
  void initState() {
    super.initState();
  }

  CheckInHandle get _checkInHandle => Get.find<CheckInHandle>();

  // Xử lý khi phát hiện mã QR
  void _handleBarcodeDetection(BarcodeCapture barcodes) {
    if (barcodes.barcodes.isNotEmpty) {
      final scannedCode = barcodes.barcodes.first.rawValue;
      if (scannedCode != null) {
        _checkInHandle.handleCheckInByQR(scannedCode);
        Get.back();
      }
    }
  }

  // Chức năng giảm mức zoom
  void zoomOut() {
    // Đảm bảo mức zoom không vượt quá giới hạn thấp nhất
    if (zoom > 0.1) {
      zoom -= 0.15;
      if (zoom < 0.1) {
        zoom = 0.1;
      }
      _controller.setZoomScale(zoom);
      setState(() {
        actualSize = '${(zoom * 10).toStringAsFixed(1)}x';
      });
    }
  }

  // Chức năng tăng mức zoom
  void zoomIn() {
    // Đảm bảo mức zoom không vượt quá giới hạn cao nhất
    if (zoom < 1.0) {
      zoom += 0.15;
      if (zoom > 1.0) {
        zoom = 1.0;
      }
      _controller.setZoomScale(zoom);
      setState(() {
        actualSize = '${(zoom * 10).toStringAsFixed(1)}x';
      });
    }
  }

  Future<String?> getNickName() async {
    LocalStorageRepo localRepo = Get.find();
    return localRepo.getNickName();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding.top;
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _handleBarcodeDetection,
          ),
          QRScannerOverlay(
            borderRadius: MySizes.size24SW,
            borderStrokeWidth: MySizes.size5SW,
          ),
          Positioned(
            top: MySizes.size28SW + padding,
            left: MySizes.size20SW,
            child: const BackArrowButton(color: MyColors.white),
          ),
          Positioned(
            bottom: bottom,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: zoomOut,
                        child: Icon(
                          Icons.zoom_out,
                          color: MyColors.white,
                          size: MySizes.size24SW,
                        ),
                      ),
                      SizedBox(width: MySizes.size25SW),
                      Text(
                        actualSize,
                        style: MyTextStyles.content16RegularWhiteSW,
                      ),
                      SizedBox(width: MySizes.size25SW),
                      GestureDetector(
                        onTap: zoomIn,
                        child: Icon(
                          Icons.zoom_in,
                          color: MyColors.white,
                          size: MySizes.size24SW,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySizes.size20SW),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tài khoản điểm danh',
                        style: MyTextStyles.content18MediumWhiteSW,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      FutureBuilder(
                        future: getNickName(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data ?? '',
                              style: MyTextStyles.content18BoldWhiteSW,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
