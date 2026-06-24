import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/notifications/presentation/views/widgets/notifications_view_body.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text('Notifications', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: NotificationsViewBody(),
    );
  }
}
