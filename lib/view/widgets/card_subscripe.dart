import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/model/bundles_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';
import 'package:loyalty/view/widgets/textfield.dart';

import 'custom_textfield.dart';

class card extends StatelessWidget {
  BundlesModel B;

  card(this.B);
  var controller = Get.find<HomeController>();
  var controller1 = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(180),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(150),
            ),
          ),
          width: 290,
          height: 600,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          left: 30,
          top: 25,
          child: Container(
            width: 250,
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                // TextUtils(
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //     text: B.name,
                //     color: Colors.red.shade900,
                //     underLine: TextDecoration.none),
                // SizedBox(
                //   height: 5,
                // ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: "Gems is: ${B.gems}",
                    color: Colors.red.shade900,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: "Bonus is:${B.bonus}",
                    color: Colors.red.shade900,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: "price is :${B.price}",
                    color: kPrimaryColor,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: 'Period is :${B.expirationPeriod}',
                    color: Colors.green,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: 'golden_offers :${B.goldenOffersNumber}',
                    color: black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: 'silver_offers :${B.silverOffersNumber}',
                    color: black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: 'bronze_offers :${B.bronzeOffersNumber}',
                    color: black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: 'new_offers :${B.newOffersNumber}',
                    color: black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    if (controller1.TokenPartner == null)
                      controller.openDialog_p(context);
                    else
                      _showBottomSheet(context);
                    // Get.toNamed('/buy_bundl',arguments: B);
                  },
                  child: Container(
                    child: Center(
                      child: TextUtils(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          text: 'اشتراك',
                          color: white,
                          underLine: TextDecoration.none),
                    ),
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(110),
              ),
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: Container(
            width: 130,
            height: 35,
            color: Colors.white,
            child: Center(
              child: TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: B.name,
                  color: kPrimaryColor,
                  underLine: TextDecoration.none),
            ),
          ),
        ),
      ],
    );
  }

  // void openDialog(BuildContext context) {
  //   final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  //   controller.isDialogOpen.value = true;
  //   Get.dialog(
  //     Form(
  //       key: fromKey,
  //       child: AlertDialog(
  //         titlePadding: EdgeInsets.only(top: 30, left: 190),
  //         title: TextUtils(
  //             fontSize: 17,
  //             fontWeight: FontWeight.normal,
  //             text: "اشتراك بالباقة",
  //             color: Colors.black,
  //             underLine: TextDecoration.none),
  //         content: SingleChildScrollView(
  //           child: Container(
  //             height: 300,
  //             child: Column(
  //               children: [
  //                 CustomTextField(
  //                   hintText: 'card number',
  //                   prefixIcon: Text(""),
  //                   suffixIcon: Text(""),
  //                   validator: (value) {
  //                     if (value.isEmpty) {
  //                       return 'Please enter a password ';
  //                     }
  //                     if (value.toString().length < 16) {
  //                       return 'Password should be  equal to 16 characters';
  //                     } else {
  //                       return null;
  //                     }
  //                   },
  //                   hight: 60,
  //                   width: MediaQuery.of(context).size.width * 0.70,
  //                   keyboardType: TextInputType.number,
  //                   onchange: (value) {
  //                     controller.card_num = value;
  //                   },
  //                   obscureText: false,
  //                 ),
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 CustomTextField(
  //                   hintText: '  secret key',
  //                   prefixIcon: Text(""),
  //                   suffixIcon: Text(""),
  //                   validator: (value) {
  //                     if (value.isEmpty) {
  //                       return 'Please enter a password ';
  //                     }
  //                     if (value.toString().length < 4) {
  //                       return 'Password should be  equal to 4 characters';
  //                     } else {
  //                       return null;
  //                     }
  //                   },
  //                   hight: 60,
  //                   width: MediaQuery.of(context).size.width * 0.70,
  //                   keyboardType: TextInputType.number,
  //                   onchange: (value) {
  //                     controller.card_key = value;
  //                   },
  //                   obscureText: false,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           Center(
  //             child: Button(
  //               onPressed: () {
  //                 if (fromKey.currentState!.validate()) {
  //                   EasyLoading.show(status: 'Loading..');
  //                   controller.isDialogOpen.value = false;
  //                   controller.buy_bundle(
  //                       context, controller1.TokenPartner!, B.id);
  //                   Get.back();
  //                 }
  //                 ;
  //               },
  //               text: "شراء",
  //               hight: 50,
  //               width: 150,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           )
  //         ],
  //       ),
  //     ),
  //     barrierDismissible: false,
  //   );
  // }

  void _showBottomSheet(BuildContext context) {
    final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
     final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(seconds: 2), // تعديل مدة الحركة هنا
    );
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: fromKey,
          child: Container(
            height: 400, // ارتفاع الشيت بوتوم
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: TextUtils(
                    color: Colors.black,
                    text: "Card Number",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: CustomTextField2(
                    hintText: 'card number',
                    prefixIcon: Text(""),
                    suffixIcon: Text(""),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a password ';
                      }
                      if (value.toString().length < 16) {
                        return 'Password should be  equal to 16 characters';
                      } else {
                        return null;
                      }
                    },
                    hight: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    keyboardType: TextInputType.number,
                    onchange: (value) {
                      controller.card_num = value;
                    },
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: TextUtils(
                    color: Colors.black,
                    text: "Secret Key",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: CustomTextField2(
                    hintText: ' secret key ',
                    prefixIcon: Text(""),
                    suffixIcon: Text(""),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a password ';
                      }
                      if (value.toString().length < 4) {
                        return 'Password should be  equal to 4 characters';
                      } else {
                        return null;
                      }
                    },
                    hight: 60,
                    width: MediaQuery.of(context).size.width * 0.88,
                    keyboardType: TextInputType.number,
                    onchange: (value) {
                      controller.card_key = value;
                    },
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (fromKey.currentState!.validate()) {
                        EasyLoading.show(status: 'Loading..');
                        controller.isDialogOpen.value = false;
                        await controller.buy_bundle(
                            context, controller1.TokenPartner!, B.id);
                       // Navigator.pop(context);
                         Get.back();
                      }
                      ;
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade900,
                      minimumSize: Size(180, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    child: TextUtils(
                      color: Colors.white,
                      text: "Buy",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                    ),
                  ),
                )
                // يمكنك إضافة المزيد من العناصر هنا
              ],
            ),
          ),
        );
      },
    );
  }
}
