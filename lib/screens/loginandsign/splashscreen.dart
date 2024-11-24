import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiffany/screens/Dashboard/dashboard0.dart';
import 'package:tiffany/screens/loginandsign/signorlogin.dart';
import 'package:tiffany/screens/loginandsign/welcomescreen.dart';

import '../../reusable/components.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              builder: (context, value, child){
                return  Container(
                  width:value * constraints.maxWidth,
                  height:value * constraints.maxHeight,
                  decoration: BoxDecoration(
                    shape:value ==1 ? BoxShape.rectangle : BoxShape.circle,

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff09253D),
                        Color(0xff2285AF),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                );
              },

            ),
          );
        },

      ),
         AnimatedSplashScreen(
            splash: "assets/splashlogo.png",
            splashIconSize: 0.6.sw,
            nextScreen: FadeTransition(
                opacity: _animation!,
            child:loginorboard? const welcomescreen():
            token == "" ? const signorlogin() :const dashboard0()),
            duration: 2500,
            backgroundColor: Colors.transparent,
            splashTransition: SplashTransition.fadeTransition,
            curve: Curves.easeIn,
            animationDuration: const Duration(milliseconds:1500 ),

          ),
        ],
      ),
    );
  }
}
