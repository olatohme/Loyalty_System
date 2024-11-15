import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/model/partner_model.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../../userinformation.dart';

class CardSubscribe extends StatelessWidget {
  var controller1 = Get.find<AuthController>();
  final PartnerModel partner;
   CardSubscribe(this.partner);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          print("${controller1.TokenCustomer}");
          Get.toNamed('/detailsPartner', arguments: partner);
        },
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

              width: 300,
              height: 200,
              //color: Colors.grey,
              margin: EdgeInsets.all(10),
            ),
            Positioned(
              top: 25,
              left: 50,
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  text: partner.fname,
                  color: Colors.black,
                  underLine: TextDecoration.none),
            )
          ],
        ),
      ),
    ]);
  }
}
