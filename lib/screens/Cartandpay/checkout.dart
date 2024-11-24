

import 'package:dotted_line/dotted_line.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/Cartandpay/thankyou.dart';

import '../../Controller/appcontroller.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
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
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Obx(
        ()=> Container(
          width: 1.sw,
          height: 1.sh,
          color: const Color(0xffEEF9F5),
          child: SingleChildScrollView(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EasyStepper(
                    activeStep: controller.currentindexcheckout.value,
                    enableStepTapping: true,

                    activeStepTextColor: Colors.black,
                    finishedStepTextColor: Colors.black,


                    internalPadding: 0,
                    showLoadingAnimation: false,
                    stepRadius: 15,
                    activeStepBorderType: BorderType.dotted,
                    finishedStepBackgroundColor: Colors.transparent,

                    activeStepBackgroundColor: Colors.white,

                    lineStyle: LineStyle(
                      lineLength: 0.3.sw,
                      lineSpace: 0,
                       lineType: LineType.normal,
                      defaultLineColor:  const Color(0xFFC3C3C3),

                    ),


                    showStepBorder: false,
                    //lineDotRadius: 1.5,
                    steps: [
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                          controller.currentindexcheckout.value == 0 ? const Color(0xff51B4C7) : const Color(0xFFC3C3C3),
                        ),
                        title: 'Personal Info',

                      ),
                      EasyStep(
                        customStep: Container(
                          decoration: controller.currentindexcheckout.value < 1 ? BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                          ):const BoxDecoration(),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor:
                            controller.currentindexcheckout.value == 1 ? const Color(0xff51B4C7) :
                            controller.currentindexcheckout.value < 1? const Color(0xFFF2F6F9):const Color(0xFFC3C3C3),
                          ),
                        ),
                        title: 'Payment',

                      ),
                      EasyStep(
                        customStep:Container(
                          decoration: controller.currentindexcheckout.value < 2 ? BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                          ):const BoxDecoration(),
                           child: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                          controller.currentindexcheckout.value == 2 ? const Color(0xff51B4C7) :
                          controller.currentindexcheckout.value < 2? const Color(0xFFF2F6F9):const Color(0xFFC3C3C3),

                        ),


                      ),
                        title: 'Confirmation',),




                    ],
                    onStepReached: (index) =>
                        setState(() {
                          controller.currentindexcheckout.value = index;

                        } ),
                  ),
                ),

               controller.checkoutscreens[controller.currentindexcheckout.value],
                SizedBox(height: 0.08.sh,),

                controller.currentindexcheckout.value<2
                    ? InkWell(
                  onTap: (){
                    if(controller.currentindexcheckout.value<2){
                      controller.changecheckoutindex();
                    }  else{
                      return;
                    }



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
                            text: "Continue",
                              color: Colors.white,
                              fontSize: 18,
                              weight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
                :Container(
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
                                  SizedBox(height: 0.01.sh,),
                                  Row(
                                    children: [
                                      myText(
                                          text: "Vat",
                                          color:  const Color(0xFF999BA9),
                                          fontSize: 16,
                                          weight: FontWeight.w400),

                                      const Spacer(),
                                      myText(
                                          text: "AED 5.50",
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
                                          text: "AED 325.50",
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
                                  Get.off(()=>thankyou(),transition: Transition.topLevel,curve: Curves.easeInOut,duration: const Duration(seconds: 1));
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
                                      text: "Place Order",
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
      ),
    );
  }
}
