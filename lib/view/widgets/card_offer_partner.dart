import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/model/partner_model.dart';

import '../../userinformation.dart';

class arg_offer {
  var off;
  final int id;
  arg_offer(this.off, this.id);
}

class offerpartner extends StatelessWidget {
  var offer;
  

  offerpartner(this.offer);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/partnerofferinfo', arguments: offer),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:
                      NetworkImage("${Userinformation.domain}/${offer.imgUrl}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "${offer.name.toString()}",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "quantity is :${offer.quantity.toString()}",
                    //   style: TextStyle(
                    //     overflow: TextOverflow.ellipsis,
                    //     fontWeight: FontWeight.normal,
                    //     color: Colors.black,
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 75,
                            margin: const EdgeInsets.all(0.2),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                " ${offer.valueInBonus.toString()} Points",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 40,
                            width: 75,
                            margin: const EdgeInsets.all(0.2),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                " ${offer.valueInGems.toString()} Gems",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.edit,
                          //     size: 25,
                          //     color: Colors.blueAccent,
                          //   ),
                          // ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.delete_forever,
                          //     size: 25,
                          //     color: Colors.red,
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //   /* Row(
            //       children: [*/
            //         IconButton(
            //           onPressed: () {

            //           },

            //             icon: Icon(
            //               Icons.create,
            //               size: 20,
            //               color: Colors.red,
            //             ),
            //           ),

            //     IconButton(
            //       onPressed: () {

            //       },
            //       icon: Icon(
            //         Icons.delete,
            //         size: 20,
            //         color: kPrimaryColor,
            //       ),
            //     ),
            //      IconButton(
            //           onPressed: () {
            //           },
            //             icon: Icon(
            //               Icons.thumb_up_alt_rounded,
            //               size: 20,
            //               color: Colors.blueAccent,
            //             ),
            //           ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
