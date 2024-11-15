import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:loyalty/controller/notification_controller.dart';
import 'package:loyalty/view/widgets/button.dart';

class notification extends StatelessWidget {
  notification({Key? key}) : super(key: key);
 // var controller = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Button(
            hight: 50,
            width: 200,
            onPressed: () {
              //controller.sendNotification();
            },
            text: "notification"),
      ),
    ));
  }
}
