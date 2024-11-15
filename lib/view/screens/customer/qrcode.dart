import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/view/widgets/text.dart';

class QrCode extends StatelessWidget {
   QrCode({Key? key}) : super(key: key);
  
final controller = Get.find<AuthController>();
final controller1 = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Row(
                  children: [
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // IconButton(
                    //   onPressed: () {
                       
                        
                    //     Get.back();
                    //   },
                    //   icon: Icon(Icons.arrow_back_sharp),
                    //   color: black,
                    //   iconSize: 40,
                    // ),
                    SizedBox(
                      width: 160,
                    ),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        // text:
                        //     "Phone is: ${l.user.phoneNumber.toString()}",
                        text: "  MY QR Code ",
                        color: Colors.black,
                        underLine: TextDecoration.none),
                  ],
                ),
            Row(
              children: [
                Image.asset(
                  "assets/images/QR.png",
                  height: 400,
                  width: 250,
                ),
               
                Column(
                  children: [
                      TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "لإرسال نقاط ",
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "قم بمسح الكود التالي",
                        color: Colors.black,
                        underLine: TextDecoration.none),
                       
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 4,
                            ),
                            color: white),
                            width: 250,
                            height: 250,
              child: Center(
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data:controller1.status_show_p_cust == 200 ||
                                controller1.status_show_p_cust == 201
                            ? 
                  //"helloooooooooooooooooo",
                  controller1.profile!.user.phoneNumber:"Server Error",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 30,),
              TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: "  لبيع العرض قم بمسح الكود التالي ",
                        color: Colors.black,
                        underLine: TextDecoration.none),
                          SizedBox(height: 30,),
                          Container(
              decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 4,
                            ),
                            color: white),
                            width: 250,
                            height: 250,
              child: Center(
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data:controller.TokenCustomer != null? 
                  //"helloooooooooooooooooo",
                  controller.TokenCustomer!:"Server Error",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
             SizedBox(height: 30,),
                       
          ],
        ),
      ),
    ));
  }
}
