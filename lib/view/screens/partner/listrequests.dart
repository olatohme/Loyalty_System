import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/request_controller.dart';
import 'package:loyalty/model/Request_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/card_offer.dart';
import 'package:loyalty/view/widgets/card_offer_partner.dart';

import 'package:loyalty/view/widgets/text.dart';

class list_requests extends StatelessWidget {
  list_requests({Key? key}) : super(key: key);
  final controller = Get.find<RequestController>();
  final controller1 = Get.find<AuthController>();
  // RequestModel l = Get.arguments;
  var s = "";
  String status(int index) {
    if (controller.requeest!.requests[index].status == 0)
      s = " rejected";
    else if (controller.requeest!.requests[index].status == 1)
      s = " accepted";
    else
      s = " being processed";
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        // print(l.requests[0].id);
                        // print(l.requests[0].userId);
                        // print(l.requests[0].status);
                        // print(l.requests[0].createdAt);
                        controller.isLoading(!controller.isLoading.value);
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_sharp),
                      color: black,
                      iconSize: 40,
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        // text:
                        //     "Phone is: ${l.user.phoneNumber.toString()}",
                        text: ": طلبات الاشتراك ",
                        color: Colors.black,
                        underLine: TextDecoration.none),
                  ],
                ),
                controller.requeest!.requests.length == 0?
                controller.status_getrequest==200||controller.status_getrequest==201
                    ? SizedBox(
                        height: 400,
                        child: Center(
                          child: TextUtils(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              text: "لا يوجد طلبات اشتراك    ",
                              // text: "name is: Adidas",
                              color: Colors.black,
                              underLine: TextDecoration.none),
                        ))
                    :SizedBox(
                              height: 400,
                              child: Center(
                                child: TextUtils(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    text: "Server error",
                                    // text: "name is: Adidas",
                                    color: Colors.black,
                                    underLine: TextDecoration.none),
                              )): SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return cardrequest(index,context);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.requeest!.requests.length,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardrequest(int index,BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  text: "name is:${controller.requeest!.user.fname.toString()}",
                  // text: "name is: Adidas",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  text:
                      "Phone is: ${controller.requeest!.user.phoneNumber.toString()}",
                  //  text: "phone is: 0932456789",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  //text: "status is: Pending}",
                  text: "Status is: ${status(index)}",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 15,
              ),
              controller.requeest!.requests[index].status == null
                  ? Button(
                      onPressed: () async {
                        print(
                            " ${controller.requeest!.requests[index].id.toString()}");
                        //print(" ${[index].id.toString()}");
                        Get.toNamed('/editrequest',
                            arguments: controller.requeest!.requests[index].id);
                      },
                      text: "تعديل",
                      hight: 40,
                      width: 90,
                    )
                  : TextUtils(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      //text: "status is: Pending}",
                      text: "",
                      color: Colors.white,
                      underLine: TextDecoration.none),
              controller.requeest!.requests[index].status == null
                  ? Button(
                      onPressed: () {
                        openDialog(context,index);
                      },
                      text: "حذف ",
                      hight: 40,
                      width: 90,
                    )
                  : TextUtils(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      //text: "status is: Pending}",
                      text: "",
                      color: Colors.white,
                      underLine: TextDecoration.none),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x7f000000),
                blurRadius: 4,
                // spreadRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          width: 400,
          height: 200,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(180),
              ),
            ),
            child: Center(
              child: TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: "${index + 1}",
                  // text:
                  //     "Status is: ${status(index)}",
                  color: Colors.white,
                  underLine: TextDecoration.none),
            ),
          ),
        )
      ],
    );
  }

  void openDialog(BuildContext context,int index) {
    controller.isDialogOpen.value = true;
    Get.dialog(
      AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
        title: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: "",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: " هل انت متأكد من  حذف االطلب ؟؟ ",
            color: Colors.black,
            underLine: TextDecoration.none),
        actions: [
          Row(
            children: [
              Button(
                onPressed: () async {
                 
                   EasyLoading.show(status: "Loading...");
                      await controller.DeleteRequest(
                          context, controller1.TokenPartner!, controller.requeest!.requests[index].id);
                      
                    //  if(controller.status_editrequest==200||
                    //  controller.status_editrequest==201)
                      controller.isLoading(!controller.isLoading.value);
                       controller.isDialogOpen.value = false;
                },
                text: "نعم",
                hight: 40,
                width: 100,
              ),
              SizedBox(width: 30),
              Button(
                onPressed: () {
                  controller.isDialogOpen.value = false;
                  Get.back();
                },
                text: "لا",
                hight: 40,
                width: 100,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
