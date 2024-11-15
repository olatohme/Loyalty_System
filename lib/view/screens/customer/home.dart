import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/model/myoffers_model.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/view/screens/customer/profile.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/card_partner.dart';
import 'package:loyalty/view/widgets/card_subscripe.dart';
import 'package:loyalty/view/widgets/card_offer.dart';
import 'package:loyalty/view/widgets/searchformtext.dart';
import 'package:loyalty/view/widgets/text.dart';

class HomeScreen extends StatelessWidget {
//final controller4 = Get.find<OfferController>();

  // get kBackgroundColor => null;

  var controller3 = Get.find<PartnerController>();
  var controller4 = Get.find<OfferController>();
  var controller5 = Get.find<Send_Points>();
  var controller1 = Get.find<AuthController>();
  var controller2 = Get.find<ProfileController>();
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
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
                // ListTile(
                //   title: TextUtils(
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //     text: "الإشعارات",
                //     color: Colors.white,
                //     underLine: TextDecoration.none,
                //   ),
                //   onTap: () {},
                // ),
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
                  onTap: () {
                    controller2.isloading(!controller2.isloading.value);
                    if (controller2.isloading.isTrue)
                      controller2.isloading(!controller2.isloading.value);
                    Get.toNamed('/profile');
                    //Get.to(() => profile(profil));

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
                      controller5.isloading_record(
                          !controller5.isloading_record.value);
                      controller5.isloading_record_c(
                          !controller5.isloading_record_c.value);
                      controller5.isloading_record_cg(
                          !controller5.isloading_record_cg.value);
                      controller5.isloading_record_g(
                          !controller5.isloading_record_g.value);
                      if (controller5.isloading_record.isTrue)
                        controller5.isloading_record(
                            !controller5.isloading_record.value);
                      if (controller5.isloading_record_g.isTrue)
                        controller5.isloading_record_g(
                            !controller5.isloading_record_g.value);
                      if (controller5.isloading_record_c.isTrue)
                        controller5.isloading_record_c(
                            !controller5.isloading_record_c.value);
                      if (controller5.isloading_record_cg.isTrue)
                        controller5.isloading_record_cg(
                            !controller5.isloading_record_cg.value);
                      Get.toNamed('/record');
                    }),
                // Divider(
                //   color: Colors.white,
                //   height: 1,
                // ),

                // ListTile(
                //   title: TextUtils(
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //     text: "مشترياتي",
                //     color: Colors.white,
                //     underLine: TextDecoration.none,
                //   ),
                // ),
                Divider(
                  color: Colors.white,
                  height: 1,
                ),
                ListTile(
                    title: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      text: "انشاء حساب",
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    onTap: () {
                      Get.toNamed('/regester');
                    }),
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
                : 0 * MediaQuery.of(context).size.height,
            bottom: controller.isCollapsed.value
                ? 0
                : 0 * MediaQuery.of(context).size.height,
            left: controller.isCollapsed.value
                ? 0
                : 0.5 * MediaQuery.of(context).size.width,
            right: controller.isCollapsed.value
                ? 0
                : -0.5 * MediaQuery.of(context).size.width,
            child: Scaffold(
              // backgroundColor: kBackgroundColor,
              // appBar: AppBar(
              //   backgroundColor: Get.isDarkMode ? black : kPrimaryColor,
              //   leading: Builder(builder: (context) {
              //     return IconButton(
              //       icon: Icon(
              //         Icons.view_headline,
              //         color: white,
              //       ),
              //       onPressed: () {
              //         Scaffold.of(context).openDrawer();
              //       },
              //     );

              //     /*  IconButton(
              //           icon: Icon(
              //             Icons.view_headline,
              //             color: white,
              //           ),
              //           onPressed: () {
              //             Get.isDarkMode
              //                 ? Get.changeThemeMode(ThemeMode.light)
              //                 : Get.changeThemeMode(ThemeMode.dark);
              //           },
              //         ),*/
              //   }),
              // ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.99,
                      height: MediaQuery.of(context).size.height * 0.20,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? black : kPrimaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                
                                   
                                    IconButton(
                                      iconSize: 35,
                                      icon: Icon(Icons.menu),
                                      color: Colors.white,
                                      onPressed: () async {
                                        if (controller1.TokenCustomer == null)
                                          controller.openDialog(context);
                                        else
                                          controller.isCollapsed(
                                              !controller.isCollapsed.value);
                                        //   print(controller.isCollapsed.value);
                                        //   print("number is:${controller1.n}");
                                        //   print(
                                        //       "${controller1.profile!.nickName.toString()}");
                                        //   print("${controller4.offers.length}");
                                        //   print(controller1.tokencustomer);
                                      },
                                    ),
                                     SizedBox(width: 30,),
                                     controller1.TokenCustomer != null?
                                     IconButton(
                                      onPressed: () async {
                                        controller.isloading(
                                            !controller.isloading.value);
                                       
                                        controller3.partners =
                                            await controller3.GetPartner();
                                              controller.isloading(
                                            !controller.isloading.value);
                                               controller4.isloading(
                                            !controller4.isloading.value);
                                        controller4.offers =
                                            await controller4.Getmyoffers(
                                                controller1.TokenCustomer!);
                                              
                                      
                                             controller4.isloading(
                                            !controller4.isloading.value);
                                        // controller4.isloading(!controller4.isloading.value);
                                        // controller1.isloading_p(!controller1.isloading_p.value);
                                        print("proooooo");
                                      },
                                      icon: Icon(Icons.refresh),
                                      iconSize: 40,
                                      color: Colors.white,
                                    ): TextUtils(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  text: "",
                                  color: Colors.white,
                                  underLine: TextDecoration.none,
                                ),
                                   
                                SizedBox(
                                  width: 150,
                                ),
                                TextUtils(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  text: "مرحبا بك",
                                  color: Colors.white,
                                  underLine: TextDecoration.none,
                                ),
                                //    SizedBox(width: 100,),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: TextUtils(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                text: "عزيزي المستخدم ",
                                color: Colors.white,
                                underLine: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SearchFormText(
                              text: 'ابحث عن العروض والخصومات',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.67,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 150),
                          child: TextUtils(
                              fontSize: 19,
                              fontWeight: FontWeight.normal,
                              text: 'العملاء والشركاء',
                              color: Colors.black,
                              underLine: TextDecoration.none),
                        ),
                        controller3.partners.length == 0
                            ? controller3.status_getpartner == 200 ||
                                    controller3.status_getpartner == 201
                                ? SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: TextUtils(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          text: "لا يوجد شركاء  ",
                                          // text: "name is: Adidas",
                                          color: Colors.black,
                                          underLine: TextDecoration.none),
                                    ))
                                : SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: TextUtils(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          text: "Server error",
                                          // text: "name is: Adidas",
                                          color: Colors.black,
                                          underLine: TextDecoration.none),
                                    ))
                            : SizedBox(
                                height: 200,
                                child: Obx(() {
                                  if (controller.isloading.isFalse) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else
                                    return ListView.builder(
                                      reverse: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller3.partners.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CardSubscribe(
                                            controller3.partners[index]);
                                      },
                                    );
                                }),
                              ),
                        SizedBox(
                          height: 10,
                        ),
//  Divider(
//                   color: Colors.black,
//                   height: 1,
//                 ),
                        Padding(
                          padding: EdgeInsets.only(left: 150),
                          child: TextUtils(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                            text: "العروض المتاحة ",
                            color: Colors.black,
                            underLine: TextDecoration.none,
                          ),
                        ),
                        controller1.TokenCustomer == null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/no.png',
                                    height: 150,
                                    width: 150,
                                  ),
                                  TextUtils(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    text: " لا يوجد عروض متاحة لك  ",
                                    color: black,
                                    underLine: TextDecoration.none,
                                  ),
                                ],
                              )
                            :
                            //-------------------------
                            controller4.offers.length == 0
                                ? controller4.status_getoffer == 200 ||
                                        controller4.status_getoffer == 201
                                    ? SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: TextUtils(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              text: "لا يوجد عروض متاحة ",
                                              // text: "name is: Adidas",
                                              color: Colors.black,
                                              underLine: TextDecoration.none),
                                        ))
                                    : Obx(() {
                                        if (controller4.isloading.isFalse) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else
                                          return SizedBox(
                                              height: 400,
                                              child: Center(
                                                child: TextUtils(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    text: "Server error",
                                                    // text: "name is: Adidas",
                                                    color: Colors.black,
                                                    underLine:
                                                        TextDecoration.none),
                                              ));
                                      })
                                : SizedBox(
                                    height: 280,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return cardoffer(
                                            controller4.offers[index], index);
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 20,
                                      ),
                                      itemCount: controller4.offers.length,
                                    ),
                                  ),
//----------------------------------------------------
                        // GridView.count(
                        //     crossAxisCount: 1,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        //     shrinkWrap: true,
                        //     crossAxisSpacing: 8.0,
                        //     mainAxisSpacing: 8.0,
                        //     childAspectRatio: 1.5,
                        //     children: List.generate(10, (index) {
                        //       return cardoffer();
                        //     })),
                        //  SizedBox(height: 20,)
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
          );
        }),
      ],
    ));
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
                  controller1.Logout(controller1.TokenCustomer!);
                  if (controller1.statuscode_logout == 200 ||
                      controller1.statuscode_logout == 201)
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
