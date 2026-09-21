import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/cart/data/repos/cart_repo.dart';
import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  SupabaseClient supabase = getIt.get<SupabaseClient>();
  await supabase.auth.signInWithPassword(
    email: 'xofeneh877@fidhost.com',
    password: '1234',
  );
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>())..getCart(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: kBackgroundColor,
              brightness: Brightness.light,
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.light().textTheme,
              ),
            ),

            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
