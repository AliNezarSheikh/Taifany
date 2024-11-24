import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiffany/screens/loginandsign/loginpage.dart';

import '../../animation/animation.dart';
import '../../reusable/components.dart';

class successpass extends StatefulWidget {
  const successpass({super.key});

  @override
  State<successpass> createState() => _successpassState();
}

class _successpassState extends State<successpass> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      reverseDuration: const Duration(seconds: 2)
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
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
    return
    Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xfff9f9ff),
        child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: FadeTransition(
                    opacity: _animation!,
                  child: Image.asset("assets/successpass.png"),
                  ),
                ),
              ),
              SizedBox(height: 0.03.sh,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                 // width: 0.9.sw,
                 // height: 0.8.sw,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 26.0,right: 26.0, top: 32.0,bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        myText(
                            text:"Password Updated",
                            color: const Color(0xff1C2340),
                            fontSize: 22,
                            weight: FontWeight.bold),
                        SizedBox(height: 0.03.sh,),

                           myText(
                               align: TextAlign.center,
                              text:"Your password had been updated\nsuccessfully.",
                              color: const Color(0xff8A8D9F),
                              fontSize: 16,
                              weight: FontWeight.w500),

                        myText(
                          align: TextAlign.center,
                            text: "Please sign in to use your account\nand enjoy.",
                            color: const Color(0xff8A8D9F),
                            fontSize: 16,
                            weight: FontWeight.w500),
                        SizedBox(height: 0.03.sh,),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              nav=false;
                            });
                            Navigator.pushAndRemoveUntil(
                              context,
                              AnimationsRoutertl(page: const loginpage()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Container(
                            width: 0.7.sw,
                            height: 0.065.sh,
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xff0D3652),
                                  Color(0xff1D79A1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                                child: myText(
                                    text: "Take me to sign in",
                                    color: Colors.white,
                                    fontSize: 18,
                                    weight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
        ),

      ),
    );
  }
}
