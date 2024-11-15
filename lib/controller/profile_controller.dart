import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/model/profile_partner_model.dart';
import 'package:loyalty/userinformation.dart';

class ProfileController extends GetxController {
  String fname = "";
  String lname = "";
  String email = "";
  var regester_phone = "";
  var regester_pass = "";
  var regester_confirmpass = "";
  var nickname = "";
  //========================
  var fname_p = "";
  var lname_p = "";
  var email_p = "";
  var phone = "";
  var password = "";
  var confirm = "";
  var details = "";
  RxBool isloading = true.obs;
  RxBool isloading_p = true.obs;
  int status_show_p_cust = 0;
  int status_show_p_part = 0;
  int status_edit_p_cust = 0;
  int status_edit_p_part = 0;
  ProfileModel? profile;
  ProfileModelPartner? prof;

  File? image;
  File? image2;
  RxString imagepath = ''.obs;
  RxString imagepath2 = ''.obs;
  RxBool updat = false.obs;
  RxBool updat2 = false.obs;
  //var token =AuthController.TokenCustomer ;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady

    super.onReady();
  }

  Future getImage() async {
    // final ImagePicker picker = ImagePicker();
    final picker = ImagePicker();
    final imagee = await picker.pickImage(source: ImageSource.gallery);
    if (imagee != null) {
      image = File(imagee.path);
      imagepath.value = imagee.path.toString();
      updat(!updat.value);
      update();
    } else {
      print("no image");

      // Get.snackbar('error', 'No Image Selected',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: red,
      //     colorText: white);
    }
  }

  Future getImage_partner() async {
    // final ImagePicker picker = ImagePicker();
    final picker = ImagePicker();
    final imagee = await picker.pickImage(source: ImageSource.gallery);
    if (imagee != null) {
      image = File(imagee.path);
      imagepath.value = imagee.path.toString();
      updat2(!updat2.value);
      update();
    } else {
      print("no image");

      // Get.snackbar('error', 'No Image Selected',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: red,
      //     colorText: white);
    }
  }

  Future<ProfileModel?> ShowProfile(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/customers/profile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_show_p_cust = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss showprofile");
        print(response.statusCode);

        var res = profileModelFromJson(responseBody);
        //  print("ooooooooooooooo");
        print(res);

        //
        //profile = res;
        return res;
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo");
      }
    } catch (e) {
      print(e);
    }
  }

  Future EditProfile(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse("${Userinformation.domain}/api/customers/update"));
      request.fields.addAll({
        'fname': fname,
        'lname': lname,
        'email': email,
        'phone_number': regester_phone,
        'password': regester_pass,
        'password_confirmation': regester_confirmpass,
        'nickName': nickname,
      });
      if (image != null) {
        request.files.add(
            await http.MultipartFile.fromPath('image', image!.path.toString()));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_edit_p_cust = response.statusCode;

      // print("${Userinformation.domain}/api/customers/update");
      var res = jsonDecode(responseBody);
      status_edit_p_cust = response.statusCode;
      //  var res = userModelFromJson(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        EasyLoading.showSuccess(res['message']);
        profile = await ShowProfile(token);
        isloading(!isloading.value);
        print("okkk");
      } else {
        // token = res['token'];
        // print('$token');
        //  toast(context, "error");
        print(res['message']);
        EasyLoading.showError(res['message']);
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
    }
  }

  Future<ProfileModelPartner?> ShowProfile_partner(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/partners/profile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_show_p_part = response.statusCode;
      if (response.statusCode == 200) {
        print(response);
        print(responseBody);
        print("yesss prof");
        print(response.statusCode);

        var res = profileModelPartnerFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo prof");
      }
    } catch (e) {
      print(e);
    }
  }

  Future EditProfile_partner(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse("${Userinformation.domain}/api/partners/update"));
      request.fields.addAll({
        'fname': fname_p,
        'lname': lname_p,
        'email': email_p,
        'phone_number': phone,
        'password': password,
        'password_confirmation': confirm,
        'details': details,
      });
      if (image != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'image', image!.path.toString()));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      // status_edit_p_cust = response.statusCode;
      // print("${Userinformation.domain}/api/customers/update");
      var res = jsonDecode(responseBody);
      status_edit_p_part = response.statusCode;
      //  var res = userModelFromJson(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        EasyLoading.showSuccess(res['message']);
        prof = await ShowProfile_partner(token);
        isloading_p(!isloading_p.value);
        print("okkk");
      } else {
        // token = res['token'];
        // print('$token');
        //  toast(context, "error");
        print(res['message']);
        EasyLoading.showError(res['message']);
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
    }
    // try {
    //   print("token is :$token");
    //   // var headers = ;
    //   var response = await http
    //       .get(Uri.parse('${Userinformation.domain}/api/customers/profile'),
    //       headers:{

    //     'Authorization': 'Bearer $token',
    //     'Accept': 'application/json',
    //     'Connection': 'keep-alive',
    //     'Accept-Encoding': 'gzip, deflate, br',
    //     'Host': '<calculated when request is sent>',
    //     'User-Agent': 'PostmanRuntime/7.29.2',
    //   } );
    //   //response.headers.addAll(headers);
    //   //  var res = profileModelFromJson(response.body);
    //   //var res =
    //   // //json.decode(response.body);
    //   // jsonDecode(response.body);
    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     // print(response);

    //     print("yesss");
    //     print(response.statusCode);
    //     //  print(res);
    //     //  print(res[1].title);
    //     // return res;
    //   } else {
    //     print("nooo");
    //     print(response.statusCode);

    //     //print(response);
    //     // print(res);
    //     // return res;
    //   }
    // } catch (e) {
    //   print(e);
    //   print("erroorr");
    // }
  }
}
