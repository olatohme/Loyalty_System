import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/bundles_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/main_scren_controller.dart';
import 'package:loyalty/controller/notification_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/routes/routes.dart';

import 'controller/offer_controller.dart';
import 'controller/request_controller.dart';

void main()  {
  Get.put(AuthController());
  Get.put(BundlesController());
  Get.put(ProfileController());
  Get.put(RequestController());
  Get.put(HomeController());
  Get.put(PartnerController());
//Get.put(NotificationController());
  Get.put(Send_Points());
  Get.put(MainController());
  Get.put(OfferController());
  // Get.put(AuthController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.Home,
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
    );
  }
}
