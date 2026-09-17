// import 'package:bookly/constants.dart';
// import 'package:bookly/core/utils/styles.dart';
// import 'package:bookly/features/cart/data/models/cart_model.dart';
// import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OrderSummarySection extends StatelessWidget {

//   const OrderSummarySection({super.key, });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         if (state is CartSuccess) {
//           return Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: kWhite,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.04),
//                   blurRadius: 10,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Order Summary',
//                       style: Styles.textStyle16.copyWith(
//                         color: kTextColor1,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: kPrimaryColor.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         '#${state.cart!.cartId}',
//                         style: Styles.textStyle14.copyWith(
//                           color: kPrimaryColor,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
          
//                 // Subtotal Row
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Subtotal',
//                         style: Styles.textStyle14.copyWith(
//                           color: kTextColor1.withOpacity(0.6),
//                         ),
//                       ),
//                       Text(
//                         ,
//                         style: Styles.textStyle14.copyWith(
//                           color: kTextColor1,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
          
//                 // Tax Row
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Delivery Fee',
//                         style: Styles.textStyle14.copyWith(
//                           color: kTextColor1.withOpacity(0.6),
//                         ),
//                       ),
//                       Text(
//                         deliveryFee.toStringAsFixed(2),
//                         style: Styles.textStyle14.copyWith(
//                           color: kTextColor1,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
          
//                 const Divider(height: 24),
          
//                 // Total Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total',
//                       style: Styles.textStyle18.copyWith(
//                         color: kTextColor1,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       grandTotal.toStringAsFixed(2),
//                       style: Styles.textStyle20.copyWith(
//                         color: kPrimaryColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }
