import 'package:get/get.dart';
import 'package:loyalty/controller/auth_controller.dart';

class AuthBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthController());
  }
}