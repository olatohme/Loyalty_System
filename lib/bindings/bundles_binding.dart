import 'package:get/get.dart';
import 'package:loyalty/controller/bundles_controller.dart';

class bundlesBininding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BundlesController());
  }
}