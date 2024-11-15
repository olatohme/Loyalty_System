import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/text.dart';

class PointBalance extends StatelessWidget {
  PointBalance({Key? key}) : super(key: key);
  var controller = Get.find<Send_Points>();
  var controller1 = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    left: 20,
                    top: 20,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_sharp),
                      color: white,
                      iconSize: 40,
                    )),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            //color: Colors.grey,
            margin: EdgeInsets.all(10),
          ),
          //   Positioned(
          // left:20,top:20,
          // child: IconButton(
          //           onPressed:()=> Get.toNamed('/main'),
          //           icon: Icon(Icons.arrow_back_sharp),
          //           color: black,
          //           iconSize: 30,))

          Positioned(
            top: 80,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x7f000000),
                    blurRadius: 4,
                    // spreadRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.75,
              //color: Colors.grey,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: 200,
                    child: Image.asset(
                      "assets/images/bb.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //       TextUtils(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.normal,
                        //           text: "500 نقطة ",
                        //           color: black,
                        //           underLine: TextDecoration.none),
                        //       SizedBox(
                        //         width: 20,
                        //       ),
                        //       TextUtils(
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.bold,
                        //           text: ":رصيد نقاطي",
                        //           color: Colors.green.shade800,
                        //           underLine: TextDecoration.none),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 20),
                        //   child: Row(
                        //     // crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       TextUtils(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.normal,
                        //           text: "50 جوهرة",
                        //           color: black,
                        //           underLine: TextDecoration.none),
                        //       SizedBox(
                        //         width: 20,
                        //       ),
                        //       TextUtils(
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.bold,
                        //           text: ":رصيد الجواهر",
                        //           color: Colors.green.shade800,
                        //           underLine: TextDecoration.none),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 20),
                        //   child: Row(
                        //     // crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       TextUtils(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.normal,
                        //           text: "30 يوم",
                        //           color: black,
                        //           underLine: TextDecoration.none),
                        //       SizedBox(
                        //         width: 20,
                        //       ),
                        //       TextUtils(
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.bold,
                        //           text: ":مدة صلاحية النقاط",
                        //           color: Colors.green.shade800,
                        //           underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: Button(
                      onPressed: () {
                        Get.offNamed('/sendpartner');
                      },
                      text: "إرسال نقاطي ",
                      hight: 50,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: Button(
                      onPressed: () {
                        Get.toNamed('/sendgemspartner');
                      },
                      text: "إرسال جواهر ",
                      hight: 50,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 70, right: 70),
                  //   child: Button(
                  //     onPressed: () {
                  //       openDialog(context);
                  //     },
                  //     text: "استبدال نقاطي ",
                  //     hight: 50,
                  //     width: 200,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
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
            text: "استبدال النقاط",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: CustomTextField(
          hintText: 'عددالنقاط',
          prefixIcon: Text(""),
          obscureText: false,
          suffixIcon: Text(""),
          validator: (value) {},
          hight: 60,
          width: MediaQuery.of(context).size.width * 0.70,
          keyboardType: TextInputType.number,
          onchange: (value) {
            controller.inputText = value;
          },
        ),
        actions: [
          Center(
            child: Button(
              onPressed: () async{
                controller.isDialogOpen.value = false;
                
              },
              text: "استبدال",
              hight: 50,
              width: 200,
            ),
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
