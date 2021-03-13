import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class AppUtils {
  static GlobalKey<NavigatorState> globalCtx = GlobalKey<NavigatorState>();
  
  static void checkPermission() async {
    if (!kIsWeb) {
      if (Platform.isAndroid || Platform.isIOS) {
        var permissionStatus = await Permission.storage.status;

        switch (permissionStatus) {
          case PermissionStatus.denied:
          case PermissionStatus.permanentlyDenied:
            await Permission.storage.request();
            break;
          default:
        }
      }
    }
  }

  
}