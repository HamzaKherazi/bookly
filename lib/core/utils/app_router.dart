import 'package:bookly/features/auth/presentation/views/login_view.dart';
import 'package:bookly/features/auth/presentation/views/signup_view.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/main_view.dart';
import 'package:bookly/features/searchBook/presentation/views/search_book_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const mainView = '/mainView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchBookView = '/searchBookView';
  static const loginView = '/loginView';
  static const signupView = '/signupView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: signupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(path: mainView, builder: (context, state) => const MainView()),
      GoRoute(
        path: searchBookView,
        builder: (context, state) => const SearchBookView(),
      ),

      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
