import 'package:get/get.dart';
import 'package:loyalty/controller/profile_controller.dart';

class ProfileBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ProfileController());
  }
}