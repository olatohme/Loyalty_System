import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/model/partner_model.dart';
import 'package:loyalty/view/widgets/card_offer.dart';
import 'package:loyalty/view/widgets/card_partner.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../../../userinformation.dart';

class DetailPartner extends StatelessWidget {
   DetailPartner({Key? key}) : super(key: key);
   var controller = Get.find<HomeController>();
   var controller1 = Get.find<PartnerController>();
  PartnerModel partner = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
                            "${Userinformation.domain}/${partner.imgUrl}"),
fit: BoxFit.cover,
                      ),
                        ),
                        width: 380,
                        height: 200,
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
                padding: const EdgeInsets.only(right: 30),
                child: TextUtils(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    text: partner.fname.toString(),
                    color: black,
                    underLine: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 30),
              //   child: TextUtils(
              //       fontSize: 17,
              //       fontWeight: FontWeight.normal,
              //       text: "فروع الشركة:الجسر الابيض -الصالحية ",
              //       color: black,
              //       underLine: TextDecoration.none),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    text: ":تواصل مع الشركة عبر الايميل ",
                    color: black,
                    underLine: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    text: partner.email.toString(),
                    color: black,
                    underLine: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    text: ":العروض الخاصة بالشركة",
                    color: black,
                    underLine: TextDecoration.none),
              ),
              SizedBox(
                height: 15,
              ),
              partner.offer.length == 0?
              controller1.status_getpartner==200||controller1.status_getpartner==201
                          ? SizedBox(
                              height: 200,
                              child: Center(
                                child: TextUtils(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    text: "لا يوجد عروض خاصة بالشركة ",
                                    // text: "name is: Adidas",
                                    color: Colors.black,
                                    underLine: TextDecoration.none),
                              ))
                          : 
            SizedBox(
                              height: 200,
                              child: Center(
                                child: TextUtils(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    text: "Server error",
                                    // text: "name is: Adidas",
                                    color: Colors.black,
                                    underLine: TextDecoration.none),
                              )):  SizedBox(
                height: 315,
                
                child:  
                
          //       Obx(() {
          // if (controller.isloading.isTrue) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          // return 
          ListView.separated(
                  itemBuilder: (context, index) {
                    return cardoffer(partner.offer[index],index);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: partner.offer.length,
                )
                //;}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
