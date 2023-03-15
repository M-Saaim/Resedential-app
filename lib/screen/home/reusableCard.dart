// import 'package:flutter/material.dart';
// import 'package:resedentialapp/shared/constants.dart';

// class ReusableCard extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Function onpress;

//   const ReusableCard(
//       {super.key,
//       required this.icon,
//       required this.text,
//       required this.onpress});
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onpress,
//         child: Container(
//           height: 150.0,
//           // ignore: sort_child_properties_last
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 icon,
//                 size: 40.0,
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               Text(
//                 text,
//                 style: const TextStyle(
//                   fontSize: 18.0,
//                 ),
//               )
//             ],
//           ),
//           margin: const EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//             color: kAmaranth,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
