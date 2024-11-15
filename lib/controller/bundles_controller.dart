import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/model/bundles_model.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/userinformation.dart';

class BundlesController extends GetxController {
  List<BundlesModel> l = [];
  int status_bundles = 0;
  //var token =AuthController.TokenCustomer ;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady

    super.onReady();
  }

  Future<List<BundlesModel>> GetBundles(
      BuildContext context) async {
    try {
     // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/bundles'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
       status_bundles = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss");
        print(response.statusCode);
        var res = bundlesModelFromJson(responseBody);
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
