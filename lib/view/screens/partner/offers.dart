import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/view/widgets/card_offer.dart';
import 'package:loyalty/view/widgets/card_offer_partner.dart';
import 'package:loyalty/view/widgets/text.dart';

class offers extends StatelessWidget {
  offers({Key? key}) : super(key: key);
 final controller4 = Get.find<PartnerController>();
 final controller = Get.find<ProfileController>();
  final controller1 = Get.find<OfferController>();
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
                height: MediaQuery.of(context).size.height * 0.25,
                //color: Colors.grey,
                margin: EdgeInsets.all(10),
              ),
              Positioned(
                  left: 20,
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    //  Get.toNamed('/points'),
                    icon: Icon(Icons.arrow_back_sharp),
                    color: white,
                    iconSize: 40,
                  )),
              Positioned(
                right: 50,
                top: 40,
                child: TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    text: ":عروضي الخاصة ",
                    color: Colors.white,
                    underLine: TextDecoration.none),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
               controller.prof!.offers.length== 0
                          ?controller.status_show_p_part==200||controller.status_show_p_part==201?
                           SizedBox(
                              height: 200,
                              child: Center(
                                child: TextUtils(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    text: "لا يوجد عروض خاصة بي     ",
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
                              )):
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: Obx(() {
                  if (controller1.isloading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                  itemBuilder: (context, index) {
                    return offerpartner(controller.prof!.offers[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: controller.prof!.offers.length,
                );}),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
