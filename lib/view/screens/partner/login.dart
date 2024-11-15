import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/bundles_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/request_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/model/bundles_model.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/text.dart';

class Login extends StatelessWidget {
  var controller1 = Get.find<BundlesController>();
  final controller3 = Get.find<RequestController>();
  final controller5 = Get.find<Send_Points>();
  final controller = Get.find<AuthController>();
  final controller2 = Get.find<ProfileController>();
  final controller6 = Get.find<OfferController>();
  final controller7 = Get.find<BundlesController>();
  final RxBool _obscureText = true.obs;
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
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
                  height: 20,
                ),
                TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    text: 'قم بتسجيل الدخول للاشتراك بالباقات',
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    text: 'ولإضافة عروض ',
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/Untitled.png'
                      // 'assets/images/logggin.png',
                      ),
                ),
                SizedBox(
                  height: 40,
                ),
                // TextFormField(
                //   validator: (value) {
                //       if (value!.isEmpty) {
                //       return 'Please enter an email';
                //     }
                //     if (!RegExp(validationEmail).hasMatch(value)) {
                //       return 'Invalid email';
                //     } else {
                //       return null;
                //     }
                //   },
                // ),
                CustomTextField(
                  hintText: 'الايميل',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.email, color: kPrimaryColor),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an email';
                    }
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    controller.email = value;
                    controller.validateEmail();
                  },
                ),
                SizedBox(
                  height: 20,
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
                      controller.password = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Button(
                  onPressed: () async {
                    EasyLoading.show(status: 'loading...');
                    if (fromKey.currentState!.validate()) {
                      print("valdattttttt${fromKey.currentState!.validate()}");
                      //Fluttertoast.showToast(msg: 'Email sent');
                      // fromKey.currentState!.save();

                      await controller.LoginPartner(context);
                       await controller.ispending(controller.TokenPartner!);
              if(controller.role==2){
                EasyLoading.show(status: "please wait...");
              controller7.l = await controller7.GetBundles(context);

              controller2.prof = await controller2.ShowProfile_partner(
                  controller.TokenPartner!);
              controller5.transfer =
                  await controller5.GetTransferpoint(controller.TokenPartner!);
              controller5.transfer_gems =
                  await controller5.GetTransfergems(controller.TokenPartner!);
              EasyLoading.showSuccess('welcome back !');

              Get.offNamed(
                '/homeparther',
              );
              }
               else if(controller.role==4){
                EasyLoading.show(status: "please waiting...");
                 // EasyLoading.showSuccess('welcome back !');
                controller3.requeest = await controller3.GetRequests(
                          context, controller.TokenPartner!);
                    EasyLoading.showSuccess('welcome back !');
                        Get.offNamed('/wait');
              // Get.offNamed('/request');

               }
            }
            // print(token_p);
            //  Get.offNamed('/request');
          },
                      //----------------من هنا
                      // controller1.l = await controller1.GetBundles(
                      //     context,);
                          
                      // controller2.prof = await controller2.ShowProfile_partner(
                      //     controller.TokenPartner!);
                      // controller5.transfer = await controller5.GetTransferpoint(
                      //     controller.TokenPartner!);
                      // controller5.transfer_gems =
                      //     await controller5.GetTransfergems(
                      //         controller.TokenPartner!);
                      // if (controller.statuscode_par == 200 ||
                      //     controller.statuscode_par == 201)
                      //   EasyLoading.showSuccess("login succesful");
                      // Get.offNamed(
                      //   '/homeparther',
                      // );
                      //-----------------الى هنا
                      // controller6.isloading(!controller6.isloading.value);
                      // print(controller2.prof);
                      // if (controller1.l.length > 0) {
                      //   print(controller1.l[0].name);
                      // }
                      // controller1.GetBundles(controller.TokenPartner);

                      // Get.offNamed('/wait');
                      // );
                      // ignore: unrelated_type_equality_checks
                      //===============================
                      // controller3.requeest = await controller3.GetRequests(
                      //     context, controller.TokenPartner!);
                      // if (controller.statuscode_par == 200 ||
                      //     controller.statuscode_par == 201) {
                      //   EasyLoading.showSuccess(
                      //     'Login Successful !',
                      //   );
                      //   Get.offNamed('/wait');
                       
                      //==================================من هنا
                      // if (controller.statuscode_par == 200 ||
                      //     controller.statuscode_par == 201) {
                      //   EasyLoading.showSuccess(
                      //     'Login Successful !',
                      //   );
                      //   Get.offNamed(
                      //     '/homeparther',
                      //   );
                      //-------------الى هنا

                      // else{}

                      //Get.offNamed('/regester');

                    
                    
                  
                  text: "Login",
                  hight: 50,
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
