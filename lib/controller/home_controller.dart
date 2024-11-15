import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/view/screens/partner/details_partner.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

import '../userinformation.dart';

class HomeController extends GetxController {
  List<ScreenHiddenDrawer> page = [];
  RxBool isCollapsed = true.obs;
  RxBool isToken = true.obs;
  String card_num = '';
  String card_key = '';
  int status_buybundl = 0;
  RxBool isDialogOpen = false.obs;
  RxBool isDialogOpenauth = false.obs;
  RxBool isloading = true.obs;
  RxBool isloading_o = true.obs;
   RxBool isloading_p = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print(isloading.value);
    super.onReady();
  }

  Future buy_bundle(BuildContext context, String token, int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/buyBundle'));
      request.fields.addAll({
        'bundle_id': id.toString(),
        'card_number': card_num,
        'secret_key': card_key
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_buybundl = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));
        print(jsonDecode(responseBody)['token']);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");
        EasyLoading.showSuccess(res['message']);
        //  toast(context, jsonDecode(responseBody)['message']);

        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);
        // print(token);
        print(res['message']);
        print(response.statusCode);
        print("not okkk");
        print(response.request);
        // update();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }

  void openDialog(BuildContext context) {
    isDialogOpenauth.value = true;
    Get.dialog(AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
        title: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: "",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: Container(
          height: 300,
          width: 100,
          child: Column(
            children: [
              Row(
                children: [
                  // SizedBox(
                  //   width: 5,
                  // ),
                  IconButton(
                      onPressed: () {
                        //  print("Email is ${controller1.profile!.user.email}");

                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: black,
                        size: 26,
                      )),
                ],
              ),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: " عليك القيام بتسجيل الدخول ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: "قبل القيام بهذا الاجراء ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 30,
              ),
              Button(
                onPressed: () async {
                  //controller.addprod2();

                  Get.offNamed('/logincustomer');
                },
                text: " تسجيل دخول",
                hight: 50,
                width: 200,
              ),
              //       GestureDetector(
              //   onTap: () {

              //   },
              //   child: const Center(
              //     child: Text(
              //       'الانتقال الى صفحة تسجيل الدخول',
              //       style: TextStyle(
              //           fontFamily: 'Acaslon Regular',
              //           fontSize: 15,
              //           color: black,
              //           decoration: TextDecoration.underline),
              //     ),
              //   ),
              // ),
            ],
          ),
        )));
  }

  void openDialog_p(BuildContext context) {
    isDialogOpenauth.value = true;
    Get.dialog(AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
        title: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: "",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: Container(
          height: 300,
          width: 100,
          child: Column(
            children: [
              Row(
                children: [
                  // SizedBox(
                  //   width: 5,
                  // ),
                  IconButton(
                      onPressed: () {
                        //  print("Email is ${controller1.profile!.user.email}");

                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: black,
                        size: 26,
                      )),
                ],
              ),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: "عليك القيام بتقديم طلب انضمام وتسجيل الدخول",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  text: "قبل القيام بهذا الاجراء ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 30,
              ),
              Button(
                onPressed: () async {
                  //controller.addprod2();

                  Get.offNamed('/request');
                },
                text: "  تقديم طلب",
                hight: 50,
                width: 200,
              ),
              //       GestureDetector(
              //   onTap: () {

              //   },
              //   child: const Center(
              //     child: Text(
              //       'الانتقال الى صفحة تسجيل الدخول',
              //       style: TextStyle(
              //           fontFamily: 'Acaslon Regular',
              //           fontSize: 15,
              //           color: black,
              //           decoration: TextDecoration.underline),
              //     ),
              //   ),
              // ),
            ],
          ),
        )));
  }
}
