import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  @override
  bool notificationExist = false;

  Widget build(BuildContext context) {
    return notificationExist
        ? Text('Notifications')
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications,
                  color: kEmpty,

                  size: MediaQuery.of(context).size.width * .5,
                ),
                Text('Notifications here'),
              ],
            ),
          );
  }
}
