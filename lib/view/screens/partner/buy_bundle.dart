// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:loyalty/consts/colors.dart';
// import 'package:loyalty/controller/auth_controller.dart';
// import 'package:loyalty/controller/home_controller.dart';
// import 'package:loyalty/model/bundles_model.dart';
// import 'package:loyalty/view/widgets/button.dart';
// import 'package:loyalty/view/widgets/text.dart';
// import 'package:loyalty/view/widgets/textfield.dart';

// class buy_bundle extends StatelessWidget {
//   BundlesModel B=Get.arguments;
 
//   var controller = Get.find<HomeController>();
//   var controller1 = Get.find<AuthController>();
//   final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: fromKey,
//       child: SafeArea(
//           child: Scaffold(
//               body: SingleChildScrollView(
//                   child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height,
//                       color: Colors.green.shade900,
//                       child: Stack(children: [
//                         Positioned(
//                           left: 24,
//                           top: 30,
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.arrow_back_ios_new,
//                                 color: white,
//                                 size: 30,
//                               )),
//                         ),
//                         Positioned(
//                           left: 150,
//                           top: 40,
//                           child: Text(
//                             " ",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                         Positioned.fill(
//                           child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Container(
//                                 width: double.infinity,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.70,
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(40),
//                                     topRight: Radius.circular(40),
//                                     bottomLeft: Radius.circular(0),
//                                     bottomRight: Radius.circular(0),
//                                   ),
//                                   color: Colors.white,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(
//                                       height: 150,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 50),
//                                       child: TextUtils(
//         color: Colors.black,
//         text: "Card Number",
//         fontSize: 13,
//         fontWeight: FontWeight.bold,
//         underLine: TextDecoration.none,
//       ),
//                                     ),
//                                      Padding(
//                                       padding: const EdgeInsets.only(left: 30,top:10 ),
//                                       child:
//                                     CustomTextField2(
//                                       hintText: 'card number',
//                                       prefixIcon: Text(""),
//                                       suffixIcon: Text(""),
//                                       validator: (value) {
//                                         if (value.isEmpty) {
//                                           return 'Please enter a password ';
//                                         }
//                                         if (value.toString().length < 16) {
//                                           return 'Password should be  equal to 16 characters';
//                                         } else {
//                                           return null;
//                                         }
//                                       },
//                                       hight: 60,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.85,
//                                       keyboardType: TextInputType.number,
//                                       onchange: (value) {
//                                         controller.card_num = value;
//                                       },
//                                       obscureText: false,
//                                     ),),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 50),
//                                       child: TextUtils(
//         color: Colors.black,
//         text: "Secret Key",
//         fontSize: 13,
//         fontWeight: FontWeight.bold,
//         underLine: TextDecoration.none,
//       ),),
//                                    Padding(
//                                       padding: const EdgeInsets.only(left: 30 ,top: 10),
//                                       child:  CustomTextField2(
//                                       hintText: ' secret key ',
//                                       prefixIcon: Text(""),
//                                       suffixIcon: Text(""),
//                                       validator: (value) {
//                                         if (value.isEmpty) {
//                                           return 'Please enter a password ';
//                                         }
//                                         if (value.toString().length < 4) {
//                                           return 'Password should be  equal to 4 characters';
//                                         } else {
//                                           return null;
//                                         }
//                                       },
//                                       hight: 60,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.88,
//                                       keyboardType: TextInputType.number,
//                                       onchange: (value) {
//                                         controller.card_key = value;
//                                       },
//                                       obscureText: false,
//                                     ),),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                       Padding(
//                                       padding: const EdgeInsets.only(left: 120,top:30 ),
//                                       child: ElevatedButton(
//       onPressed: ()async{
//          if (fromKey.currentState!.validate()) {
//                                           EasyLoading.show(status: 'Loading..');
//                                           controller.isDialogOpen.value = false;
//                                           await controller.buy_bundle(context,
//                                               controller1.TokenPartner!, B.id);
//                                           Get.back();
//                                         }
//                                         ;
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Colors.green.shade900,
//         minimumSize: Size(180, 50),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//         ),
//       ),
//       child: TextUtils(
//         color: Colors.white,
//         text: "Buy",
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//         underLine: TextDecoration.none,
//       ),
//     ),)
                                   
//                                   ],
//                                 )),
//                           ),
//                         ),
//                         Positioned(
//                           top: 170,
//                           left: 80,
//                           child: Container(
//                               width: 250,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                   topRight: Radius.circular(20),
//                                   bottomLeft: Radius.circular(20),
//                                   bottomRight: Radius.circular(20),
//                                 ),
//                                 color: Colors.blueGrey.shade100,
//                               ),
//                               child: Center(
//                                 child: TextUtils(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     text: 'PayPal',
//                                     color: Colors.black,
//                                     underLine: TextDecoration.none),
//                               )),
//                         )
//                       ]))))),
//     );
//   }
// }
