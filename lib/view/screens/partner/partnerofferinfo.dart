import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/model/partner_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/card_offer_partner.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../../../userinformation.dart';

// ignore: camel_case_types
class offerdetail extends StatelessWidget {
  offerdetail({Key? key}) : super(key: key);

  var A = Get.arguments;

  final controller = Get.find<OfferController>();
  final controller1 = Get.find<AuthController>();
  final controller2 = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Stack(children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "${Userinformation.domain}/${A.imgUrl}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 350,
                      height: 400,
                      //color: Colors.grey,
                      margin: EdgeInsets.all(10),
                    ),
                    Positioned(
                        left: 20,
                        top: 20,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.arrow_back_sharp),
                          color: black,
                          iconSize: 30,
                        ))
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: TextUtils(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  text: "${A.name.toString()} ",
                  color: black,
                  underLine: TextDecoration.none),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: "Quantity :${A.quantity.toString()}",
                  color: black,
                  underLine: TextDecoration.none),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: "Value in Bonus : ${A.valueInBonus.toString()} Points",
                  color: black,
                  underLine: TextDecoration.none),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: "Value in Gems : ${A.valueInGems.toString()} Gems",
                  color: black,
                  underLine: TextDecoration.none),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  //  SizedBox(width: 20,),
                  Button(
                    onPressed: () async {
                      // print("index is:${A.id}");

                      Get.toNamed('/editoffer', arguments: A.id);
                    },
                    text: "تعديل",
                    hight: 50,
                    width: 80,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Button(
                    onPressed: () {
                      openDialog(context);
                      //  Get.back();
                    },
                    text: "حذف",
                    hight: 50,
                    width: 80,
                  ),
                    SizedBox(
                    width: 30,
                  ),
                     Button(
              onPressed: () async {
                // print("index is:${A.id}");

                Get.toNamed('/scanner_sell',arguments: A.id);
              },
              text: "  بيع  ",
              hight: 50,
              width: 80,
            ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
         
            //  Padding(
            //   padding: const EdgeInsets.only(right: 30),
            //   child: TextUtils(
            //   fontSize: 17,
            //  fontWeight: FontWeight.normal,
            //   text: ":العروض الخاصة بالشركة",
            //  color: black,
            //  underLine: TextDecoration.none),),
            //               SizedBox(height: 15,),
          ]),
        ),
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
            text: "",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: " هل انت متأكد من  حذف العرض ؟؟ ",
            color: Colors.black,
            underLine: TextDecoration.none),
        actions: [
          Row(
            children: [
              Button(
                onPressed: () async {
                  controller.isDialogOpen.value = false;
                  EasyLoading.show(status: 'Loading..');
                  await controller.DeleteOffer(controller1.TokenPartner!, A.id);
                  controller.isloading(!controller.isloading.value);
                  if (controller.isloading.isTrue)
                    controller.isloading(!controller.isloading.value);

                  if (controller.status_deleteoffer == 200 ||
                      controller.status_deleteoffer == 201) {
                    controller2.isloading(!controller2.isloading.value);
                    Get.offNamed('/offers');
                    Get.back();
                    Get.back();
                  }
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
