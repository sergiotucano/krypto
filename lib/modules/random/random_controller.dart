import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RandomController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  final _passGenerated = ''.obs;
  get passGenerated => this._passGenerated.value;
  set passGenerated(value) => this._passGenerated.value = value;

  setNewPass() {
    this.passGenerated = createRandonPass();
  }

  copyPass() {
    Clipboard.setData(
      new ClipboardData(text: passGenerated),
    );
  }

  String createRandonPass() {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    const _numbers = '1234567890';
    const _special = '!#*%\$&';

    var _characters = '$_chars$_numbers$_special';
    Random _rnd = Random();

    String a = String.fromCharCodes(Iterable.generate(5, (_) => _characters.codeUnitAt(_rnd.nextInt(_characters.length))));

    return a;
  }
}
