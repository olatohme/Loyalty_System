import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/controller/sendpoint_controller.dart';
import 'package:loyalty/view/widgets/card_subscripe.dart';
import 'package:loyalty/view/widgets/text.dart';

class page_convert extends StatelessWidget {
  page_convert({Key? key}) : super(key: key);
  var controller5 = Get.find<Send_Points>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 40),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.navigate_before),
                    iconSize: 40,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 70,
                  ),

                  TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    text: "سجل تحويل النقاط الى جواهر   ",
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // TextUtils(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.normal,
                  //   text: " المؤقتة المرسلة",
                  //   color: Colors.white,
                  //   underLine: TextDecoration.none,
                  // ),

                  //      SizedBox(width: 50,),
                  //  IconButton(
                  //   onPressed: (){
                  //       Get.toNamed('/addproduct');
                  //   },
                  //    icon: Icon(Icons.add_circle_outlined,size: 60,
                  //    color: white,))
                ],
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            //   child: SearchFormText(text: 'Search With Products',),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .85,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: SingleChildScrollView(
                child: Obx(() {
                  if (controller5.isloading_record_c.isTrue) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      controller5.convert!.b2Gs.length == 0
                          ? controller5.status_convert == 200 ||
                                  controller5.status_convert == 201
                              ? SizedBox(
                                  height: 400,
                                  child: Center(
                                    child: TextUtils(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        text: "لا يوجد عمليات تحويل   ",
                                        // text: "name is: Adidas",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ),
                                )
                              : SizedBox(
                                  height: 400,
                                  child: Center(
                                    child: TextUtils(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        text: "Server error",
                                        // text: "name is: Adidas",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                  ))
                          : SizedBox(
                              height: 600,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Card(
                                        elevation: 30,
                                        shadowColor:
                                            kPrimaryColor.withOpacity(0.2),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextUtils(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                text:
                                                    "تم تحويل   ${controller5.convert!.b2Gs[index].bonus} نقطة",
                                                // text: "name is: Adidas",
                                                color: Colors.black,
                                                underLine: TextDecoration.none),
                                            TextUtils(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                text:
                                                    " الى ${controller5.convert!.b2Gs[index].gems} جوهرة",
                                                // text: "name is: Adidas",
                                                color: Colors.black,
                                                underLine: TextDecoration.none),
                                            TextUtils(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                text:
                                                    "${controller5.convert!.b2Gs[index].createdAt}",
                                                // text: "name is: Adidas",
                                                color: Colors.black,
                                                underLine: TextDecoration.none),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: controller5.convert!.b2Gs.length),
                            ),
                    ],
                  );
                }),
              ),
            ),
          ]),
        ),
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     body: Center(
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               IconButton(
    //                 onPressed: () {
    //                   // print(l.requests[0].id);
    //                   // print(l.requests[0].userId);
    //                   // print(l.requests[0].status);
    //                   // print(l.requests[0].createdAt);
    //                   // controller.isLoading(!controller.isLoading.value);
    //                   Get.back();
    //                 },
    //                 icon: Icon(Icons.arrow_back_sharp),
    //                 color: black,
    //                 iconSize: 40,
    //               ),
    //               SizedBox(
    //                 width: 150,
    //               ),
    //               TextUtils(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.normal,
    //                   // text:
    //                   //     "Phone is: ${l.user.phoneNumber.toString()}",
    //                   text: ":  سجل النقاط المؤقتة المرسلة",
    //                   color: Colors.black,
    //                   underLine: TextDecoration.none),
    //             ],
    //           ),
    //           SizedBox(height: 20),
    //           // Obx(() {
    //           //   if (controller.isLoading.isTrue) {
    //           //     return Center(
    //           //       child: CircularProgressIndicator(),
    //           //     );
    //           //   }
    //           //   return
    //          SizedBox(height: 30,),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height *0.8,
    //             child: ListView.separated(
    //               itemBuilder: (context, index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.only(left: 30,right: 30),
    //                   child: Card(
    //                     elevation: 30,
    //                     shadowColor: Colors.grey.shade100,
    //                     child:  Column(
    //                       children: [
    //                         TextUtils(
    //               fontSize: 18,
    //               fontWeight: FontWeight.normal,
    //               text:
    //                "waleed tohme تم ارسال 200 نقطة الى ",
    //               // text: "name is: Adidas",
    //               color: Colors.black,
    //               underLine: TextDecoration.none),
    //                TextUtils(
    //               fontSize: 18,
    //               fontWeight: FontWeight.normal,
    //               text:
    //                "2/7/2023 5:18",
    //               // text: "name is: Adidas",
    //               color: Colors.black,
    //               underLine: TextDecoration.none),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //                 //cardsend(index);
    //               },
    //               separatorBuilder: (context, index) => const SizedBox(
    //                 height: 10,
    //               ),
    //               itemCount:5
    //               // controller5.transfer!.bonusTransferSender!.length,
    //               //controller.requeest!.requests.length,
    //             ),
    //           ),
    //           //  TextUtils(
    //           //         fontSize: 20,
    //           //         fontWeight: FontWeight.normal,

    //           //         text: ": النقاط المؤقتة المستلمة",
    //           //         color: Colors.black,
    //           //         underLine: TextDecoration.none),
    //           // SizedBox(
    //           //   height: MediaQuery.of(context).size.height * 0.4,
    //           //   child: ListView.separated(
    //           //     itemBuilder: (context, index1) {
    //           //       return cardreseve(index1);
    //           //     },
    //           //     separatorBuilder: (context, index1) => const SizedBox(
    //           //       height: 20,
    //           //     ),
    //           //     itemCount:
    //           //         controller5.transfer!.bonusTransferReceiver!.length,
    //           //     //controller.requeest!.requests.length,
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget cardsend(int index) {
    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  text:
                      "تم تحويل   ${controller5.convert!.b2Gs[index].bonus} نقطة",
                  // text: "name is: Adidas",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  text: " الى ${controller5.convert!.b2Gs[index].gems} جوهرة",
                  //  text: "phone is: 0932456789",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  //text: "status is: Pending}",
                  text:
                      " ${controller5.transfer!.bonusTransferSender![index].createdAt}",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 15,
              ),
              // controller.requeest!.requests[index].status == null
              //     ? Button(
              //         onPressed: () async {
              //           print(
              //               " ${controller.requeest!.requests[index].id.toString()}");
              //           //print(" ${[index].id.toString()}");
              //           Get.toNamed('/editrequest',
              //               arguments: controller.requeest!.requests[index].id);
              //         },
              //         text: "تعديل",
              //         hight: 40,
              //         width: 90,
              //       )
              //     : TextUtils(
              //         fontSize: 18,
              //         fontWeight: FontWeight.normal,
              //         //text: "status is: Pending}",
              //         text: "",
              //         color: Colors.white,
              //         underLine: TextDecoration.none),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
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
          width: 400,
          height: 150,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(180),
              ),
            ),
            child: Center(
              child: TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: "${index + 1}",
                  // text:
                  //     "Status is: ${status(index)}",
                  color: Colors.white,
                  underLine: TextDecoration.none),
            ),
          ),
        )
      ],
    );
  }

  Widget cardreseve(int index) {
    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  text:
                      "تم استقبال  ${controller5.transfer!.bonusTransferReceiver![index].value} نقطة",
                  // text: "name is: Adidas",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  text:
                      "${controller5.transfer!.bonusTransferReceiver![index].senderUser.fname} ${controller5.transfer!.bonusTransferReceiver![index].senderUser.lname} من ",
                  //  text: "phone is: 0932456789",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  //text: "status is: Pending}",
                  text:
                      " ${controller5.transfer!.bonusTransferReceiver![index].createdAt}",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 15,
              ),
              // controller.requeest!.requests[index].status == null
              //     ? Button(
              //         onPressed: () async {
              //           print(
              //               " ${controller.requeest!.requests[index].id.toString()}");
              //           //print(" ${[index].id.toString()}");
              //           Get.toNamed('/editrequest',
              //               arguments: controller.requeest!.requests[index].id);
              //         },
              //         text: "تعديل",
              //         hight: 40,
              //         width: 90,
              //       )
              //     : TextUtils(
              //         fontSize: 18,
              //         fontWeight: FontWeight.normal,
              //         //text: "status is: Pending}",
              //         text: "",
              //         color: Colors.white,
              //         underLine: TextDecoration.none),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
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
          width: 400,
          height: 150,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(180),
              ),
            ),
            child: Center(
              child: TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: "${index + 1}",
                  // text:
                  //     "Status is: ${status(index)}",
                  color: Colors.white,
                  underLine: TextDecoration.none),
            ),
          ),
        )
      ],
    );
  }
}
