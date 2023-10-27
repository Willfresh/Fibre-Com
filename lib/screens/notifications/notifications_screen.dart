import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "/notification";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<RemoteMessage> _messages = [];

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _messages.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.8,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final RemoteMessage message = _messages[index];
          final DateTime sentTime = message.sentTime ?? DateTime.now();

          /*// À l'intérieur de la méthode build() dans votre widget _NotificationScreenState
          final DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
            ((message.sentTime ?? DateTime.now().millisecondsSinceEpoch) as int) * 1000,
          );
          final String formattedDateTime = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);*/



          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Dismissible(
                key: Key(message.hashCode.toString()),
                onDismissed: (direction) {
                  setState(() {
                    _messages.removeAt(index);
                  });
                },
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(message.notification?.title ?? 'Aucun titre'),
                      subtitle: Text(message.notification?.body ?? 'Aucun corps'),
                      onTap: () {
                        // ...
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        DateFormat('dd/MM/yyyy hh:mm').format(sentTime.toLocal()),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
