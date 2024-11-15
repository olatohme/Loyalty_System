import 'package:get/get.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';

class SendPointBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>Send_Points());
  }
}