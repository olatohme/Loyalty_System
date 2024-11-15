import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../../../userinformation.dart';

class profile extends StatelessWidget {
  //ProfileModel p = Get.arguments;
  final controller = Get.find<AuthController>();
  final controller1 = Get.find<ProfileController>();
  final controller2 = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: kPrimaryColor,
            child: Stack(children: [
              Positioned(
                left: 30,
                top: 20,
                child: IconButton(
                    onPressed: () {
                      //  print("Email is ${controller1.profile!.user.email}");
                      controller2.isCollapsed(!controller2.isCollapsed.value);
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: white,
                      size: 30,
                    )),
              ),
              Positioned(
                right: 170,
                top: 20,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Positioned(
                left: 320,
                top: 70,
                child: IconButton(
                  onPressed: () async {
                    controller1.isloading(!controller1.isloading.value);
                    controller1.profile = await controller1.ShowProfile(
                        controller.TokenCustomer!);
                    controller1.isloading(!controller1.isloading.value);
                  },
                  icon: Icon(Icons.refresh),
                  iconSize: 40,
                  color: Colors.black,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(child: Obx(() {
                      if (controller1.isloading.isTrue) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return controller1.status_show_p_cust == 200 ||
                              controller1.status_show_p_cust == 201
                          ? Column(children: [
                              SizedBox(
                                height: 110,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.lock_outlined,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "Name: ${controller1.profile!.user.fname.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            " ${controller1.profile!.user.lname.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.lock_outlined,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "NickName: ${controller1.profile!.nickName.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.lock_outlined,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "Phone: ${controller1.profile!.user.phoneNumber.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.lock_outlined,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "Type User is: ${controller1.profile!.segmentation.type.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.lock_outlined,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "Gems Balance: ${controller1.profile!.curGems.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.lock_outlined,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    TextUtils(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "Bonus Balance: ${controller1.profile!.curBonus.toString()}",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Button(
                                onPressed: () {
                                  Get.toNamed('/editprofile');
                                },
                                text: "تعديل ",
                                hight: 50,
                                width: 200,
                              ),
                              SizedBox(
                                height: 70,
                              ),
                            ])
                          : SizedBox(
                              height: 400,
                              child: Center(
                                child: TextUtils(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    text: "Server error",
                                    // text: "name is: Adidas",
                                    color: Colors.black,
                                    underLine: TextDecoration.none),
                              ));
                    })),
                  ),
                ),
              ),
              Positioned(
                right: 110,
                top: 90,
                child: Stack(children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "${Userinformation.domain}/${controller1.profile!.user.imgUrl}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ])),
      )),
    );

    // Column(
    // children: [
    //   Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height * 0.25,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(0),
    //             topRight: Radius.circular(0),
    //             bottomLeft: Radius.circular(280),
    //             bottomRight: Radius.circular(200),
    //           ),
    //           color: kPrimaryColor)),
    //   SizedBox(
    //     height: 20,
    //   ),
    //   Container(
    //       height: 90,
    //       width: 90,
    //       alignment: Alignment.centerLeft,
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         border: Border.all(width: 2, color: Colors.black),
    //       )),
    //   Button(
    //     onPressed: () {
    //       print(p.user.fname);
    //        print(p.user.lname);
    //         print(p.user.phoneNumber);
    //          print(p.user.id);

    //     },
    //     text: 'زبون',
    //     hight: 50,
    //     width: 80,
    //   ),

    // TextUtils(
    //     fontSize: 25,
    //     fontWeight: FontWeight.normal,
    //     text: p.user.fname,
    //     color: Colors.black,
    //     underLine: TextDecoration.none),
    // SizedBox(
    //   height: 10,
    // ),
    // TextUtils(
    //     fontSize: 25,
    //     fontWeight: FontWeight.normal,
    //     text: p.user.lname,
    //     color: Colors.black,
    //     underLine: TextDecoration.none),
    // SizedBox(
    //   height: 10,
    // ),
    // TextUtils(
    //     fontSize: 25,
    //     fontWeight: FontWeight.normal,
    //     text: p.user.email,
    //     color: Colors.black,
    //     underLine: TextDecoration.none),
    // SizedBox(
    //   height: 10,
    // ),
    // TextUtils(
    //     fontSize: 25,
    //     fontWeight: FontWeight.normal,
    //     text: "-------",
    //     color: Colors.black,
    //     underLine: TextDecoration.none),
    // SizedBox(
    //   height: 10,
    // ),
    //   ],
    // )));
  }
}
