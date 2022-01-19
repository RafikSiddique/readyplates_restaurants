import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class FirebaseMessagingService extends ApiServices {
  void initNotifications() {
    _initializeMessaging();
    _initLocalNotification();
  }

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> showMessage(RemoteMessage message) async {
    print(message.data);
    print(message.notification?.body);
    print(message.notification?.title);
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'ReadyPlates',
      'Ready Plates',
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
    return Future<void>.value();
  }

  int a = 0;

  void _initializeMessaging() {
    if (a == 0) {
      getToken();
      a++;
    }
    FirebaseMessaging.onMessage.listen((event) {
      print("OnMessage-Restaurant");
      showMessage(event);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("On Message Opened app-Restaurant");
      showMessage(event);
    });
    FirebaseMessaging.instance.getInitialMessage().then((v) {
      if (v != null) {
        print(v.data);
        print(v.notification?.body);
        print(v.notification?.title);
      }
    });

    FirebaseMessaging.onBackgroundMessage(showMessage);
  }

  void _initLocalNotification() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      'ReadyPlates',
      'Ready Plates',
      playSound: true,
      importance: Importance.max,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: IOSInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    //}
  }

  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    print("Called");
    if (token != null) setToken(token);
    return token;
  }

  Future<void> setToken(String token) async {
    String userId = await SharedPreferenceHelper().getRestaurantId();
    try {
      if (userId != "") {
        FirebaseFirestore.instance.collection('restaurant').doc(userId).set({
          DateTime.now().toString(): token,
        });
        var res = await post(Uri.parse(baseUri + 'restaurants/token/'),
            headers: contentTypeJsonHeader,
            body: jsonEncode({
              'restaurant': userId,
              'token': token,
            }));
        print(res);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
