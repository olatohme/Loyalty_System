import 'package:get/get.dart';
import 'package:loyalty/controller/request_controller.dart';

class RequestBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut( ()=>RequestController());
    
  }
}