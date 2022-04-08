
import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  static String BASE = 'fcm.googleapis.com';
  static String API_SEND = '/fcm/send';
  static Map<String, String> headers = {
    'Authorization': 'AAAA0eWTutc:APA91bE02BVRHV-2vQ3gFVURbKxwjvA-Gon96CUhsROJEf3e7CoH1hZnHXQ2l267oljyhuFI9AVDvsaCdD8OB5flVgv5hJYLg-RNW2eZsen_D0mXL-QCQ12f8MxZoQLyAT1lC2LTxyVP',
    'Content-Type': 'application/json'
  };

  static Future<String?> POST(Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, API_SEND);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Map<String, dynamic> paramCreate(String fcm_token, String username, String someoneName) {
    Map<String, dynamic> params = {};
    params.addAll({
      'notification': {
        'title': 'My Instagram: $someoneName',
        'body': '$username followed you!'
      },
      'registration_ids': [fcm_token],
      'click_action': 'FLUTTER_NOTIFICATION_CLICK'
    });
    return params;
  }
}