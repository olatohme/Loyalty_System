

import 'package:get/get.dart';
//import 'package:loyalty/bindings/addoffer_binding.dart';

import 'package:loyalty/bindings/home_binding.dart';
import 'package:loyalty/bindings/main_binding.dart';
import 'package:loyalty/bindings/request_binding.dart';
import 'package:loyalty/model/profile_model.dart';
import 'package:loyalty/view/screens/customer/buy_gems.dart';
import 'package:loyalty/view/screens/customer/editProfile.dart';
import 'package:loyalty/view/screens/customer/login.dart';
import 'package:loyalty/view/screens/customer/profile.dart';
import 'package:loyalty/view/screens/customer/qrcode.dart';
import 'package:loyalty/view/screens/customer/recbonus_reseve.dart';
import 'package:loyalty/view/screens/customer/recbonus_send.dart';
import 'package:loyalty/view/screens/customer/recgems_reseve.dart';
import 'package:loyalty/view/screens/customer/recgems_send.dart';
import 'package:loyalty/view/screens/customer/record_convert.dart';
import 'package:loyalty/view/screens/customer/record_convert_g.dart';
import 'package:loyalty/view/screens/customer/recordd.dart';
import 'package:loyalty/view/screens/customer/regester.dart';
import 'package:loyalty/view/screens/customer/scanner_code.dart';
import 'package:loyalty/view/screens/customer/scanner_gems.dart';
import 'package:loyalty/view/screens/customer/sendgems.dart';
import 'package:loyalty/view/screens/partner/addoffer.dart';
import 'package:loyalty/view/screens/partner/buy_bundle.dart';

import 'package:loyalty/view/screens/partner/details_partner.dart';

import 'package:loyalty/view/screens/customer/home.dart';
import 'package:loyalty/view/screens/partner/editoffer.dart';
import 'package:loyalty/view/screens/partner/editprofile.dart';
import 'package:loyalty/view/screens/partner/editrequest.dart';
import 'package:loyalty/view/screens/partner/home_partner.dart';
import 'package:loyalty/view/screens/customer/home.dart';
import 'package:loyalty/view/screens/customer/main_screen.dart';
import 'package:loyalty/view/screens/offerdetails.dart';
import 'package:loyalty/view/screens/partner/listrequests.dart';
import 'package:loyalty/view/screens/partner/new_request.dart';
import 'package:loyalty/view/screens/partner/offers.dart';
//import 'package:loyalty/view/screens/partner/addoffer.dart';

import 'package:loyalty/view/screens/partner/login.dart';
import 'package:loyalty/view/screens/partner/partnerofferinfo.dart';
import 'package:loyalty/view/screens/partner/point_balance.dart';
import 'package:loyalty/view/screens/partner/profile.dart';
import 'package:loyalty/view/screens/partner/recordd.dart';
import 'package:loyalty/view/screens/partner/request.dart';
import 'package:loyalty/view/screens/partner/scanner_code.dart';
import 'package:loyalty/view/screens/partner/scanner_gems.dart';
import 'package:loyalty/view/screens/partner/scanner_sell.dart';
import 'package:loyalty/view/screens/partner/sendgems.dart';
import 'package:loyalty/view/screens/partner/sendpoints.dart';
import 'package:loyalty/view/screens/customer/point_balance.dart';
import 'package:loyalty/view/screens/customer/sendpoints.dart';
import 'package:loyalty/view/screens/partner/waitrequest.dart';

import 'package:loyalty/view/screens/splash.dart';
import 'package:loyalty/view/screens/welcome.dart';
import 'package:loyalty/view/screens/welcome2.dart';

class AppRoutes {
  //initialRoute

  static const Home = '/screens';
  
  //getPages

  static final routes = [

           GetPage(name: '/homeparther', page: ()=> HomeParther ( )),
         //  GetPage(name: '/buy_bundl', page: ()=> buy_bundle ( )),
            GetPage(name: '/buy_gems', page: ()=> buy_gems ( )),
            GetPage(name: '/qrcode', page: ()=> QrCode ( )),
               GetPage(name: '/scanner', page: ()=> scanner( )),
                GetPage(name: '/scanner_gems', page: ()=>  scanner_gems( )),
                  GetPage(name: '/scanner_p', page: ()=> scanner_p( )),
                      GetPage(name: '/scanner_sell', page: ()=> scanner_sell( )),
                GetPage(name: '/scanner_gems_p', page: ()=>  scanner_gems_p( )),
              
              GetPage(name: '/screens', page: ()=> screens( )),
            GetPage(name: '/detailsPartner', page: ()=>DetailPartner ()),
           GetPage(name: '/points', page: ()=>PointsBalance()),
            GetPage(name: '/point', page: ()=>PointBalance()),
           GetPage(name: '/send', page: ()=>SendPoints()),
             GetPage(name: '/sendpartner', page: ()=>SendPoint()),
               GetPage(name: '/sendgems', page: ()=>SendGems()),
                 GetPage(name: '/sendgemspartner', page: ()=>SendGems_partner()),
GetPage(name: '/requests', page: ()=> list_requests()),
            GetPage(name: '/login', page: ()=> Login()),
      // GetPage(name:'/HomeScreen' , page:()=> HomeScreen(),binding: HomeBininding() ),
           GetPage(name: '/welcome', page: ()=>welcome()),
           GetPage(name: '/logincustomer', page: ()=> LoginCustomer()),
            GetPage(name: '/regester', page: ()=>regester()),
            GetPage(name: '/main', page: ()=>MainScreen(),),
             GetPage(name: '/splash', page: ()=>splash_screen()),
            GetPage(name: '/detailsoffer', page: ()=>offerdetails()),
             GetPage(name: '/partnerofferinfo', page: ()=>offerdetail()),
              GetPage(name: '/offers', page: ()=>offers()),
              
                GetPage(name: '/profile', page: ()=>profile()),
                 GetPage(name: '/profile_partner', page: ()=>profile_partner()),
                GetPage(name: '/editprofile', page: ()=>EditProfile()),
                 GetPage(name: '/editprofile_partner', page: ()=>editprofile_partner()),
                 GetPage(name: '/editrequest', page: ()=>EditRequest()),
                 GetPage(name: '/add', page: ()=>AddOffer()),
                 GetPage(name: '/editoffer', page: ()=>EditOffer()),
                 GetPage(name: '/wait', page: ()=>WaitRequest()),
                GetPage(name: '/request', page: ()=>request()),
                 GetPage(name: '/newrequest', page: ()=>newrequest()),
                 GetPage(name: '/convert', page: ()=>page_convert()),
                   GetPage(name: '/convert_g', page: ()=>page_convert_g()),
                  GetPage(name: '/p_send', page: ()=>page_send()),
                   GetPage(name: '/p_reseve', page: ()=>page_reseve()),
                     GetPage(name: '/g_send', page: ()=>pagegems_send()),
                   GetPage(name: '/g_reseve', page: ()=>pagegems_reseve()),
                    GetPage(name: '/record', page: ()=>record()),
                       GetPage(name: '/record_p', page: ()=>record_p()),

  ];
}

