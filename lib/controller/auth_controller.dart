import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/model/profile_partner_model.dart';

import 'package:loyalty/model/user_model.dart';
import 'package:loyalty/userinformation.dart';
import 'package:loyalty/view/screens/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // ProfileModel? profile;
  // ProfileModelPartner? prof;
  int role = 0;
  String n = "";
  String? TokenCustomer;
  String? TokenPartner;
  int statuscode_cus = 0;
  int statuscode_par = 0;
  int statuscode_reg = 0;
  int statuscode_logout = 0;
  int statuscode_logout_p = 0;
  var Token = "";

  //login partner
  var email = "";
  var password = "";
  //login customer
  var phone = "";
  var customer_pass = "";
//regester
  var fname = "";
  var lname = "";
  var regester_phone = "";
  var regester_pass = "";
  var regester_confirmpass = "";
  var nickname = "";
  // late SharedPreferences localstorage;
  File? image;
  RxBool updat = false.obs;
  RxString imagepath = ''.obs;
  SharedPreferences? _prefs;
  String? tokencustomer;
  String? tokenpartner;

  @override
  void onInit() {
    // _initSharedPreferences();
    super.onInit();
  }

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    tokencustomer = _prefs!.getString('token');
    tokenpartner = _prefs!.getString('token_partner');
  }

  String? get token => tokencustomer;

  Future<void> saveToken(String token) async {
    tokencustomer = token;
    await _prefs!.setString('token', token);
  }

  Future<void> saveToken_partner(String token) async {
    tokencustomer = token;
    await _prefs!.setString('token_partner', token);
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

  // var nameController = "";
  // var emailController = "";
  // var phoneController = "";
  // var passwordController = "";
  // var addresController = "";
  bool isVisibilty = false;
  bool isCheckBox = false;
  var time1 = ''.obs;
  var time2 = ''.obs;
  final RxBool isEmailValid = RxBool(false);
  void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  void validateEmail() {
    if (GetUtils.isEmail(email)) {
      isEmailValid.value = true;
    } else {
      isEmailValid.value = false;
    }
  }

  Future LoginPartner(BuildContext context) async {
    try {
      var response = await http.post(
          Uri.parse("${Userinformation.domain}/api/loginByEmail"),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'email': email,
            'password': password
          });
      print("${Userinformation.domain}/api/loginByEmail");
      var res = jsonDecode(response.body);
      statuscode_par = response.statusCode;
      if (response.statusCode == 201) {
        TokenPartner = res['token'];
        // saveToken_partner(TokenPartner);
        Securestorage storage = Securestorage();
        storage.save('p_token', TokenPartner!);
        print("$TokenPartner");
        print(response.statusCode);
      } else {
        EasyLoading.showError(res['message']);
        //toast(context, res['message']);
        print(res['message']);
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

  Future LoginCustumer() async {
    try {
      var response = await http.post(
          Uri.parse("${Userinformation.domain}/api/loginByNumber"),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'phone_number': phone,
            'password': customer_pass
          });
      print("${Userinformation.domain}/api/loginByNumber");
      var res = jsonDecode(response.body);
      statuscode_cus = response.statusCode;
      //  var res = userModelFromJson(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        TokenCustomer = res['token'];
        Securestorage storage = Securestorage();
        storage.save('c_token', TokenCustomer!);
        // var Token = res['token'];
        // saveToken(TokenCustomer);
        print("$Token");
        print(response.statusCode);
      } else {
        print(response.statusCode);
        EasyLoading.showError(res['message']);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

  Future Register() async {
    try {
      var headers = {
        'Accept': 'application/json',
      };

      var request = http.MultipartRequest('POST',
          Uri.parse('${Userinformation.domain}/api/customers/register'));
      request.fields.addAll({
        'fname': fname,
        'lname': lname,
        'phone_number': regester_phone,
        'password': regester_pass,
        'password_confirmation': regester_confirmpass,
        'nickName': nickname,
      });
      request.files.add(
          await http.MultipartFile.fromPath('image', image!.path.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      statuscode_reg = response.statusCode;
      print(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(responseBody);
        print(data['token']);
        Token = data['token'];
        print("token register is  $Token");
        print(response.statusCode);
        print("okkkkk");
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk");
        print(response.request);
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //update();
      }
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString());
    }
  }
  // }

  Future Logout(String token) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

      statuscode_logout = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final storage = FlutterSecureStorage();
        storage.delete(key: 'c_token');
        print(response);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss logout");
        print(response.statusCode);
        print(res);
        Get.offNamed('/welcome');
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

  Future Logout_p(String token) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

      statuscode_logout_p = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final storage = FlutterSecureStorage();
        storage.delete(key: 'p_token');
        print(response);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss logout");
        print(response.statusCode);
        print(res);
         Get.offNamed('/welcome');
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

  Future ispending(String token) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${Userinformation.domain}/api/myRole'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

//statuscode_role = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        role = res['role_id'];
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
}
