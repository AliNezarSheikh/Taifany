import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tiffany/screens/Cartandpay/checkout.dart';

import '../../Controller/appcontroller.dart';
import '../../reusable/comp2.dart';
import '../../reusable/components.dart';
import '../Dashboard/dashboard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  appController controller = Get.put(appController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: (){
              controller.currentindex.value=3;
              Get.off(()=>const dashboard());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: const Color(0xffEEF9F5),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xff74C3D2)),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric (horizontal: 4.0),
                      child: Icon(Icons.favorite_border, color: Color(0xFF74C3D2),size: 20,),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: myText(text: "Wishlist", color: Colors.black, fontSize: 11, weight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xffEEF9F5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              locationbar(context: context,controller: controller),
              AnimationLimiter(
                child:
                /*dashcon.listwishs.length == 0?
                      Center(
                        child:
                        PrimaryText(words: "No Favorite"),):*/
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
          
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: 3,//imagesprod.length,
                    itemBuilder: (context, index) {
                      //var item=dashcon.listwishs[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration:
                          const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          horizontalOffset: 30,
                          verticalOffset: 300.0,
                          child: FlipAnimation(
                              duration:
                              const Duration(milliseconds: 3000),
                              curve:
                              Curves.fastLinearToSlowEaseIn,
                              flipAxis: FlipAxis.y,
                              child: cartlist(
                                  image: imagesprod[index])),
                        ),
                      );
                    }),
              ),
              Container(
                width: 1.sw,
          
                color: Colors.white,
                child:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: 1.sw,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0x191D2348)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Image(image: AssetImage("assets/Discount.jpg")),
                              SizedBox(width: 0.04.sw,),
                              myText(
                                  text: "Apply voucher for Discount",
                                  color: Colors.black,
                                  fontSize: 16,
                                  weight: FontWeight.w400),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_sharp)
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(height: 0.02.sh,),
                      Container(
                        width: 1.sw,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0x191D2348)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
          
                            children: [
                              Row(
                                children: [
                                  myText(
                                      text: "Items (3)",
                                      color:  const Color(0xFF999BA9),
                                      fontSize: 16,
                                      weight: FontWeight.w400),
          
                                  const Spacer(),
                                  myText(
                                      text: "AED 300",
                                      color: const Color(0xFF1D2348),
                                      fontSize: 16,
                                      weight: FontWeight.w400),
          
                                ],
                              ),
                              SizedBox(height: 0.01.sh,),
                              Row(
                                children: [
                                  myText(
                                      text: "Shipping Fee",
                                      color:  const Color(0xFF999BA9),
                                      fontSize: 16,
                                      weight: FontWeight.w400),
          
                                  const Spacer(),
                                  myText(
                                      text: "AED 20.50",
                                      color: const Color(0xFF1D2348),
                                      fontSize: 16,
                                      weight: FontWeight.w400),
          
                                ],
                              ),
                              SizedBox(height: 0.015.sh,),
                              const DottedLine(
          
                                dashLength: 6.0, // Length of each dash
          
                                dashGapLength: 6.0, // Gap between dashes
          
                                lineThickness:0.5, // Thickness of the line
          
                                dashColor:  Color(0xFF1D2348), // Color of the dashes
          
          
                              ),
                              SizedBox(height: 0.015.sh,),
                              Row(
                                children: [
                                  myText(
                                      text: "Total Price",
                                      color:  const Color(0xFF1D2348),
                                      fontSize: 18,
                                      weight: FontWeight.w700),
          
                                  const Spacer(),
                                  myText(
                                      text: "AED 320.50",
                                      color:  const Color(0xFF1D2348),
                                      fontSize: 18,
                                      weight: FontWeight.w700),
          
                                ],
                              ),
          
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(height: 0.02.sh,),
                      InkWell(
                        onTap: (){
                          Get.to(const checkout());
                        },
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
                                  text: "Checkout",
                                  color: Colors.white,
                                  fontSize: 18,
                                  weight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
