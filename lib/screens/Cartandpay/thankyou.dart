import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiffany/Controller/appcontroller.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/Dashboard/dashboard.dart';

class thankyou extends StatefulWidget {
  const thankyou({super.key});

  @override
  State<thankyou> createState() => _thankyouState();
}

class _thankyouState extends State<thankyou> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  int _repeatCount = 0;
appController controller=Get.put(appController());
  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Total animation duration
    );

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _repeatCount++;
        if (_repeatCount < 3) {
          _controller.reverse(); // Reverse the animation
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_repeatCount < 3) {
          _controller.forward(); // Forward the animation again
        }
      }
    });

    // Start the animation
    _controller.forward();
    // Make the animation repeat indefinitely
  }



  @override
  void dispose() {
    // Dispose of the controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xffEEF9F5),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              FadeTransition(opacity: _fadeAnimation,
              child: SvgPicture.asset("assets/complete.svg",height: 150,width: 150,)),
              SizedBox(height: 25,),
              myText(
                  text: "Thank You!",
                  color: Colors.black,
                  fontSize: 22,
                  weight: FontWeight.w700),
              SizedBox(height: 25,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  myText(
                      text: "Your Order ",
                      color:Color(0xFF353636),
                      fontSize: 11,
                      weight: FontWeight.w500,),
                  myText(
                    text: "#345678 ",
                    color: Colors.black,
                    fontSize: 13,
                    weight: FontWeight.w600,),
                  myText(
                    text: "is Completed.",
                    color:Color(0xFF353636),
                    fontSize: 11,
                    weight: FontWeight.w500,),

                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  myText(
                      text: "Please Check the Delivery Status at ",
                      color:Color(0xFF353636),
                      fontSize: 11,
                      weight: FontWeight.w500,),
                  myText(
                    text: "Order Tracking",
                    color: Colors.black,
                    fontSize: 13,
                    weight: FontWeight.w600,),


                ],
              ),
              myText(
                text: "pages.",
                color:Color(0xFF353636),
                fontSize: 11,
                weight: FontWeight.w500,),
              SizedBox(height: 25,),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 43.0,horizontal: 20),
                    child: Container(
                      width: 1.sw,
                      height: 200,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF51B4C7)),
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myText(text: "Congratulations!",
                              color: Color(0xFF34C759),
                              fontSize: 23,
                              weight: FontWeight.w700),
                          SizedBox(height: 5,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myText(text: "You've earned ",
                                  color: Color(0xFF353636),
                                  fontSize: 11,
                                  weight: FontWeight.w500),
                              myText(text: "30 ",
                                  color: Colors.black,
                                  fontSize: 13,
                                  weight: FontWeight.w600),
                              myText(text: "Taifany points with your purchase.",
                                  color: Color(0xFF353636),
                                  fontSize: 11,
                                  weight: FontWeight.w500),
                            ],
                          ),
                          SizedBox(height: 5,),
                          myText(text: "Shop more, save more!",
                              color: Colors.black,
                              fontSize: 13,
                              weight: FontWeight.w600),
                        ],
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 30),
                    child: Container(
                      width: 1.sw,
                      height: 0,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFF51B4C7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black26,

                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, -1),
                            ),
                          ]
                      ),

                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset("assets/thankyou.svg" ,width: 100,),
                  )
                ],
              ),

              InkWell(
                onTap: (){
                  controller.currentindex.value=0;
                  controller.currentindexcheckout.value=0;
                  Get.off(()=>dashboard(),transition: Transition.fade,curve: Curves.easeInOut,duration: const Duration(seconds: 1));
                },
                child: Padding(
                  padding: const EdgeInsets.all( 16.0),
                  child: Container(
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: Color(0xFF51B4C7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:   myText(
                            text: "Continue Shopping",
                            color: Colors.white,
                            fontSize: 18,
                            weight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
