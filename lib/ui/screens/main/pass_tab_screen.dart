import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krypto/modules/random/random_controller.dart';

class PassTabScreen extends StatefulWidget {
  const PassTabScreen({Key key}) : super(key: key);

  @override
  _PassTabScreenState createState() => _PassTabScreenState();
}

class _PassTabScreenState extends State<PassTabScreen> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                'Senha Gerada',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFF8000),
                  ),
                ),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                child: GetX<RandomController>(
                  builder: (_) => Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _.passGenerated,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Image.asset(
                'assets/logo.png',
                key: Key('splash_image_key'),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
