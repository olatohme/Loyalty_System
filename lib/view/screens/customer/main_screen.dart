import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/main_scren_controller.dart';
import 'package:loyalty/model/myoffers_model.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/view/screens/customer/qrcode.dart';
import 'package:loyalty/view/screens/customer/recbonus_send.dart';
import 'package:loyalty/view/screens/customer/home.dart';

import 'package:loyalty/view/screens/customer/point_balance.dart';


class MainScreen extends GetView<MainController> {
  MainScreen({Key? key}) : super(key: key);
  final controller1 = Get.find<AuthController>();
  List<MyoffersModel> offer = Get.arguments;

  //ProfileModel? profile = Get.arguments;

  @override
  // TODO: implement controller

  var tabs = [
    // '/setting',
    // '/offers',
    // '/HomeSc,
   // const setting(),
    PointsBalance(),
    HomeScreen(),
    //page(),
    QrCode(),
  ];

  // final controller = Get.find<MainController>();

  get kBackgroundColor => null;

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return Obx(() {
      return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: tabs,
            ),
            // body: controller.tabs[controller.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: kBackgroundColor,
              color: kPrimaryColor,
              animationDuration: Duration(milliseconds: 350),
              height: 50,
              index: controller.currentIndex.value,
              items: [
                // Icon(
                //   Icons.settings,
                //   color: white,
                // ),
                Icon(
                  Icons.add_box_outlined,
                  color: white,
                ),
                Icon(
                  Icons.home,
                  color: white,
                ),
                // Icon(
                //   Icons.account_circle,
                //   color: white,
                // ),
                Icon(
                  Icons.map,
                  color: white,
                ),
              ],
              onTap: (value) {
                controller.currentIndex.value = value;
                //  Get.toNamed(controller.tabs[value]);
              },
            )

            // BottomNavigationBar(
            //   backgroundColor: Get.isDarkMode ? black: kPrimaryColor,
            //   currentIndex: controller.currentIndex.value,
            //   type: BottomNavigationBarType.fixed,
            //   items: [
            //     BottomNavigationBarItem(
            //       activeIcon: Icon(
            //         Icons.home,
            //         color:white,
            //       ),
            //       icon: Icon(
            //         Icons.home,
            //         color: Get.isDarkMode ? white: black,
            //       ),
            //       label: '',
            //     ),
            //   /*  BottomNavigationBarItem(
            //       activeIcon: Icon(
            //         Icons.add,
            //         color: white
            //       ),
            //       icon: Icon(
            //         Icons.category,
            //         color:white,
            //       ),
            //       label: '',
            //     ),*/
            //      BottomNavigationBarItem(
            //       activeIcon: Icon(
            //         Icons.add_box,
            //         color:white
            //       ),
            //       icon: Icon(
            //         Icons.add_box,
            //         color: Get.isDarkMode ? white: black,
            //       ),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       activeIcon: Icon(
            //         Icons.account_circle,
            //         color:white
            //       ),
            //       icon: Icon(
            //         Icons.account_circle,
            //         color:Get.isDarkMode ? white: black,
            //       ),
            //       label: '',
            //     ),

            //   ],
            //   onTap: (index) {
            //     controller.currentIndex.value = index;
            //   },
            // ),
            //  body: IndexedStack(
            //   // index: controller.currentIndex.value,
            //   // children: controller.tabs,
            // ),

            ),
      );
    });
  }
}
