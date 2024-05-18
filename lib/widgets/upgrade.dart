// Copyright (c) 2023 Larry Aasen. All rights reserved.

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:upgrader/upgrader.dart';

class MyUpgrader extends Upgrader {
  MyUpgrader({super.debugLogging});

  @override
  bool isUpdateAvailable() {
    final storeVersion = currentAppStoreVersion;
    final installedVersion = currentInstalledVersion;
    print('storeVersion=$storeVersion');
    print('installedVersion=$installedVersion');
    return super.isUpdateAvailable();
  }
}

class MyUpgradeAlert extends UpgradeAlert {
  MyUpgradeAlert({super.key, super.upgrader, super.child});

  /// Override the [createState] method to provide a custom class
  /// with overridden methods.
  @override
  UpgradeAlertState createState() => MyUpgradeAlertState();
}

class MyUpgradeAlertState extends UpgradeAlertState {
  @override
  void showTheDialog({
    Key? key,
    required BuildContext context,
    required String? title,
    required String message,
    required String? releaseNotes,
    required bool barrierDismissible,
    required UpgraderMessages messages,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          key: key,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text("Phiên bản mới", style: MyTextStyles.content18BoldBlueSW),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(message, style: MyTextStyles.content15RegularBlackSW),
                const SizedBox(height: 10),
                if (releaseNotes != null) ...[
                  const Divider(),
                  Text(
                    "Ghi chú phiên bản",
                    style: MyTextStyles.content16BoldBlueSW,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    releaseNotes,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ]
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // Nền xanh
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Bo tròn các góc
                ),
              ),
              child: Text(
                'CẬP NHẬT',
                style: MyTextStyles.content15BoldWhiteSW, // Chữ trắng
              ),
              onPressed: () {
                onUserUpdated(context, !widget.upgrader.blocked());
              },
            ),
          ],
        );
      },
    );
  }
}
