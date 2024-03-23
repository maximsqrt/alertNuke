import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lottie animation as background
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Lottie.asset('assets/matrix.json', fit: BoxFit.cover),
          ),
          // Other widgets on top of the background
          const Center(
            child: const Text(
              'Work in Progress',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


class LottieAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final Widget? title;
  
  
  
LottieAppBar({this.backgroundColor, this.flexibleSpace, this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/chillscreen.json'), // Load your Lottie animation
      // You can customize the container's properties like height, width, alignment, etc.
    );
  }
}