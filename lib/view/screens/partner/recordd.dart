import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

class record_p extends StatelessWidget {
  record_p({Key? key}) : super(key: key);
 final controller2 = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Center(
        child: Column(
          children: [
             SizedBox(
              height: 20,
            ),
 Row(
            children: [
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                   controller2.isCollapsed(!controller2.isCollapsed.value);
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_sharp),
                color: black,
                iconSize: 40,
              ),
              SizedBox(
                width: 120,
              ),
              TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  // text:
                  //     "Phone is: ${l.user.phoneNumber.toString()}",
                  text: ": سجل عمليات التحويل ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
            ],
          ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 30,
            ),
            Button(
              onPressed: () {
                //controller.addprod2();
                Get.toNamed('/p_reseve');
              },
              text: "النقاط المؤقتة المستلمة",
              hight: 50,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              onPressed: () {
                //controller.addprod2();
                Get.toNamed('/p_send');
              },
              text: "النقاط المؤقتة المرسلة",
              hight: 50,
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Button(
              onPressed: () {
                Get.toNamed('/g_reseve');
                //controller.addprod2();
              },
              text: "الجواهر المستلمة",
              hight: 50,
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Button(
              onPressed: () {
                //controller.addprod2();
                Get.toNamed('/g_send');
              },
              text: "الجواهر المرسلة",
              hight: 50,
              width: 200,
            ),
          ],
        ),
      ),
    )));
  }
}
