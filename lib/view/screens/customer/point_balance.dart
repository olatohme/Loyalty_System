import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/text.dart';
import 'package:loyalty/view/widgets/textfield.dart';

class PointsBalance extends StatelessWidget {
  PointsBalance({Key? key}) : super(key: key);
  var controller = Get.find<Send_Points>();
  var controller3 = Get.find<HomeController>();
  final controller2 = Get.find<ProfileController>();
  final controller1 = Get.find<AuthController>();
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
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20),
                  //   child: Row(
                  //     // crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
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
                  // SizedBox(
                  //   width: 20,
                  // ),
                  // TextUtils(
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.bold,
                  //     text: ":مدة صلاحية النقاط",
                  //     color: Colors.green.shade800,
                  //     underLine: TextDecoration.none),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: Button(
                      onPressed: () {
                        if (controller1.TokenCustomer == null)
                          controller3.openDialog(context);
                        else
                          Get.toNamed('/send');
                      },
                      text: "إرسال نقاط ",
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
                        if (controller1.TokenCustomer == null)
                          controller3.openDialog(context);
                        else
                          Get.toNamed('/sendgems');
                      },
                      text: "إرسال جواهر ",
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
                        if (controller1.TokenCustomer == null)
                          controller3.openDialog(context);
                        else
                          openDialog(context);
                      },
                      text: "استبدال نقاط ",
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
                        if (controller1.TokenCustomer == null)
                          controller3.openDialog(context);
                        else
                          openDialog_g(context);
                      },
                      text: "استبدال جواهر  ",
                      hight: 50,
                      width: 200,
                    ),
                  ),
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
        content: Container(
          height: 300,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
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
              SizedBox(
                height: 40,
              ),
              Center(
                child: Button(
                  onPressed: () async {
                    EasyLoading.show(status: "Loading...");
                    await controller.ConvertBonus(
                        context, controller1.TokenCustomer!);
                    controller.isloading_record_c(
                        !controller.isloading_record_c.value);
                    controller.isDialogOpen.value = false;
                    // if (controller.status_convert == 200 ||
                    //     controller.status_convert == 201)

                    // Get.back();
                    // Get.back();
                  },
                  text: "استبدال",
                  hight: 50,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            height: 20,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  void openDialog_g(BuildContext context) {
    controller.isDialogOpen.value = true;
    Get.dialog(
      AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
        title: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: "استبدال الجواهر كاش",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: Container(
          height: 300,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hintText: 'عدد الجواهر',
                prefixIcon: Text(""),
                obscureText: false,
                suffixIcon: Text(""),
                validator: (value) {},
                hight: 60,
                width: MediaQuery.of(context).size.width * 0.70,
                keyboardType: TextInputType.number,
                onchange: (value) {
                  controller.gems_cash = value;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Button(
                  onPressed: () async {
                    _showBottomSheet(context);
                    //Get.toNamed('/buy_gems');
                    // EasyLoading.show(status: "Loading...");
                    // await controller.ConvertBonus(
                    //     context, controller1.TokenCustomer!);
                    // controller.isloading_record_c(
                    //     !controller.isloading_record_c.value);
                    // controller.isDialogOpen.value = false;
                    // if (controller.status_convert == 200 ||
                    //     controller.status_convert == 201)

                    // Get.back();
                    // Get.back();
                    controller.isDialogOpen.value = false;
                  },
                  text: "استبدال",
                  hight: 50,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            height: 20,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

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
            height: 500, // ارتفاع الشيت بوتوم
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
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (fromKey.currentState!.validate()) {
                        EasyLoading.show(status: 'Loading..');
                        //controller.isDialogOpen.value = false;
                        await controller.buy_gems(
                          context,
                          controller1.TokenCustomer!,
                        );
                        Get.back();
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
