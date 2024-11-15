import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/phone_field.dart';

class editprofile_partner extends StatelessWidget {
  editprofile_partner({Key? key}) : super(key: key);
  final controller = Get.find<ProfileController>();
  final controller1 = Get.find<AuthController>();
  final fromKey = GlobalKey<FormState>();
  final RxBool _obscureText = true.obs;
  final RxBool _obscureText2 = true.obs;
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .2,
                child: Divider(
                  color: kPrimaryColor,
                  thickness: 2,
                ),
              ),
              const Text(
                'تعديل المعلومات الشخصية',
                style: TextStyle(
                    fontFamily: 'Acaslon Regular', fontSize: 20, color: black),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .2,
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
                    controller.getImage_partner();
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
            hintText: 'الاسم الأول',
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
              controller.fname_p = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'الاسم الأخير',
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
              controller.lname_p = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'التفاصيل ',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.lock_outlined, color: Colors.grey),
            validator: (value) {},
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.text,
            onchange: (value) {
              controller.details = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          phoneTextField(
            obscureText: false,
            hintText: 'رقم الموبايل ',
            prefixIcon: Text(""),
            suffixIcon: const Icon(Icons.phone, color: Colors.grey),
            validator: (value) {
              // if (value.completeNumber.isEmpty) {
              //   return 'Please enter an phone';
              // }
              if (!RegExp(validationPhone).hasMatch(value.completeNumber)) {
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
            height: 20,
          ),
          CustomTextField(
            hintText: 'الايميل',
            prefixIcon: Text(""),
            obscureText: false,
            suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
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
              controller.email_p = value;
              //  controller.validateEmail();
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
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
                  _obscureText.value ? Icons.visibility : Icons.visibility_off,
                  color: _obscureText.value ? kPrimaryColor : Colors.grey,
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
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'تاكيد كلمة المرور',
            prefixIcon: Text(""),
            obscureText: _obscureText2.value,
            suffixIcon: GestureDetector(
                onTap: () {
                  _obscureText2.toggle();
                  print(_obscureText2
                      .value); // تبديل قيمة الـ RxBool بين true و false
                },
                child: Icon(
                  _obscureText2.value ? Icons.visibility : Icons.visibility_off,
                  color: _obscureText2.value ? kPrimaryColor : Colors.grey,
                )),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a confirm password ';
              }
              if (value != controller.password) {
                return 'The password and its confirmation are not the same';
              } else {
                return null;
              }
            },
            hight: 60,
            width: MediaQuery.of(context).size.width * 0.80,
            keyboardType: TextInputType.text,
            onchange: (value) {
              controller.confirm = value;
            },
          ),
          SizedBox(
            height: 20,
          ),

          Button(
            onPressed: () async {
              if (fromKey.currentState!.validate()) {
                EasyLoading.show(status: 'Loading..');

                await controller.EditProfile_partner(
                    context, controller1.TokenPartner!);
                controller.isloading_p(!controller.isloading_p.value);
                if (controller.isloading_p.isTrue)
                  controller.isloading_p(!controller.isloading_p.value);
                if (controller.status_edit_p_part == 200 ||
                    controller.status_edit_p_part == 201) {
                  //  EasyLoading.showSuccess("")
                  // Get.back();
                  Get.back();
                }
              }
            },
            text: "Send",
            hight: 50,
            width: 200,
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed('/login');
            },
            child: const Center(
              child: Text(
                'هل تملك حساب ؟ اضغط لتسجيل الدخول',
                style: TextStyle(
                    fontFamily: 'Acaslon Regular',
                    fontSize: 15,
                    color: black,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ]))))));
  }
}
