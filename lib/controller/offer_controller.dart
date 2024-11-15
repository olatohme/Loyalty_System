import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/model/myoffers_model.dart';

import '../userinformation.dart';

class OfferController extends GetxController {
  final controller = Get.find<PartnerController>();
  var controller2 = Get.put(ProfileController());
  var controller1 = Get.find<HomeController>();
  int status_addoffer = 0;
  int status_getoffer = 0;
  int status_buyoffer = 0;
  int status_deleteoffer = 0;
  String token_sell = "";
  var isloading = true.obs;
  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    // print("${controller.tokencustomer}");
    //await Getmyoffers(controller.tokencustomer!);
  }

  List<MyoffersModel> offers = [];
  RxBool isDialogOpen = false.obs;
  String name = '';
  var quantity = '';
  var valueInBonus = '';
  var valueInGems = '';
  var id = '';
  File? image;
  RxBool updat = false.obs;
  RxString imagepath = ''.obs;
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

  Future AddOffer(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/offers'));
      request.fields.addAll({
        'name': name,
        'quantity': quantity,
        'valueInBonus': valueInBonus,
        "valueInGems": valueInGems,
        'segmentation_id': id,
      });
      request.files.add(
          await http.MultipartFile.fromPath('image', image!.path.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      status_addoffer = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        //  print(await response.stream.bytesToString());
        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");

        controller.partners = await controller.GetPartner();
        controller1.isloading(!controller1.isloading.value);
        controller2.prof = await controller2.ShowProfile_partner(token);
        isloading(!isloading.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);

        // toast(context, jsonDecode(responseBody)['message']);

        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
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

  Future EditOffer(String token, int idoffer) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/offers/${idoffer}'));
      request.fields.addAll({
        'name': name,
        'quantity': quantity,
        'valueInBonus': valueInBonus,
        "valueInGems": valueInGems,
        'segmentation_id': id,
      });
      if (image != null)
        request.files.add(
            await http.MultipartFile.fromPath('image', image!.path.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      status_addoffer = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        //  print(await response.stream.bytesToString());
        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk edit offer");

        controller.partners = await controller.GetPartner();
        controller1.isloading(!controller1.isloading.value);
        controller2.prof = await controller2.ShowProfile_partner(token);
        isloading(!isloading.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);

        // toast(context, jsonDecode(responseBody)['message']);

        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);

        print(res['message']);
        print(response.statusCode);
        print("not okkk");
        print(response.request);
      }
    } catch (e) {
      print("errrorrr");
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  Future DeleteOffer(String token, int idoffer) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('DELETE',
          Uri.parse('${Userinformation.domain}/api/offers/${idoffer}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

      status_deleteoffer = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        controller.partners = await controller.GetPartner();
        controller1.isloading(!controller1.isloading.value);
        controller2.prof = await controller2.ShowProfile_partner(token);
        isloading(!isloading.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss delete");
        print(response.statusCode);
        print(res);
        //  print(res[1].title);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        isloading(!isloading.value);
        print("nooo delete");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("erroorr");
      EasyLoading.showError(e.toString());
    }
  }

  Future SellOffer(String token, int idoffer) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Userinformation.domain}/api/offers/sellOffer/${idoffer}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

      status_buyoffer = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        controller2.profile = await controller2.ShowProfile(token);
        controller2.isloading(!controller2.isloading.value);
        print(response);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss buy");
        print(response.statusCode);
        print(res);
        //  print(res[1].title);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        print("nooo");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("erroorr");
      EasyLoading.showError(e.toString());
    }
  }

  Future<List<MyoffersModel>> Getmyoffers(String token) async {
    try {
      //print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/myoffers'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_getoffer = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get offers");
        print(response.statusCode);
        var res = myoffersModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo");
        // EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
