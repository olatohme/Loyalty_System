
import 'package:get/get.dart';
import 'package:loyalty/controller/home_controller.dart';




class HomeBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
  }
}
