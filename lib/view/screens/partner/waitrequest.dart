import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/auth_controller.dart';
import 'package:loyalty/controller/request_controller.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';

class WaitRequest extends StatelessWidget {
  WaitRequest({Key? key}) : super(key: key);
  final controller = Get.find<RequestController>();
  final controller1 = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(200),
                        ),
                        color: kPrimaryColor)),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        text: 'انتظر حتى يتم الموافقة على ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        text: 'طلبك او يتم رفضه ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                TextUtils(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    text: 'Accept',
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  width: 140,
                ),
                TextUtils(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    text: 'Reject',
                    color: Colors.black,
                    underLine: TextDecoration.none),
              ],
            ),
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/images/wait1.png',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Button(
                onPressed: () async {
                  // if(controller.token_request==null)
                  // print(controller.token1);
                  print("token   1:${controller1.TokenPartner}");
                  print("token   2:${controller1.tokenpartner}");
                  controller.requeest = await controller.GetRequests(
                      context, controller1.TokenPartner!);
                  controller.isLoading(!controller.isLoading.value);
                  if(controller.status_getrequest==200||controller.status_getrequest==201)
                   Get.toNamed(
                    '/requests',
                  );
                  // await controller.GetRequests(controller1.TokenPartner);
                },
                text: "عرض طلبات الاشتراك ",
                hight: 50,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Button(
                onPressed: () async {
                  // if(controller.token_request==null)
                  // print(controller.token1);
                  print("token   1:${controller1.TokenPartner}");
                  print("token   2:${controller1.tokenpartner}");
                  print(controller.requeest!.requests.length);
                  // controller.request = await controller.GetRequests(
                  //     context, controller1.tokenpartner!);
                  if (controller.requeest!.requests.length > 0) if (controller
                          .requeest!
                          .requests[controller.requeest!.requests.length - 1]
                          .status ==
                      0) {
                    print(">0000000");
                    Get.toNamed('/newrequest');
                  }
                  if (controller.requeest!.requests.length == 0) {
                    print("===0000000");
                    Get.toNamed('/request');
                  } else
                    EasyLoading.showInfo(
                        "Your request is being processed, please wait");
                  // await controller.GetRequests(controller1.TokenPartner);
                },
                text: "تقديم طلب اشتراك جديد",
                hight: 50,
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
