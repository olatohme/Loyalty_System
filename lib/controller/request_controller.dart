import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/model/Request_model.dart';
import 'package:loyalty/userinformation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestController extends GetxController {
  var fname = "";
  var lname = "";
  var email = "";
  var phone = "";
  var password = "";
  var confirm = "";
  var details = "";
  var messge = "";
  var fname_edit = "";
  var phone_edit = "";
  var token1 = '';
  int status_addrequest = 0;
  int status_newrequest = 0;
  int status_editrequest = 0;
   int status_deleterequest = 0;
  int status_getrequest = 0;
  RxBool isLoading = true.obs;
 RxBool isDialogOpen = false.obs;
  File? image;
  RxBool updat = false.obs;
  RxString imagepath = ''.obs;
  SharedPreferences? _prefs;
  // List<RequestModel> l = [];
  RequestModel? requeest;
  String? token_request;
  void onInit() {
    super.onInit();

    //  _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    token_request = _prefs!.getString('token');
  }

  String? get token => token_request;

  Future<void> saveToken(String token) async {
    token_request = token;
    await _prefs!.setString('token', token);
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

  Future Request(BuildContext context) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/requestPartners'));
      request.fields.addAll({
        'fname': fname,
        'lname': lname,
        'email': email,
        'phone_number': phone,
        'password': password,
        'password_confirmation': confirm,
        'details': details,
      });
      request.files.add(
          await http.MultipartFile.fromPath('image', image!.path.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_addrequest = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));
        print(jsonDecode(responseBody)['token']);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");
            EasyLoading.showSuccess(res['message']);
      //  toast(context, jsonDecode(responseBody)['message']);
        token1 = jsonDecode(responseBody)['token'];
        saveToken(token1);

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
        update();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }

  Future newRequest(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Userinformation.domain}/api/requestPartners'));
      request.fields.addAll({
        'fname': fname,
        'lname': lname,
        'email': email,
        'phone_number': phone,
        'password': password,
        'password_confirmation': confirm,
        'details': details,
      });
      request.files.add(
          await http.MultipartFile.fromPath('image', image!.path.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_newrequest = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));
        print(jsonDecode(responseBody)['token']);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
       // toast(context, jsonDecode(responseBody)['message']);
        token1 = jsonDecode(responseBody)['token'];
       // saveToken(token1);

        requeest = await GetRequests(context, token);
        // isLoading(!isLoading.value);
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        // print(token);
        print(res['message']);
        print(response.statusCode);
        print("not okkk");
        print(response.request);
        update();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }
 Future DeleteRequest(BuildContext context,
 String token, int idoffer) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'DELETE', Uri.parse('${Userinformation.domain}/api/requestPartners/${idoffer}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

      status_deleterequest = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
     requeest = await GetRequests(context, token);

        isLoading(!isLoading.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss delete");
        print(response.statusCode);
        print(res);
        //  print(res[1].title);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
       isLoading(!isLoading.value);
        print("nooo delete");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("erroorr");
      EasyLoading.showError(e.toString());
    }
  }
  Future<RequestModel?> GetRequests(BuildContext context, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/myrequests'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_getrequest = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = requestModelFromJson(responseBody);
        print("yesss");
        print(response.statusCode);
        print(res);
        return res;
      } else {
        print(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo");
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      print("errorrr");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

  Future EditRequest(BuildContext context, String token, int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest('POST',
          Uri.parse("${Userinformation.domain}/api/requestPartners/${id}"));
      request.fields.addAll({
        'fname': fname,
        'lname': lname,
        'email': email,
        'phone_number': phone,
        'password': password,
        'password_confirmation': confirm,
        'details': details,
      });
      if (image != null) {
        request.files.add(
            await http.MultipartFile.fromPath('image', image!.path.toString()));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_editrequest = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));
        print(jsonDecode(responseBody)['token']);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);
        token1 = jsonDecode(responseBody)['token'];
        saveToken(token1);
        requeest = await GetRequests(context, token);

        isLoading(!isLoading.value);
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
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }
}
