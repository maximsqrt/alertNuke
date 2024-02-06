// // ignore_for_file: library_private_types_in_public_api

// // import 'package:alertnukeapp/config/colors.dart';
// // import 'package:alertnukeapp/config/customgradientappbar.dart';
// // import 'package:alertnukeapp/features/icons/presentation/iconchoose.dart';
// // import 'package:alertnukeapp/features/icons/presentation/iconslist.dart';
// // import 'package:flutter/material.dart';
// // import 'package:unicons/unicons.dart'; // Import the Unicons library

// // class IconsScreen extends StatefulWidget {
// //   const IconsScreen({key});

// //   @override
// //   _IconsScreenState createState() => _IconsScreenState();
// // }

// // class _IconsScreenState extends State<IconsScreen> {
// //   late List<IconData> allUnicons;
// //   late List<IconData> filteredIcons;
// //   final TextEditingController searchController = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     allUnicons = uniconsList;
// //     filteredIcons = allUnicons;
// //   }
// // // Method to search Icons
// //   void filterIcons(String query) {
// //     setState(() {
// //       filteredIcons = allUnicons.where((icon) {
// //         return icon.toString().toLowerCase().contains(query.toLowerCase());
// //       }).toList();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: <Widget>[
// //           GradientAppBar(
// //             logo: Image.asset(
// //               'assets/AlertNuke.png',
// //               width: 200, // specify the width
// //               // specify the height
// //             ),
// //           ),
// //           SearchBar(controller: searchController, onChanged: filterIcons),
// //           Expanded(
// //             child: IconList(
// //               icons: filteredIcons,
// //               onTap: (icon) => _showNameDialog(context, icon),
// //             ), //Widget 4 displaying the List of Icons
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // // user shall select name / title for each item --- 
// //   Future<void> _showNameDialog(BuildContext context, IconData icon) async {
// //     String? iconName = await showDialog<String>(
// //       context: context,
// //       builder: (_) => NameDialog(icon: icon),
// //     );

// //     // Save the icon name to repository here
// //     if (iconName != null && iconName.isNotEmpty) {
// //       IconWithName iconWithName = IconWithName(icon, iconName);
// //       //Pass IconWithName to next Screen 
// //       // ignore: use_build_context_synchronously
// //       Navigator.push(
// //         context,
// //       MaterialPageRoute(builder: (context) => IconsChoosen(iconWithName: iconWithName),
   
   
// //       )
// //       );
// //     }   
// //   }
// // }

  

// ///Search BAR!
// class SearchBar extends StatelessWidget {
//   final TextEditingController controller;
//   final ValueChanged<String> onChanged;

//   const SearchBar({super.key, 
//     required this.controller,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           labelText: 'Search for Icon',
//           prefixIcon: const Icon(UniconsLine.search),
//           fillColor: Colors.white,
//           filled: true,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade200),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.blue),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IconList extends StatelessWidget {
//   final List<IconData> icons;
//   final void Function(IconData) onTap;

//   const IconList({super.key, 
//     required this.icons,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: SettingsBackgroundColor.linearGradient(),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Scrollbar(
//         thickness: 10,
//         child: ListView.builder(
//           itemCount: icons.length,
//           itemBuilder: (context, index) {
//             final IconData icon = icons[index];
//             final String iconName = icon.toString();
//             return ListTile(
//               onTap: () => onTap(icon),
//               leading: Icon(icon, color: FancyFontColor.primaryColor),
//               title: Text(iconName, style: const TextStyle(color: FancyFontColor.primaryColor)),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class NameDialog extends StatelessWidget {
//   final IconData icon;

//   const NameDialog({super.key, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController controller = TextEditingController();
//     return AlertDialog(
//       title: const Text('Name your icon'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               Icon(icon, size: 24),
//               const SizedBox(width: 10),
//               const Text('Icon'),
//             ],
//           ),
//           TextField(
//             controller: controller,
//             decoration: const InputDecoration(hintText: 'Enter icon name'),
//           ),
//         ],
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(controller.text);
//           },
//           child: const Text('Save'),
//         ),
//       ],
//     );
//   }
// }
