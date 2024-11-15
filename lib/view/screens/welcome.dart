import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/bundles_controller.dart';
import 'package:loyalty/controller/home_controller.dart';
import 'package:loyalty/controller/offer_controller.dart';
import 'package:loyalty/controller/partner_controller.dart';
import 'package:loyalty/controller/profile_controller.dart';
import 'package:loyalty/controller/request_controller.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/view/screens/storage.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

class welcome extends StatelessWidget {
  welcome({Key? key}) : super(key: key);
  var controller1 = Get.find<AuthController>();
  var controller5 = Get.find<PartnerController>();
  var controller4 = Get.find<OfferController>();

  final controller6 = Get.find<HomeController>();
  var controller2 = Get.find<BundlesController>();
 var controller7 = Get.find<RequestController>();
  var controller3 = Get.find<ProfileController>();
  var controller = Get.find<Send_Points>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(children: [
        // Row(children: [
        //   Container(
        //       width: MediaQuery.of(context).size.width * 0.35,
        //       height: MediaQuery.of(context).size.height * 0.2,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(0),
        //             topRight: Radius.circular(0),
        //             bottomLeft: Radius.circular(0),
        //             bottomRight: Radius.circular(200),
        //           ),
        //           color: kPrimaryColor)),
        //   SizedBox(
        //     width: 20,
        //   ),
        // ]),
        //  Container(
        //         decoration: BoxDecoration(
        //           color: white,
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(30),
        //             topRight: Radius.circular(30),
        //             bottomLeft: Radius.circular(30),
        //             bottomRight: Radius.circular(30),
        //           ),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Color(0x7f000000),
        //               blurRadius: 4,
        //               // spreadRadius: 4,
        //               offset: Offset(0, 4),
        //             ),
        //           ],
        //         ),

        //         width: MediaQuery.of(context).size.width * 0.80,
        //         height: MediaQuery.of(context).size.height * 0.25,
        //         //color: Colors.grey,
        //         margin: EdgeInsets.all(10),
        //
        SizedBox(
          height: 20,
        ),
        TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            text: 'مرحبا بكم في تطبيق نقاط الولاء ',
            color: Colors.black,
            underLine: TextDecoration.none),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x7f000000),
                blurRadius: 4,
                // spreadRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),

          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.25,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),

          child: Image.asset(
            "assets/images/welc.png",
            // height: 100,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Button(
          onPressed: () async {
            Securestorage storage = Securestorage();
// final storage1 = FlutterSecureStorage();
//         storage1.delete(key: 'c_token');
            controller1.TokenCustomer = (await storage.read('c_token'));
            if (controller1.TokenCustomer == null) {
              //controller3.isloading(!controller3.isloading.value);
              controller5.partners = await controller5.GetPartner();
              if (!controller3.isloading.isTrue) {
                controller3.isloading.value = false;
              }

              controller4.isloading(!controller4.isloading.value);
              Get.offNamed('/main');
            } else {
              EasyLoading.show(status: "please wait...");
              controller3.isloading(!controller3.isloading.value);
              controller5.partners = await controller5.GetPartner();
              controller3.isloading(!controller3.isloading.value);
              controller4.isloading(!controller4.isloading.value);

              controller4.offers =
                  await controller4.Getmyoffers(controller1.TokenCustomer!);
              controller3.profile =
                  await controller3.ShowProfile(controller1.TokenCustomer!);
              controller.transfer =
                  await controller.GetTransferpoint(controller1.TokenCustomer!);
              controller.transfer_gems =
                  await controller.GetTransfergems(controller1.TokenCustomer!);
              controller.convert =
                  await controller.GetConvertgems(controller1.TokenCustomer!);
              controller.convert_cash =
                  await controller.GetConvertcash(controller1.TokenCustomer!);

              EasyLoading.showSuccess('welcome back !');
              Get.toNamed('/main');
            }
            // print(controller6.isloading.value);
            //        // controller3.isloading(!controller3.isloading.value);
            //          print(controller6.isloading.value);
            //controller3.isloading(!controller3.isloading.value);
            //  controller4.isloading(!controller4.isloading.value);

            // if (controller1.tokencustomer != null) {
            //   //  controller1.profile = await controller3.ShowProfile(
            //   // controller1.tokencustomer!);
            //   //await controller3.ShowProfile(controller1.tokencustomer!);

            //   //   print(controller.TokenCustomer);

            // controller4.offers = await controller4.Getmyoffers(
            //     controller1.tokencustomer!);
            // Get.offNamed('/main', arguments: controller4.offers);
            //Get.offNamed('/main');
            //  } else
          },
          text: 'زبون',
          hight: 50,
          width: 200,
        ),
        SizedBox(
          height: 70,
        ),
        // Divider(
        //       color: Colors.black,
        //       height: 1,
        //     ),
        Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x7f000000),
                blurRadius: 4,
                // spreadRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),

          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.25,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),

          child: Image.asset(
            "assets/images/wel1.png",
          ),
        ),

        SizedBox(
          height: 20,
        ),
        Button(
          onPressed: () async {
            // if (controller1.tokenpartner != null) {
            //   controller2.l = await controller2.GetBundles(
            //       context, controller1.tokenpartner!);
            //   Get.offNamed('/homeparther', arguments: controller2.l);
            // } else
            //     final storage = FlutterSecureStorage();
            // storage.delete(key: 'p_token');
            Securestorage storage1 = Securestorage();

            controller1.TokenPartner = (await storage1.read('p_token'));
            if (controller1.TokenPartner == null) {
              controller2.l = await controller2.GetBundles(context);
              Get.offNamed(
                '/homeparther',
              );
              //controller3.isloading(!controller3.isloading.value);
            } else {
              await controller1.ispending(controller1.TokenPartner!);
              if(controller1.role==2){
                EasyLoading.show(status: "please wait...");
              controller2.l = await controller2.GetBundles(context);

              controller3.prof = await controller3.ShowProfile_partner(
                  controller1.TokenPartner!);
              controller.transfer =
                  await controller.GetTransferpoint(controller1.TokenPartner!);
              controller.transfer_gems =
                  await controller.GetTransfergems(controller1.TokenPartner!);
              EasyLoading.showSuccess('welcome back !');

              Get.offNamed(
                '/homeparther',
              );
              }
               else if(controller1.role==4){
                EasyLoading.show(status: "please waiting...");
                 // EasyLoading.showSuccess('welcome back !');
                controller7.requeest = await controller7.GetRequests(
                          context, controller1.TokenPartner!);
                    EasyLoading.showSuccess('welcome back !');
                        Get.offNamed('/wait');
              // Get.offNamed('/request');

               }
            }
            // print(token_p);
            //  Get.offNamed('/request');
          },
          text: 'شريك',
          hight: 50,
          width: 200,
        ),
      ]),
    )));
  }
}
