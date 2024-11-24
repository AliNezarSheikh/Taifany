import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiffany/screens/loginandsign/loginpage.dart';
import 'package:tiffany/screens/loginandsign/signup.dart';

import '../../animation/animation.dart';
import '../../reusable/components.dart';

class signorlogin extends StatefulWidget {
  const signorlogin({super.key});

  @override
  State<signorlogin> createState() => _signorloginState();
}

class _signorloginState extends State<signorlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xfff9f9ff),
        child: Column(

          children: [
            const Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Image(image: AssetImage("assets/logo2.png")),
                  )),
            ),
            
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0)),
                          color: Colors.white),
                     // height: 0.45.sh,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            myText(
                              fontSize: 24,
                              color: Colors.black,
                              text: "Welcome to TAIFANY",
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            myText(
                              fontSize: 16,
                              color: const Color(0xff8A8D9F),
                              align: TextAlign.center,
                              text: "Deliver your Order around the world\nwithout hesitation",
                              weight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  AnimationsRoutebtt(page: const loginpage()),
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
                                        text: "Login",
                                        color: Colors.white,
                                        fontSize: 18,
                                        weight: FontWeight.w600)),
                              ),
                            ),
                           SizedBox(
                              height: 0.02.sh,
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  AnimationsRouteltr(page: const SignUpPage()),
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
                                  color: const Color(0xff51B4C7).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                    child: myText(
                                        text: "Register",
                                        color: const Color(0xff625B71),
                                        fontSize: 18,
                                        weight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
