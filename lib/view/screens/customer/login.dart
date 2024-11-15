import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/view/screens/storage.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/phone_field.dart';
import 'package:loyalty/view/widgets/text.dart';

class LoginCustomer extends StatelessWidget {
  var controller1 = Get.find<PartnerController>();
  var controller = Get.find<AuthController>();
  var controller3 = Get.find<HomeController>();
  var controller2 = Get.find<ProfileController>();
  var controller4 = Get.find<OfferController>();
  var controller5 = Get.find<Send_Points>();
  final RxBool _obscureText = true.obs;
  final fromKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                     IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_sharp),
                    color: black,
                    iconSize: 40,
                  ),
                  SizedBox(width: 20,),
                    TextUtils(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        text: 'قم يتسجيل الدخول للاستفادة من عروضنا ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset(
                    'assets/images/log.png',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                phoneTextField(
                  hintText: 'رقم الموبايل',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.phone, color: Colors.grey),
                  validator: (value) {
                    if (value.completeNumber.isEmpty) {
                      return 'Please enter an phone';
                    }
                    if (!RegExp(validationPhone)
                        .hasMatch(value.completeNumber)) {
                      return 'Invalid phone';
                    } else {
                      return null;
                    }
                  },
                
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.number,
                  onchange: (value) {
                    controller.phone = value.completeNumber;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CustomTextField(
                    hintText: 'كلمة المرور',
                    prefixIcon: Text(""),
                    obscureText: _obscureText.value,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          _obscureText.toggle();
                          print(_obscureText
                              .value); // تبديل قيمة الـ RxBool بين true و false
                        },
                        child: Icon(
                          _obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:
                              _obscureText.value ? kPrimaryColor : Colors.grey,
                        )),

                    //const Icon(Icons.visibility, color: Colors.grey),

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a password ';
                      }
                      if (value.toString().length < 6) {
                        return 'Password should be longer or equal to 6 characters';
                      } else {
                        return null;
                      }
                    },
                    hight: 60,
                    width: MediaQuery.of(context).size.width * 0.80,
                    keyboardType: TextInputType.text,
                    onchange: (value) {
                      controller.customer_pass = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  onPressed: () async {
                    print(controller.tokencustomer);
                    print("phone is${controller.phone}");
                    //  print(controller.password);
                    if (fromKey.currentState!.validate()) {
                      EasyLoading.show(status: 'Loading..');
                      await controller.LoginCustumer();
                       Securestorage storage = Securestorage();
                      controller.TokenCustomer= (await storage.read('c_token'));
                      //   print(controller.TokenCustomer);
                      if (controller.statuscode_cus == 200 ||
                          controller.statuscode_cus == 201) {
                        print(controller.statuscode_cus);
                          controller3.isloading(!controller3.isloading.value);
                         controller1.partners = await controller1.GetPartner();
                      controller3.isloading(!controller3.isloading.value);
                       controller4.isloading(!controller4.isloading.value);
                     
                      controller4.offers = await controller4.Getmyoffers(
                          controller.TokenCustomer!);
                      controller2.profile = await controller2.ShowProfile(
                          controller.TokenCustomer!);
                      controller5.transfer = await controller5.GetTransferpoint(
                          controller.TokenCustomer!);
                            controller5.transfer_gems = await controller5.GetTransfergems(
                          controller.TokenCustomer!);
                            controller5.convert =
                          await controller5.GetConvertgems(
                              controller.TokenCustomer!);
                               controller5.convert_cash =
                  await controller5.GetConvertcash(controller.TokenCustomer!);
                        EasyLoading.showSuccess('Login Succesfull');
                        Get.offNamed('/main');
                      }
                    }
                  },
                  text: "Login",
                  hight: 50,
                  width: 200,
                ),
                // Button(
                //   onPressed: () async {
                //     // controller1.GetPartner();
                //     ProfileModel? p =
                //         await controller2.ShowProfile(controller.TokenCustomer);
                //     print(p!.id);
                //      print(p.nickName);
                //   },
                //   text: "Login",
                //   hight: 50,
                //   width: 200,
                // ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    // controller.localstorage.getString('token_customer');
                    // print("-----------${ controller.localstorage.getString('token_customer')}----");
                    print("number nnn=${controller.n}");
                    Get.offNamed('/regester');
                  },
                  child: const Center(
                    child: Text(
                      'لا تملك أي حساب ؟  اضغط لإنشاء حساب',
                      style: TextStyle(
                          fontFamily: 'Acaslon Regular',
                          fontSize: 15,
                          color: black,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // child: Container(
        //   // decoration: gradientBackground,
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   color: kBackgroundColor,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width * .9,
        //     child: ListView(
        //       padding: EdgeInsets.zero,
        //       children: [
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        //           child: TextUtils(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             text:
        //                 "Welcome to our store,\n to see our products, you must log in ..",
        //             color: Colors.black,
        //             underLine: TextDecoration.none,
        //           ),
        //         ),
        //         Container(
        //           height: 300,
        //           width: 300,
        //           child: Image.asset(
        //             'assets/images/Untitled.png',
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Container(
        //           width: MediaQuery.of(context).size.width * .13,
        //           child: Column(
        //             children: [
        //               CustomTextField(
        //                 width: MediaQuery.of(context).size.width * .13,
        //                 hight: 60,
        //                 hintText: 'Your email address',
        //                 keyboardType: TextInputType.emailAddress,
        //                 onchange: (value) {
        //                   controller.email = value;
        //                 },
        //                 // controller: emailmanager,
        //                 prefixIcon:
        //                     const Icon(Icons.email, color: kPrimaryColor),
        //                 suffixIcon: Text(""),
        //                 validator: (value) {
        //                   // if (!RegExp(validationEmail).hasMatch(value)) {
        //                   //   return 'Invalid email';
        //                   // } else {
        //                   //   return null;
        //                   // }
        //                 },
        //               ),
        //               const SizedBox(
        //                 height: 20,
        //               ),
        //               CustomTextField(
        //                 width: MediaQuery.of(context).size.width * .13,
        //                 hight: 60,
        //                 hintText: 'Your Password',
        //                 prefixIcon: Text(""),
        //                 suffixIcon: Text(""),
        //                 validator: (value) {
        //                   if (value.toString().length < 6) {
        //                     return 'Password should be longer or equal to 6 characters';
        //                   } else {
        //                     return null;
        //                   }
        //                 },
        //                 keyboardType: TextInputType.text,
        //                 onchange: (value) {
        //                   controller.password = value;
        //                 },
        //               ),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         /* GestureDetector(
        //             onTap: () {},
        //             child: const Center(
        //               child: Text(
        //                 'Forgot Your Password?',
        //                 style: TextStyle(
        //                     fontFamily: 'Acaslon Regular',
        //                     fontSize: 17,
        //                     color: white,
        //                     decoration: TextDecoration.underline),
        //               ),
        //             ),
        //           ),*/
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         Container(
        //           width: MediaQuery.of(context).size.width * .9,
        //           child: Column(
        //             children: [
        //               //GetBuilder<AuthController>(builder: (_) {
        //                 // return CustomButton(
        //                 //   onTap: () async {
        //                 //     if (fromKey.currentState!.validate()) {
        //                 //       /*  String email = emailmanager.text.trim();
        //                 //           String password = passmanager.text;*/
        //                 //       controller.login();
        //                 //       Securestorage storage = Securestorage();
        //                 //       String? test = await storage.read('token');
        //                 //       print("storage token is:$test");
        //                 //     }
        //                 //     // Get.toNamed('/products');
        //                 //   },
        //                 //   buttonColor: kPrimaryColor,
        //                 //   height: MediaQuery.of(context).size.width * .13,
        //                 //   width: MediaQuery.of(context).size.width * .88,
        //                 //   buttonName: 'Login',
        //                 //   fontColor: black,
        //                 // );

        //             //  }),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         Center(
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               const Text(
        //                 'Don\'t have an account? ',
        //                 style: TextStyle(
        //                   fontFamily: 'Acaslon Regular',
        //                   fontSize: 17,
        //                   color: black,
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: () {
        //                   Get.offNamed('/register');
        //                 },
        //                 child: const Text(
        //                   'Create one',
        //                   style: TextStyle(
        //                       fontFamily: 'Acaslon Regular',
        //                       fontSize: 17,
        //                       color: black,
        //                       decoration: TextDecoration.underline),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      )),
    );
  }
}
