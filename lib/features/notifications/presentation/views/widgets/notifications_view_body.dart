import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  @override
  bool notificationExist = false;

  @override
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
                Text(
                  'Notifications here',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 105, 105, 105),
                  ),
                ),
              ],
            ),
          );
  }
}
