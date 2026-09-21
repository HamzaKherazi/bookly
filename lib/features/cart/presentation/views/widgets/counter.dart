import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.cartItemId, required this.quantity});
  final int cartItemId;
  final int quantity;
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int counter;
  @override
  void initState() {
    super.initState();
    counter = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              counter = (counter - 1).clamp(1, 99);
            });
            BlocProvider.of<CartCubit>(
              context,
            ).updateQuantity(widget.cartItemId, counter);
          },
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          icon: Icon(Icons.remove, size: 20.sp, color: Colors.black54),
        ),

        SizedBox(width: 4.w),

        SizedBox(
          width: 28.w,
          child: Text(
            textAlign: TextAlign.center,
            counter.toString(),
            style: Styles.textStyle18.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(width: 4),
        IconButton(
          onPressed: () {
            setState(() {
              counter = (counter + 1).clamp(1, 99);
            });
            BlocProvider.of<CartCubit>(
              context,
            ).updateQuantity(widget.cartItemId, counter);
          },
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          icon: Icon(Icons.add, size: 20.sp, color: kPrimaryColor),
        ),
      ],
    );
  }
}
