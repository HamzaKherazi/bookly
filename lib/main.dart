import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kBackgroundColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://yelxdgrkvucfhgetnblt.supabase.co',
    publishableKey: 'sb_publishable_VQMu0XU-9aytieNAQJsQJw_wuCOMvlp',
  );
  setupDependencies();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        brightness: Brightness.light,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}
