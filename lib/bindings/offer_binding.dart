import 'package:get/get.dart';
import 'package:loyalty/controller/offer_controller.dart';

class OfferBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>OfferController());
  }
}