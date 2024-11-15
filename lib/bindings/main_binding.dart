

import 'package:get/instance_manager.dart';
import 'package:loyalty/controller/main_scren_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>MainController());
    
  }
}