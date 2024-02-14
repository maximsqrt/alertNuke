// import "package:alertnukeapp/config/colors.dart";
// import "package:flutter/material.dart";

// class GradientAppBar extends StatelessWidget {
//   final String? title;
//   final Widget logo;
//   final double barHeight = 50.0;

//   GradientAppBar({this.title, required this.logo});

//   @override
//   Widget build(BuildContext context) {
//     final double statusbarHeight = MediaQuery.of(context).padding.top;

//     return Container(
//       padding: EdgeInsets.only(top: statusbarHeight),
//       height: statusbarHeight + barHeight,
//       decoration: BoxDecoration(
//         gradient: JPfancyColor.jpFancyColor(),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           logo,
//           SizedBox(width: 8),
//           if (title != null)
//             Text(
//               title!,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:alertnukeapp/config/colors.dart';
// import 'package:flutter/material.dart';

// class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget? title;

//   const GradientAppBar({Key? key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title:title,
//       backgroundColor: Colors.transparent,
//       flexibleSpace: Container(alignment: ,)

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
