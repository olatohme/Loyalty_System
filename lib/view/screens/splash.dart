import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/main.dart';
import 'package:loyalty/view/screens/welcome.dart';

import 'customer/main_screen.dart';

class splash_screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        height:MediaQuery.of(context).size.height,
         width:MediaQuery.of(context).size.width,
       // decoration: gradientBackground,
        child: Column(
          children: [
           // SizedBox(height: 40,),
              Image.asset(
                      'assets/images/welcome.png',
                      width:300,
                      height: 300,
                    ),
                    SizedBox(height: 0,),
             Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.black),
                          image: DecorationImage(
                              image: AssetImage('assets/images/ll.png')))),
          
            // TextUtils(
            //   fontSize: 18,
            //    fontWeight:FontWeight.bold,
            //     text: "WELCOME TO OUR EXHIBITION", 
            //     color: white,
            //      underLine: TextDecoration.none)
          ],
        ),
      ),
      
      backgroundColor:
      kPrimaryColor.withOpacity(0.9),
      splashIconSize: 600,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      centered: true,
      
       nextScreen: welcome() );
      

  }
}