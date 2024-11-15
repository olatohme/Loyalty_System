import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/model/partner_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../../userinformation.dart';

class offerdetails extends StatelessWidget {
  var offer = Get.arguments;

  final controller = Get.find<OfferController>();
  final controller1 = Get.find<AuthController>();
  final controller3 = Get.find<HomeController>();

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
                              "${Userinformation.domain}/${offer.imgUrl}"),
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
                  text: "${offer.name.toString()} ",
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
                  text: "Quantity :${offer.quantity.toString()}",
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
                  text:
                      "Value in Bonus : ${offer.valueInBonus.toString()} Points",
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
                  text: "Value in Gems : ${offer.valueInGems.toString()} Gems",
                  color: black,
                  underLine: TextDecoration.none),
            ),
            SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100),
            //   child: Button(
            //     onPressed: () {
            //       if (controller1.TokenCustomer == null)
            //         controller3.openDialog(context);
            //       else {
            //          EasyLoading.show(status: "loading..");
            //      //   controller.BuyOffer(controller1.TokenCustomer!, offer.id);
            //         if (controller.status_buyoffer == 200 ||
            //             controller.status_buyoffer == 201) {
            //           Get.back();
            //         }
            //       }
            //     },
            //     text: "Buy",
            //     hight: 50,
            //     width: 200,
            //   ),
            // ),
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
}
