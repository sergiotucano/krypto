import 'package:get/get.dart';
import 'package:krypto/modules/random/random_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RandomController>(() => RandomController());

  }
}