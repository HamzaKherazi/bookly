import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class StatusBarWrapper extends StatelessWidget {
  final Widget child;
  final Color color;
  final Brightness iconBrightness;

  const StatusBarWrapper({
    super.key,
    required this.child,
    required this.color,
    this.iconBrightness = Brightness.light,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness,
      ),
      child: child,
    );
  }
}
