import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/view/screens/welcome.dart';
import 'package:loyalty/view/widgets/button.dart';
import 'package:loyalty/view/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class screens extends StatelessWidget {
  screens({Key? key}) : super(key: key);
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        PageView(
          controller: controller,
          children: [
            Stack(
              children: [
                Container(
                  color: white,
                ),
                Positioned(
                    top: 1,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        /// color: white,
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.40,
                    )),
                Positioned(
                    top: 150,
                    left: 35,
                    child: Image.asset(
                      "assets/images/w2.png",
                      width: 350,
                      height: 450,
                    )),
                Positioned(
                  bottom: 230,
                  left: 170,
                  child: TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      text: 'WELCOME ',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                 Positioned(
                  bottom: 190,
                  left: 110,
                  child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'Let customers find their points ',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                  Positioned(
                  bottom: 170,
                  left: 70,
                  child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: ' faster and partners to display his goods ',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                 Positioned(
                  bottom: 150,
                  left: 120,
                  child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'and add offers and discounts ',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  color: white,
                ),
                Positioned(
                    top: 1,
                    left: 90,
                    child: Container(
                      decoration: BoxDecoration(
                        /// color: white,
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: MediaQuery.of(context).size.height * 0.50,
                    )),
                Positioned(
                    top: 180,
                    left: 20,
                    child: Image.asset(
                      "assets/images/w11.png",
                      width: 350,
                      height: 400,
                    )),
                Positioned(
                  bottom: 250,
                  left: 150,
                  child: TextUtils(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      text: 'Get Bonus',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                Positioned(
                  bottom: 210,
                  left: 80,
                  child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'By logging in and interacting with',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                Positioned(
                  bottom: 190,
                  left: 150,
                  child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'the application',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  color: white,
                ),
                Positioned(
                    top: 1,
                    left: 90,
                    child: Container(
                      decoration: BoxDecoration(
                        /// color: white,
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: MediaQuery.of(context).size.height * 0.50,
                    )),
                Positioned(
                    top: 180,
                    left: 20,
                    child: Image.asset(
                      "assets/images/www.png",
                      width: 350,
                      height: 400,
                    )),
                Positioned(
                  bottom: 250,
                  left: 100,
                  child: TextUtils(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      text: 'Turn Bonus into Gems',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                Positioned(
                  bottom: 210,
                  left: 40,
                  child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: ' Get various offers from different partners',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
                Positioned(
                  bottom: 120,
                  left: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/welcome');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      minimumSize: Size(200, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    child: TextUtils(
                      color: Colors.white,
                      text: "Get Started",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                    ),
                  ),
                )

                // Positioned(
                //       bottom: 190,
                //       left: 140,
                //             child: TextUtils(
                // fontSize: 13,
                // fontWeight: FontWeight.normal,
                // text: 'the application',
                // color: Colors.black,
                // underLine: TextDecoration.none),),
              ],
            ),
            // welcome()
          ],
        ),
        Container(
          alignment: Alignment(0, 0.85),
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
             effect: ScrollingDotsEffect(
                // لون النقطة النشطة (الصفحة الحالية)
                activeDotColor: kPrimaryColor,
                // لون النقط غير النشطة
                dotColor: Colors.grey,
                // عرض النقطة
                dotWidth: 10,
                // ارتفاع النقطة
                dotHeight: 10,
          ),
        ))
      ]),
    );
  }
}
