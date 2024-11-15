import 'package:get/get.dart';
import 'package:loyalty/controller/partner_controller.dart';

class PartnerBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>PartnerController());
  }
}