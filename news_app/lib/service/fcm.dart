import 'dart:convert';
import 'package:http/http.dart' as http;

class FCMService {
  static const String FCMAPI =
      "AAAAgE-Snf4:APA91bHitnGewfQZS_3TeFjYIGPO_4N6EVm2H1caov0SRpi3dRuDbM81N69zRx1mI24OJidRWBVYR54R08NAS-L-JSnWGJqISsF7EmWzQ_aO0nwD4se-yFcDH_6KnkFOjnXJ1nA8dJIA";
  static String makePayLoadWithToken(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'to': token,
      'data': data,
      'notification': notification,
    });
  }

  static String makePayLoadWithTopic(String? topic, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'topic': topic,
      'data': data,
      'notification': notification,
    });
  }

  static Future<void> sendPushMessage(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$FCMAPI'
        },
        body: makePayLoadWithToken(token, data, notification),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
