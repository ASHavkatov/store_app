// import 'package:flutter/material.dart';
//
// class Jovidon extends StatelessWidget {
//   const Jovidon({super.key});
// // a
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 36,
//       width: double.infinity,
//       child: ValueListenableBuilder<int>(
//         valueListenable: selectedIndexNotifier,
//         builder: (context, selectedIndex, _) {
//           return ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: state.categories!.length,
//             separatorBuilder: (context, index) => SizedBox(width: 8),
//             itemBuilder: (context, index) {
//               final isSelected = selectedIndex == index;
//               return Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: isSelected ? AppColors.black : AppColors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: AppColors.buttonBorder),
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     selectedIndexNotifier.value = index;
//                   },
//                   style: TextButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     minimumSize: const Size(0, 0),
//                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   child: Text(
//                     state.categories![3].title,
//                     style: TextStyle(
//                       color: isSelected ? AppColors.white : AppColors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     ),;
//   }
// }
