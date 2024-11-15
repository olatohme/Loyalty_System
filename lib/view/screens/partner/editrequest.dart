import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/request_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/phone_field.dart';
import 'package:loyalty/view/widgets/text.dart';

class EditRequest extends StatelessWidget {
  final controller = Get.find<RequestController>();
  final controller1 = Get.find<AuthController>();
   final RxBool _obscureText = true.obs;
    final RxBool _obscureText2 = true.obs;
  
  int id = Get.arguments;

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
                    text: 'لتعديل معلومات طلب الاشتراك  ',
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    text: 'ادخل المعلومات الحديثة',
                    color: Colors.black,
                    underLine: TextDecoration.none),
                // Container(
                //   height: 250,
                //   width: 250,
                //   child: Image.asset(
                //     'assets/images/edit.png',
                //   ),
                // ),
                Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Stack(children: [
                   Container(
                    width: 150,
                    height: 150,),
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
                    left:100,
                     child: InkWell(
                      onTap:(){controller.getImage() ;},
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
                        child: Icon(Icons.add_a_photo_outlined,color: black,),),
                     ),
                      
                   )
             ] ),
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
              controller.fname = value;
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
              controller.lname = value;
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
            validator: (value) {
           
            },
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
                    controller.email = value;
                  //  controller.validateEmail();
                  },
                ),
          SizedBox(
            height: 20,
          ),
          Obx(
                  () =>  CustomTextField(
            hintText: 'كلمة المرور',
            prefixIcon: Text(""),
             obscureText: _obscureText.value,
            suffixIcon:   GestureDetector(
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
          ),),
          SizedBox(
            height: 20,
          ),
          Obx(
                  () =>  CustomTextField(
            hintText: 'تاكيد كلمة المرور',
            prefixIcon: Text(""),
             obscureText:_obscureText2.value,
            suffixIcon: GestureDetector(
                    onTap: () {
                      _obscureText2.toggle();
                      print(_obscureText2
                          .value); // تبديل قيمة الـ RxBool بين true و false
                    },
                    child: Icon(
                          _obscureText2.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:
                              _obscureText2.value ? kPrimaryColor : Colors.grey,
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
          ),),
          SizedBox(
            height: 20,
          ),

         Button(
                  onPressed: () async {
                    if (fromKey.currentState!.validate()) {
                        EasyLoading.show(status: "Loading...");
                      await controller.EditRequest(
                          context, controller1.TokenPartner!, id);
                         controller.isLoading(!controller.isLoading.value);
                     if(controller.status_editrequest==200||
                     controller.status_editrequest==201)
                   
                    Get.back();
                    }
                  },
                  text: "تعديل ",
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
