import 'dart:async';

import 'package:flutter/material.dart';
import 'package:krypto/routes/app_routes.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, AppRoutes.MAIN));

    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Image.asset(            
            'assets/logo.png',
            key: Key('splash_image_key'),            
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);
  }
}