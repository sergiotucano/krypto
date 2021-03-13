import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:krypto/modules/main_binding.dart';
import 'package:krypto/ui/app_theme.dart';
import 'package:get/get.dart';
import 'package:krypto/ui/screens/screens.dart';
import 'package:krypto/utils/app_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: 'Krypto',
      theme: makeAppTheme(),
      initialRoute: '/',
      initialBinding: MainBinding(),
      navigatorKey: AppUtils.globalCtx,
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
      ],
    );
  }
}
