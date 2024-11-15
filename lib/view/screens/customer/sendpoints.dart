import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/phone_field.dart';
import 'package:loyalty/view/widgets/text.dart';

class SendPoints extends StatelessWidget {
  SendPoints({Key? key}) : super(key: key);
  final controller1 = Get.find<ProfileController>();
  final controller2 = Get.find<AuthController>();
  final controller = Get.find<Send_Points>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                //color: Colors.grey,
                margin: EdgeInsets.all(10),
              ),
              Positioned(
                  left: 20,
                  top: 20,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_sharp),
                    color: white,
                    iconSize: 40,
                  )),
              Positioned(
                right: 30,
                top: 40,
                child: TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    text: "لإرسال النقاط أدخل عدد النقاط ",
                    color: Colors.white,
                    underLine: TextDecoration.none),
              ),
              Positioned(
                right: 60,
                top: 80,
                child: TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    text: "ورقم الموبايل أو امسح الكود",
                    color: Colors.white,
                    underLine: TextDecoration.none),
              )
            ],
          ),
          //

          Positioned(
            top: 150,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                color: white,
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

              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.45,
              //color: Colors.grey,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: CustomTextField(
                      hintText: 'عدد النقاط',
                      prefixIcon: Text(""),
                      obscureText: false,
                      suffixIcon: Text(""),
                      validator: (value) {},
                      hight: 60,
                      width: MediaQuery.of(context).size.width * 0.70,
                      keyboardType: TextInputType.number,
                      onchange: (value) {
                        controller.num_points = value;
                      },
                    ),
                  ),
                  //SizedBox(height: 20,),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                  //   child: phoneTextField(
                  //     hintText: 'رقم الموبايل',
                  //     prefixIcon: Text(""),
                  //     obscureText: false,
                  //     suffixIcon: const Icon(Icons.phone, color: Colors.grey),
                  //     validator: (value) {
                  //       if (value.completeNumber.isEmpty) {
                  //         return 'Please enter an phone';
                  //       }
                  //       if (!RegExp(validationPhone)
                  //           .hasMatch(value.completeNumber)) {
                  //         return 'Invalid phone';
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //     hight: 60,
                  //     width: MediaQuery.of(context).size.width * 0.80,
                  //     keyboardType: TextInputType.number,
                  //     onchange: (value) {
                  //       controller.number = value.completeNumber;
                  //       print("${controller.number}");
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    onPressed: ()  {
                      openDialog(context);
                     
                    },
                    text: "إرسال",
                    hight: 50,
                    width: 200,
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  Button(
              onPressed: () {
                Get.toNamed('/scanner');
              },
              text: "مسح الكود",
              hight: 50,
              width: 200,
            ),
                ],
              ),
            ),
          ),
          
          
        ]),
      ),
    );
  }
  void openDialog(BuildContext context) {
    controller.isDialogOpen.value = true;
    Get.dialog(
      AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
        title: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: "ارسال النقاط",
            color: Colors.black,
            underLine: TextDecoration.none),
        content:phoneTextField(
                      hintText: 'رقم الموبايل',
                      prefixIcon: Text(""),
                      obscureText: false,
                      suffixIcon: const Icon(Icons.phone, color: Colors.grey),
                      validator: (value) {
                        if (value.completeNumber.isEmpty) {
                          return 'Please enter an phone';
                        }
                        if (!RegExp(validationPhone)
                            .hasMatch(value.completeNumber)) {
                          return 'Invalid phone';
                        } else {
                          return null;
                        }
                      },
                      hight: 60,
                      width: MediaQuery.of(context).size.width * 0.80,
                      keyboardType: TextInputType.number,
                      onchange: (value) {
                        controller.number = value.completeNumber;
                        print("${controller.number}");
                      },
                    ),
        actions: [
          Center(
            child: Button(
              onPressed: () async {
                controller.isDialogOpen.value = false;
                EasyLoading.show(status: "Loadding..");
                      print("iiiiiiiiiiiiiiii${controller.number}");
                      await controller.sendpoint_customer(
                          context, controller2.TokenCustomer!);
                            controller.isloading_record(!controller.isloading_record.value);
                      controller.isloading_balance(
                          !controller.isloading_balance.value);
                      if (controller.status_point_cust == 200 ||
                          controller.status_point_cust == 201) {
                        Get.back();
                      }
                //Get.back();
              },
              text: "ارسال",
              hight: 50,
              width: 200,
            ),
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
