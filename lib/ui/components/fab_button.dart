import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krypto/modules/random/random_controller.dart';

class FabButton extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FabButton({this.onPressed, this.tooltip, this.icon});

  @override
  _FabButtonState createState() => _FabButtonState();
}

class _FabButtonState extends State<FabButton> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget newPass() {
    final RandomController randomController = Get.find<RandomController>();
    return Container(
      child: FloatingActionButton(
        onPressed: () => randomController.setNewPass(),
        tooltip: 'Nova Senha',
        child: Icon(Icons.textsms),
      ),
    );
  }

  Widget savePass() {
    final RandomController randomController = Get.find<RandomController>();
    return Container(
      child: FloatingActionButton(
        onPressed: () => randomController.copyPass(),
        tooltip: 'Copiar Senha',
        child: Icon(Icons.copy_rounded),
      ),
    );
  }

  Widget closeApp() {
    return Container(
      child: FloatingActionButton(
        onPressed: () => {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        },
        tooltip: 'Sair',
        child: Icon(Icons.exit_to_app),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Selecione',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: newPass(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: savePass(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: closeApp(),
        ),
        toggle(),
      ],
    );
  }
}
