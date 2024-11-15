import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/model/convertbonus_model.dart';
import 'package:loyalty/model/convertcash_model.dart';
import 'package:loyalty/model/transfergems_model.dart';
import 'package:loyalty/model/transferpoint_model.dart';
import 'package:loyalty/userinformation.dart';

class Send_Points extends GetxController {
  var controller = Get.find<ProfileController>();

  String card_num = '';
  String card_key = '';
  String gems_cash = "";
  String num_points = "";
  String number = "";
  String num_points_partner = "";
  String number_partner = "";
  String num_gems = "";
  String number2 = "";
  String num_gems_partner = "";
  String number2_partner = "";
  String num_points_convert = "";
  String inputText = '';
  RxBool isloading_balance = false.obs;
  RxBool isloading_record = true.obs;
  RxBool isloading_record_g = true.obs;
  RxBool isloading_record_c = true.obs;
  RxBool isloading_record_cg = true.obs;
  RxBool isDialogOpen = false.obs;
  int status_convert = 0;
  int status_convert_cash = 0;
  int status_point_cust = 0;
  int status_point_part = 0;
  int status_gems_cust = 0;
  int status_gems_part = 0;
  int status_transfer = 0;
  int status_transfer_g = 0;
  int status_buygems = 0;
  TransferPointModel? transfer;
  ConvertGemsModel? convert;
  ConvertcashModel? convert_cash;
  TransferGemsModel? transfer_gems;
  Future sendpoint_partner(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Userinformation.domain}/api/BonusTransfer?phone_number=${number_partner}&value=${num_points_partner}&type=P2C'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_point_part = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss");
        print(response.statusCode);
        var res = jsonDecode(responseBody);
        controller.prof = await controller.ShowProfile_partner(token);
        controller.isloading_p(!controller.isloading_p.value);
        transfer = await GetTransferpoint(token);
        print("lenght is : ${transfer!.bonusTransferSender!.length}");
        isloading_record(!isloading_record.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        //
        //return res;
      } else {
        print(response.statusCode);
        print("noo");

        EasyLoading.showError(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  Future sendpoint_customer(BuildContext context, String token) async {
    try {
      print("numbe is  ${number}");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Userinformation.domain}/api/BonusTransfer?phone_number=${number}&value=${num_points}&type=C2C'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_point_cust = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss");
        print(response.statusCode);
        var res = jsonDecode(responseBody);
        controller.profile = await controller.ShowProfile(token);
        controller.isloading(!controller.isloading.value);
        transfer = await GetTransferpoint(token);
        print("lenght is : ${transfer!.bonusTransferSender!.length}");
        isloading_record(!isloading_record.value);
        //isloading_balance(!isloading_balance.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);

        //
        //return res;
      } else {
        print(response.statusCode);
        print("noo");
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  Future sendgems_partner(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Userinformation.domain}/api/GemsTransfer?phone_number=${number2_partner}&value=${num_gems_partner}&type=P2C'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_gems_part = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss");
        print(response.statusCode);
        controller.prof = await controller.ShowProfile_partner(token);
        controller.isloading_p(!controller.isloading_p.value);
        transfer_gems = await GetTransfergems(token);
        isloading_record_g(!isloading_record_g.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        var res = jsonDecode(responseBody);
        //
        //return res;
      } else {
        print(response.statusCode);
        print("noo");
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  Future sendgems_customer(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Userinformation.domain}/api/GemsTransfer?phone_number=${number2}&value=${num_gems}&type=C2C'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_gems_cust = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss");
        print(response.statusCode);
        var res = jsonDecode(responseBody);
        controller.profile = await controller.ShowProfile(token);
        controller.isloading(!controller.isloading.value);
        transfer_gems = await GetTransfergems(token);
        isloading_record_g(!isloading_record_g.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        //
        //return res;
      } else {
        print(response.statusCode);
        print("noo");
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  Future<TransferPointModel?> GetTransferpoint(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/mybtransfers'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_transfer = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get transfer");
        print(response.statusCode);

        var res = transferPointModelFromJson(responseBody);
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

  Future<TransferGemsModel?> GetTransfergems(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/mygtransfers'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_transfer_g = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get gemstransfer");
        print(response.statusCode);

        var res = transferGemsModelFromJson(responseBody);
        //  print("ooooooooooooooo");
        print(res);

        //
        //profile = res;
        return res;
      } else {
        // EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ConvertGemsModel?> GetConvertgems(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/B2G/mine'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_transfer_g = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get convert");
        print(response.statusCode);

        var res = convertGemsModelFromJson(responseBody);
        //  print("ooooooooooooooo");
        print(res);

        //
        //profile = res;
        return res;
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo convert");
      }
    } catch (e) {
      print(e);
    }
  }

  Future ConvertBonus(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/B2G'));
      request.fields.addAll({
        'bonus': inputText,
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      status_convert = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        //  print(await response.stream.bytesToString());
        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("yess convert");
        controller.profile = await controller.ShowProfile(token);
        controller.isloading(!controller.isloading.value);
        convert = await GetConvertgems(token);
        // print("lenght is : ${transfer!.bonusTransferSender!.length}");
        isloading_record_c(!isloading_record_c.value);
        // controller.partners = await controller.GetPartner();
        // controller1.isloading(!controller1.isloading.value);

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
        print("not okkk convert");
        //print(response.request);
        // update();
      }
    } catch (e) {
      print("errrorrr");
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  Future buy_gems(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/G2C'));
      request.fields.addAll(
          {'gems': gems_cash, 'card_number': card_num, 'secret_key': card_key});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_buygems = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));
        print(jsonDecode(responseBody)['token']);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");
        EasyLoading.showSuccess(res['message']);
        controller.profile = await controller.ShowProfile(token);
        controller.isloading(!controller.isloading.value);
        convert_cash = await GetConvertcash(token);
        // print("lenght is : ${transfer!.bonusTransferSender!.length}");
        isloading_record_cg(!isloading_record_cg.value);
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
  Future<ConvertcashModel?> GetConvertcash(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/G2C/mine'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_convert_cash = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get convert_g");
        print(response.statusCode);

        var res = convertcashModelFromJson(responseBody);
        //  print("ooooooooooooooo");
        print(res);

        //
        //profile = res;
        return res;
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo convert_g");
      }
    } catch (e) {
      print(e);
    }
  }
 
}
