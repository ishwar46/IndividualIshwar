import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/pages/homepage.dart';

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static BuildContext? context;
//   static void initialize() {
//     context = context;
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//             iOS: DarwinInitializationSettings(
//               requestSoundPermission: false,
//               requestBadgePermission: false,
//               requestAlertPermission: false,
//             ));

//     _notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }

//   static void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     if (context != null) {
//       await Navigator.push(
//         context!,
//         MaterialPageRoute<void>(builder: (context) => HomePage()),
//       );
//     }
//   }

//   static Future<String> getImageFilePathFromAssets(
//       String asset, String filename) async {
//     final byteData = await rootBundle.load(asset);
//     final temp_direactory = await getTemporaryDirectory();
//     final file = File('${temp_direactory.path}/$filename');
//     await file.writeAsBytes(byteData.buffer
//         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

//     return file.path;
//   }

//   static void display(String title, String body, String payload) async {
//     context = context;

//     // if image from asset
//     final bigpicture = await getImageFilePathFromAssets(
//         'assets/images/largicon.png', 'bigpicture');
//     final smallpicture = await getImageFilePathFromAssets(
//         'assets/images/smallicon.jpg', 'smallpicture');

//     final styleinformationDesign = BigPictureStyleInformation(
//       FilePathAndroidBitmap(smallpicture),
//       largeIcon: FilePathAndroidBitmap(bigpicture),
//     );

//     try {
//       final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//       final NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails("myapp", "myapp channel",
//               channelDescription: "myapp channel description",
//               importance: Importance.max,
//               priority: Priority.high,
//               styleInformation: styleinformationDesign),
//           iOS: DarwinNotificationDetails());
//       await _notificationsPlugin.show(id, title, body, notificationDetails,
//           payload: payload);
//     } on Exception catch (e) {
//       print(e.toString());
//     }
//   }

//   static getTemporaryDirectory() {}
// }

class localNotifcation {
  void main() {}
}
