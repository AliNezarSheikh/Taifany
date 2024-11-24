import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffany/screens/loginandsign/signorlogin.dart';

import '../../Controller/appcontroller.dart';
import '../../animation/animation.dart';
import '../../reusable/components.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({super.key});

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  appController controller = Get.put(appController());

  var bordcontroller = PageController();
 /* List boarding=[
    buildborditem2(controller: bordcontroller),
    buildborditem2(controller: bordcontroller),
    buildborditem2(controller: bordcontroller),
 /*   buildborditem2(),
    buildborditem2(),
    buildborditem2(),*/
  ];*/
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    List boarding=[
      buildborditem2(controller: bordcontroller,onTap: () {
          if (islast) {
                                 controller.isFirstTime.value=false;
                                FirstTime.write("isFirstTime",controller.isFirstTime.value);

                                  Navigator.pushAndRemoveUntil(

                                    context,

                                    FadeSlidePageRoute(page: const signorlogin()),

                                        (Route<dynamic> route) => false,

                                  );

                                } else {
                                  bordcontroller.nextPage(
                                      duration: const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                }

      },),
      buildborditem2(controller: bordcontroller,onTap: () {
          if (islast) {
                                 controller.isFirstTime.value=false;
                                FirstTime.write("isFirstTime",controller.isFirstTime.value);

                                  Navigator.pushAndRemoveUntil(

                                    context,

                                    FadeSlidePageRoute(page: const signorlogin()),

                                        (Route<dynamic> route) => false,

                                  );

                                } else {
                                  bordcontroller.nextPage(
                                      duration: const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                }

      },),
      buildborditem2(controller: bordcontroller,onTap: () {
          if (islast) {
                                 controller.isFirstTime.value=false;
                                FirstTime.write("isFirstTime",controller.isFirstTime.value);

                                  Navigator.pushAndRemoveUntil(

                                    context,

                                    FadeSlidePageRoute(page: const signorlogin()),

                                        (Route<dynamic> route) => false,

                                  );

                                } else {
                                  bordcontroller.nextPage(
                                      duration: const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                }

      },),

      /*   buildborditem2(),
    buildborditem2(),
    buildborditem2(),*/
    ];
    return Scaffold(
      body:Container(
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: bordcontroller,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    boarding[index],
                itemCount: boarding.length,
              ),
             /* Align(
                  alignment: Alignment.bottomCenter,
                  child:   Padding(
                    padding: const EdgeInsets.only(bottom: 55.0).r,
                    child: InkWell(
                      onTap:  () {
                        if (islast) {
                         // controller.isFirstTime.value=false;
                         // FirstTime.write("isFirstTime",controller.isFirstTime.value);

                          Navigator.pushAndRemoveUntil(

                            context,

                            FadeSlidePageRoute(page: signorlogin()),

                                (Route<dynamic> route) => false,

                          );

                        } else {
                          bordcontroller.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }

                      },
                      child: Container(
                        width: 0.7.sw,
                        height: 0.065.sh,

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(

                            child: myText(
                                text: "Get Started",
                                color: Color(0xff65558F),
                                fontSize: 18,
                                weight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: bordcontroller,
                          count: 3,
                          effect: WormEffect(
                            activeDotColor: Color(0xffE8B931),
                            dotColor: Colors.white,
                            dotHeight: 15,
                            spacing: 10.0,
                            type: WormType.thinUnderground,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
            ],
          ),
        ),

    );
  }

}
/*Align(
                  alignment: Alignment.bottomCenter,
                  child:   Padding(
                    padding: const EdgeInsets.only(bottom: 55.0).r,
                    child: InkWell(
                      onTap:  () {
                        if (islast) {
                         // controller.isFirstTime.value=false;
                         // FirstTime.write("isFirstTime",controller.isFirstTime.value);

                          Navigator.pushAndRemoveUntil(

                            context,

                            FadeSlidePageRoute(page: signorlogin()),

                                (Route<dynamic> route) => false,

                          );

                        } else {
                          bordcontroller.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }

                      },
                      child: Container(
                        width: 0.7.sw,
                        height: 0.065.sh,

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(

                            child: myText(
                                text: "Get Started",
                                color: Color(0xff65558F),
                                fontSize: 18,
                                weight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: bordcontroller,
                          count: 3,
                          effect: WormEffect(
                            activeDotColor: Color(0xffE8B931),
                            dotColor: Colors.white,
                            dotHeight: 15,
                            spacing: 10.0,
                            type: WormType.thinUnderground,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/



