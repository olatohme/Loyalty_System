import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/request_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';

class EditOffer extends StatelessWidget {
  final controller = Get.find<OfferController>();
  final controller1 = Get.find<AuthController>();
  final controller2 = Get.find<HomeController>();
  int id = Get.arguments;
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: fromKey,
        child: SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
                    child: Center(
                        child: Column(children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Divider(
                  color: kPrimaryColor,
                  thickness: 2,
                ),
              ),
              const Text(
                'تعديل معلومات عرض ',
                style: TextStyle(
                    fontFamily: 'Acaslon Regular', fontSize: 20, color: black),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Divider(
                  color: kPrimaryColor,
                  thickness: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Stack(children: [
              Container(
                width: 150,
                height: 150,
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: white,
                ),
                child: Obx(() {
                  if (controller.image == null &&
                      controller.updat.value == false)
                    return Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.grey.shade400,
                    );
                  else
                    return Image.file(
                      controller.image!,
                      fit: BoxFit.cover,
                    );
                }),
              ),
              Positioned(
                top: 80,
                left: 100,
                child: InkWell(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: black,
                    ),
                  ),
                ),
              )
            ]),
          ),
          // Row(
          //   children: [
          // Container(
          //         height: 100,
          //         width: 100,
          //         alignment: Alignment.centerLeft,
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade300,
          //             shape: BoxShape.circle,
          //             border: Border.all(width: 2, color: Colors.black),),
          //              child: controller.image == null
          // ? Center(
          //     child: Text('No image '),
          //   )
          // : Image.file(
          //     controller.image,
          //     fit: BoxFit.cover,
          //   ),
          //    ),
          // Button(
          //   onPressed: () {
          //     controller.getImage();
          //   },
          //   text: "Choose image",
          //   hight: 50,
          //   width: 100,
          // ),

          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'اسم العرض',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.person, color: Colors.grey),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a name';
              }
              if (!RegExp(validationName).hasMatch(value)) {
                return 'Invalid name';
              } else {
                return null;
              }
            },
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.emailAddress,
            onchange: (value) {
              controller.name = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'كمية العرض',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.person, color: Colors.grey),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a quantity';
              } else {
                return null;
              }
            },
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.emailAddress,
            onchange: (value) {
              controller.quantity = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'ثمن العرض بالنقاط ',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.lock_outlined, color: Colors.grey),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a value';
              } else {
                return null;
              }
            },
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.text,
            onchange: (value) {
              controller.valueInBonus = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'ثمن العرض بالجواهر',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.lock_outlined, color: Colors.grey),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a value';
              } else {
                return null;
              }
            },
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.text,
            onchange: (value) {
              controller.valueInGems = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'رقم شريحة المستخدمين',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a segmentation id';
              } else {
                return null;
              }
            },
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.emailAddress,
            onchange: (value) {
              controller.id = value;
              //  controller.validateEmail();
            },
          ),
          SizedBox(
            height: 40,
          ),

          SizedBox(
            height: 20,
          ),

          Button(
            onPressed: () async {
              //controller.addprod2();
              if (fromKey.currentState!.validate()) {
                EasyLoading.show(status: 'Loading..');
                await controller.EditOffer(controller1.TokenPartner!,id);
                 controller.isloading(!controller.isloading.value);
                if (controller.status_addoffer == 200 ||
                    controller.status_addoffer == 201) {
                      controller2.isloading(!controller2.isloading.value);
                 // EasyLoading.showSuccess('Updated completed successfully');
                  // controller2.isloading(!controller2.isloading.value);
                  Get.back();
                   Get.back();
                } 
                     
              }
            },
            text: "تعديل",
            hight: 50,
            width: 200,
          ),
          SizedBox(
            height: 50,
          ),
        ]))))));
  }
}
