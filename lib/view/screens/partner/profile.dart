import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';

import 'package:loyalty/model/profile_partner_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../../../userinformation.dart';

class profile_partner extends StatelessWidget {
  // ProfileModelPartner p= Get.arguments;
  final controller = Get.find<ProfileController>();
  final controller1 = Get.find<HomeController>();
  final controller2 = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor,
              child: Stack(children: [
                Positioned(
                  left: 30,
                  top: 20,
                  child: IconButton(
                      onPressed: () {
                        controller1.isCollapsed(!controller1.isCollapsed.value);
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
              //     Positioned(
              //   left: 320,
              //   top: 70,
              //   child: IconButton(
              //     onPressed: () async {
              //       controller1.isloading_p(!controller1.isloading_p.value);
              //       controller.prof = await controller.ShowProfile_partner(
              //           controller2.TokenPartner!);
              //       controller1.isloading_p(!controller1.isloading_p.value);
              //       print("proooooo");
              //     },
              //     icon: Icon(Icons.refresh),
              //     iconSize: 40,
              //     color: Colors.black,
              //   ),
              // ),
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
                      child: SingleChildScrollView(
                        child: Obx(() {
                          if (controller.isloading_p.isTrue) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Column(children: [
                            SizedBox(
                              height: 130,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                  Icon(Icons.account_box_sharp,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text:
                                          "Name: ${controller.prof!.partner.user.fname.toString()}",
                                      color: Colors.black,
                                      underLine: TextDecoration.none),
                                  TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text:
                                          " ${controller.prof!.partner.user.lname.toString()}",
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                  Icon(Icons.email, color: Colors.grey),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text:
                                          "email is : ${controller.prof!.partner.user.email.toString()}",
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                  Icon(Icons.phone, color: Colors.grey),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text:
                                          "Phone is : ${controller.prof!.partner.user.phoneNumber.toString()}",
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                  Icon(Icons.mode_standby_outlined,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text:
                                          "Bonus Balance: ${controller.prof!.partner.bonus.toString()}",
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                  Icon(Icons.games_outlined,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text:
                                          "Gems Balance: ${controller.prof!.partner.gems.toString()}",
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
                                Get.toNamed('/editprofile_partner');
                              },
                              text: "تعديل ",
                              hight: 50,
                              width: 200,
                            ),
                            SizedBox(
                              height: 60,
                            )
                          ]);
                        }),
                      ),
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
                                "${Userinformation.domain}/${controller.prof!.partner.user.imgUrl}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ]))),
    );
  }
}
