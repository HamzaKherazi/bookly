import 'package:bookly/features/cart/presentation/views/cart_view.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/main_view.dart';
import 'package:bookly/features/notifications/presentation/views/notifications_view.dart';
import 'package:bookly/features/order/presentation/views/order_summary_view.dart';
import 'package:bookly/features/payment/presentation/views/payment_view.dart';
import 'package:bookly/features/profile/presentation/views/edit_profile_view.dart';
import 'package:bookly/features/orders_history/presentation/views/orders_history_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const mainView = '/mainView';
  static const bookDetailsView = '/bookDetailsView';
  static const loginView = '/loginView';
  static const signupView = '/signupView';
  static const cartView = '/cartView';
  static const notificationsView = '/notificationsView';
  static const orderSummaryView = '/orderSummaryView';
  static const paymentView = '/paymentView';
  static const editProfileView = '/editProfileView';
  static const orderHistoryView = '/orderHistoryView';

  static final router = GoRouter(
    routes: [
      // Just for testing, delete it after, then activate other comments
      GoRoute(path: '/', builder: (context, state) => const MainView()),

      // GoRoute(path: '/', builder: (context, state) => const SplashView()),
      // GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      // GoRoute(
      //   path: signupView,
      //   builder: (context, state) => const SignupView(),
      // ),
      // GoRoute(path: mainView, builder: (context, state) => const MainView()),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(path: cartView, builder: (context, state) => const CartView()),
      GoRoute(
        path: notificationsView,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: orderSummaryView,
        builder: (context, state) => const OrderSummaryView(),
      ),
      GoRoute(
        path: paymentView,
        builder: (context, state) => const PaymentView(),
      ),
      GoRoute(
        path: editProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: orderHistoryView,
        builder: (context, state) => const OrderHistoryView(),
      ),
    ],
  );
}
