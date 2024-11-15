import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/model/partner_model.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/userinformation.dart';

class PartnerController extends GetxController {
  final controller = Get.find<HomeController>();
  //var token =AuthController.TokenCustomer ;
  List<PartnerModel> partners = [];
   int status_getpartner = 0;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    print("GetPartnerrrrrrrrrrrrr");
   // partners = await GetPartner();
   // controller.isloading(!controller.isloading.value);

    super.onReady();
  }

  Future<List<PartnerModel>> GetPartner() async {
     try {
    //  print("token is :$token");
    var headers = {
      'Accept': 'application/json',
    };
    var request = http.Request(
        'GET', Uri.parse('${Userinformation.domain}/api/partners'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    //var res = jsonDecode(responseBody);

     var res = partnerModelFromJson(responseBody);
status_getpartner = response.statusCode;
    //json.decode(response.body);
    //jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response);

      print("yesss get partner");
      print(response.statusCode);
      print(res);
      //  print(res[1].title);
      return res;
    } else {
       //EasyLoading.showError(jsonDecode(responseBody)['message']);
      print("nooo");
      print(response.statusCode);

      return [];
      //print(response);
      // print(res);
      // return res;
    }
    } catch (e) {
    print(e);
    print("erroorr");
    return [];
    }
  }
}
