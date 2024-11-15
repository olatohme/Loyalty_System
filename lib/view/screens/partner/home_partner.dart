import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/bundles_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/model/bundles_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/card_subscripe.dart';
import 'package:loyalty/view/widgets/card_partner.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/text.dart';
import 'package:loyalty/view/widgets/textfield.dart';

class HomeParther extends StatelessWidget {
  // List<BundlesModel> l = Get.arguments;
  final controller1 = Get.find<BundlesController>();
  final controller2 = Get.find<AuthController>();
  final controller3 = Get.find<ProfileController>();
  final controller4 = Get.find<PartnerController>();
  final controller = Get.find<HomeController>();
  final controller5 = Get.find<Send_Points>();
  final controller6 = Get.find<OfferController>();
  final controller7 = Get.find<BundlesController>();
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Container(
              //       height: 90,
              //       width: 90,
              //       alignment: Alignment.centerLeft,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(width: 2, color: Colors.black),
              //           image: DecorationImage(
              //               image: AssetImage('assets/images/account.png')))),
              // ),

              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30),
              //   child: TextUtils(
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //     text: "Ola tohme",
              //     color: Colors.white,
              //     underLine: TextDecoration.none,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // TextUtils(
              //   fontSize: 15,
              //   fontWeight: FontWeight.bold,
              //   text: "Olatoma@gmail.com",
              //   color: Colors.white,
              //   underLine: TextDecoration.none,
              // ),
              SizedBox(
                height: 40,
              ),
              //  Divider(color: Colors.white,
              // height: 1,),
              ListTile(
                  title: InkWell(
                onTap: () {
                  Get.toNamed('/point');
                },
                child: TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: "رصيد نقاطي",
                  color: Colors.white,
                  underLine: TextDecoration.none,
                ),
              )),
              Divider(
                color: Colors.white,
                height: 1,
              ),
              ListTile(
                title: TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: "ملفي الشخصي",
                  color: Colors.white,
                  underLine: TextDecoration.none,
                ),
                onTap: () async {
                  controller3.isloading_p(!controller3.isloading_p.value);
                   controller3.isloading_p(!controller3.isloading_p.value);
                    controller3.prof = await controller3.ShowProfile_partner(
                        controller2.TokenPartner!);
                    controller3.isloading_p(!controller3.isloading_p.value);
                  if (controller3.isloading_p.isTrue)
                    controller3.isloading_p(!controller3.isloading_p.value);
                  Get.toNamed('/profile_partner');
                  // controller1.GetPartner();
                  // print("token profile befor$controller1.TokenCustomer");
                  // ProfileModel? p = await controller2.ShowProfile(
                  //     controller1.TokenCustomer);
                  // print("token profile$controller1.TokenCustomer");
                  // if (p != null) {
                  //   print(p.id);
                  //   print(p.nickName);
                  // }
                },
              ),
              Divider(
                color: Colors.white,
                height: 1,
              ),
              ListTile(
                  title: TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: "السجل ",
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  onTap: () {
                    controller5
                        .isloading_record(!controller5.isloading_record.value);
                    controller5.isloading_record_g(
                        !controller5.isloading_record_g.value);
                    if (controller5.isloading_record.isTrue)
                      controller5.isloading_record(
                          !controller5.isloading_record.value);
                    if (controller5.isloading_record_g.isTrue)
                      controller5.isloading_record_g(
                          !controller5.isloading_record_g.value);
                    Get.toNamed('/record_p');
                  }),
              // Divider(
              //   color: Colors.white,
              //   height: 1,
              // ),
              // ListTile(
              //   title: TextUtils(
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //     text: "الإشعارات",
              //     color: Colors.white,
              //     underLine: TextDecoration.none,
              //   ),
              //   onTap: () {
              //     Get.toNamed('/request');
              //   },
              // ),
              Divider(
                color: Colors.white,
                height: 1,
              ),

              ListTile(
                title: InkWell(
                  onTap: () async {
                    if (controller3.status_show_p_part == 200 ||
                        controller3.status_show_p_part == 201) {
                      if (controller6.isloading.isTrue)
                        controller6.isloading(!controller6.isloading.value);
                      Get.toNamed('/offers');
                    } else {
                      controller3.prof = await controller3.ShowProfile_partner(
                          controller2.TokenPartner!);
                      //  controller4.partners = await controller4.GetPartner();
                      controller6.isloading(!controller6.isloading.value);
                      Get.toNamed('/offers');
                    }
                  },
                  child: TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: "عروضي الخاصة",
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                height: 1,
              ),
              ListTile(
                  title: TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: "تسجيل خروج",
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  onTap: () {
                    openDialog(context);
                  }),
              Divider(
                color: Colors.white,
                height: 1,
              ),
            ],
          ),
        ),
      ),
      Obx(() {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 850),
          top: controller.isCollapsed.value
              ? 0
              : 0.15 * MediaQuery.of(context).size.height,
          bottom: controller.isCollapsed.value
              ? 0
              : -0.15 * MediaQuery.of(context).size.height,
          left: controller.isCollapsed.value
              ? 0
              : 0.5 * MediaQuery.of(context).size.width,
          right: controller.isCollapsed.value
              ? 0
              : -0.5 * MediaQuery.of(context).size.width,
          child: SafeArea(
              child: Scaffold(
                  body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor,
              child: Stack(
                children: [
                  Positioned(
                    left: 34,
                    top: 23,
                    child: IconButton(
                        onPressed: () {
                          if (controller2.TokenPartner == null)
                            controller.openDialog_p(context);
                          else
                            controller
                                .isCollapsed(!controller.isCollapsed.value);
                          // print("lennnnnnn${controller3.prof!.offers.length}");
                        },
                        icon: Icon(
                          Icons.menu,
                          color: white,
                          size: 30,
                        )),
                  ),
                  Positioned(
                    left: 290,
                    top: 27,
                    child: Text(
                      "مرحبا بك",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 290,
                    top: 70,
                    child: IconButton(
                      onPressed: () async {
                        controller.isloading_p(!controller.isloading_p.value);
                        controller7.l = await controller7.GetBundles(context);
                         controller.isloading_p(!controller.isloading_p.value);
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
                        height: MediaQuery.of(context).size.height * 0.80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 170),
                              child: TextUtils(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  text: 'باقات الاشتراك',
                                  color: Colors.black,
                                  underLine: TextDecoration.none),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            controller1.l.length == 0
                                ? controller1.status_bundles == 200 ||
                                        controller1.status_bundles == 201
                                    ? SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: TextUtils(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              text: "لا يوجد باقات لعرضها   ",
                                              // text: "name is: Adidas",
                                              color: Colors.black,
                                              underLine: TextDecoration.none),
                                        ))
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
                                        ))
                                : Obx(() {
                                    if (controller.isloading_p.isFalse) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return SizedBox(
                                      height: 500,
                                      child: ListView.builder(
                                        //padding: EdgeInsets.all(20),
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller1.l.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return card(controller1.l[index]);
                                        },
                                      ),
                                    );
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 168,
                    top: 105,
                    child: InkWell(
                      onTap: () {
                        if (controller2.TokenPartner == null)
                          controller.openDialog_p(context);
                        else
                          Get.toNamed('/add');
                      },
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            color: white),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))),
        );
      })
    ])));
  }

  void openDialog(BuildContext context) {
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
            text: " هل انت متأكد من انك تريد تسجيل الخروج ؟؟ ",
            color: Colors.black,
            underLine: TextDecoration.none),
        actions: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Button(
                onPressed: () async {
                  controller.isDialogOpen.value = false;
                  controller.isCollapsed(!controller.isCollapsed.value);
                  EasyLoading.show(status: 'Loading..');
                  controller2.Logout_p(controller2.TokenPartner!);
                  if (controller2.statuscode_logout == 200 ||
                      controller2.statuscode_logout == 201)
                    Get.offNamed('/welcome');
                  //controller.isDialogOpen.value = false;
                  else
                    Get.back();
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
