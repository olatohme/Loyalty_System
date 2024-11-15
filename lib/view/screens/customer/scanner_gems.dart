import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/view/widgets/custom_textfield.dart';
import 'package:loyalty/view/widgets/text.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class scanner_gems extends StatefulWidget {
  scanner_gems({Key? key}) : super(key: key);

  @override
  State<scanner_gems> createState() => _scannerState();
}

class _scannerState extends State<scanner_gems> {
  var controller1 = Get.find<Send_Points>();
  var controller2 = Get.find<AuthController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  String? qrText;
  bool isCameraActive = true;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    if (isCameraActive) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('QR Code Scanner')),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_sharp),
                color: black,
                iconSize: 40,
              ),
              SizedBox(
                width: 120,
              ),
              TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  // text:
                  //     "Phone is: ${l.user.phoneNumber.toString()}",
                  text: ": Scanner QR Code ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/scan.png",
                height: 200,
                width: 200,
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      text: " ادخل عدد النقاط ثم قم ",
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      text: "بمسح كود المرسل اليه ",
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ],
              ),
            ],
          ),
          // Padding(
          //       padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
          //       child: CustomTextField(
          //         hintText: 'عدد النقاط',
          //         prefixIcon: Text(""),
          //         obscureText: false,
          //         suffixIcon: Text(""),
          //         validator: (value) {},
          //         hight: 40,
          //         width: MediaQuery.of(context).size.width * 0.60,
          //         keyboardType: TextInputType.number,
          //         onchange: (value) {
          //           controller1.num_points = value;
          //         },
          //       ),
          //     ),
          //   SizedBox(height: 100,),
          Container(
            // هنا يمكنك تعيين ارتفاع وعرض مربع الكاميرا حسب الحاجة
            height: 250,
            width: 250,
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
            ),
          ),

          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: Text(
          //       'Scanned Data: ',
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      if (isCameraActive) {
        setState(() async {
          controller1.number2 = scanData.code;
          isCameraActive = false;
          controller.stopCamera();
          print("number is     : $controller1.number");
          print(scanData.code);
          EasyLoading.show(status: "Loadding..");

          await controller1.sendgems_customer(
              context, controller2.tokencustomer!);
          controller1.isloading_balance(!controller1.isloading_balance.value);
           controller1.isloading_record_g(!controller1.isloading_record_g.value);
          if (controller1.status_gems_cust == 200 ||
              controller1.status_gems_cust == 201) {
            Get.back();
          }
          //print(scanData.code);
        });
      }
    });
  }
}