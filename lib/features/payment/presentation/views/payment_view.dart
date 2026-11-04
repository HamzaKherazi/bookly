import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/order/data/repos/order_repo.dart';
import 'package:bookly/features/order/presentation/view_models/order_cubit/order_cubit.dart';
import 'package:bookly/features/payment/presentation/views/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text('Payment', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => OrderCubit(getIt.get<OrderRepo>()),
        child: PaymentViewBody(),
      ),
    );
  }
}
