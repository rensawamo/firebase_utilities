import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FCMService.instance.init();
  runApp(MyApp());
}

class FCMService {
  FCMService._();

  static final FCMService instance = FCMService._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    final _FCMtoken = await _firebaseMessaging.getToken();
    print('FCM Token: $_FCMtoken');

    _firebaseMessaging.subscribeToTopic('general_notifications');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data);
      print(
          'Received message: ${message.notification?.title} - ${message.notification?.body}');
      if (message.notification != null) {
        showNotification(
            message.notification?.title, message.notification?.body);
      }
   
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(
            message.notification?.title, message.notification?.body);
      }
    });
  }

  void showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('channel_id', 'channel_name',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'item x');
  }

  Future<void> unsubscribe() async {
    await _firebaseMessaging.unsubscribeFromTopic('general_notifications');
  }

  Future<void> subscribe() async {
    await _firebaseMessaging
        .subscribeToTopic('general_notifications')
        .then((value) => print('Subscribed to general_notifications'))
        .catchError((error) =>
            print('Error subscribing to general_notifications: $error'));
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(
            'Received message: ${message.notification?.title} - ${message.notification?.body}');
        FCMService.instance.showNotification(
            message.notification?.title, message.notification?.body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        FCMService.instance.showNotification(
            message.notification?.title, message.notification?.body);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FCM Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('FCM Service Example'),
            ElevatedButton(
              onPressed: () async {
                await FCMService.instance.subscribe();
              },
              child: Text('Subscribe to Notifications'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FCMService.instance.unsubscribe();
              },
              child: Text('Unsubscribe from Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  final String screenName;

  Screen({required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenName),
      ),
      body: Center(
        child: Text('Welcome to $screenName screen!'),
      ),
    );
  }
}
