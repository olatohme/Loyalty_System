// import 'package:dio/dio.dart';
// import 'package:get/get.dart';



// class NotificationController extends GetxController {
//   final Pusher pusher = Pusher(
//     'YOUR_APP_KEY',
   
  
//   );
//   //  final Pusher pusher = Pusher(
//   //
//   //   PusherOptions(cluster: 'YOUR_CLUSTER'),
//   // );

//   @override
//   void onInit() {
//     super.onInit();

//     final channel = pusher.subscribe('channel_name');

//     channel.bind('event_name', (PusherEvent event) {
//       // تنفيذ الإجراءات المطلوبة عند استلام الإشعار
//       print('Received notification: ${event.data}');
//     });
//   }

//   void sendNotification() {
//     final channel = pusher.subscribe('channel_name');
//     channel.trigger('event_name', {'message': 'Hello, Pusher!'});
//   }

//   @override
//   void onClose() {
//     pusher.disconnect();
//     super.onClose();
//   }
// }
