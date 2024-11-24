import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tiffany/reusable/comp2.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/Dashboard/vendordetails.dart';

import '../../Controller/appcontroller.dart';
import '../Cartandpay/Cart.dart';

class vendor extends StatefulWidget {
  const vendor({super.key});

  @override
  State<vendor> createState() => _vendorState();
}

class _vendorState extends State<vendor> {
  appController controller = Get.put(appController());
  int carusalindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text(
          'Vendor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 30),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),*/
      body: Obx(
        () => Container(
          width: 1.sw,
          height: 1.sh,
          color: const Color(0xffEEF9F5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.03.sh,
                  color: Colors.white,
                ),

                searchbar(onTap:   () {
        Get.to(() => const CartScreen());
        }),
                locationbar(context: context,controller: controller),
                CarouselSlider(
                  items: List.generate(bannerimages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildBanner(model: bannerimages[index]),
                    );
                  }),
                  options: CarouselOptions(
                    reverse: false,
                    initialPage: carusalindex,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        carusalindex = index;
                      });
                    },
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                    height: 140,
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return carusalindex == index
                          ? Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 9.0,
                                  width: 36.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF51B4C7).withOpacity(
                                        0.2), // Light background for the bar
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),

                                // Actual progress
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 9.0,
                                  width: (carusalindex + 1) *
                                      (36.0 /
                                          bannerimages
                                              .length), // Width is proportional to current index
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .blueAccent, // Blue color for active progress
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            )
                          : DotsIndicator(
                              dotsCount: 1,
                              position: 0,
                              decorator: DotsDecorator(
                                size: const Size.square(9.0),
                                activeSize: const Size.square(9.0),
                                color: const Color(0xFF51B4C7).withOpacity(0.2),
                                activeColor: const Color(0xFF51B4C7).withOpacity(0.2),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: bannerimages.length,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: myText(
                        text: "Vendors",
                        color: Colors.black,
                        fontSize: 20,
                        weight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Vendorscat(
                        index: index,
                        controller: controller,

                        onTap: () async {
                          controller.Selectedvendor.value = index;
                          await controller.getVendors(
                              type: sellersforapi[index]);
                        },
                        // controller,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: vendorTypes.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 1.sw,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF51B4C7),
                        ),
                      ),
                    ),
                  ),
                ),
                ConditionalBuilder(
                    condition: controller.isLoadingVendors.isFalse,
                    builder: (context) {
                      return vendorlist.isNotEmpty?
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 0.0,

                        childAspectRatio: 1 / 0.85,

                        // Replace with your desired number of shimmer items
                        children: List.generate(
                          vendorlist.length,
                          (index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              delay: const Duration(milliseconds: 100),
                              child: ScaleAnimation(
                                  duration: const Duration(milliseconds: 1200),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: FadeInAnimation(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: vendorwidget(
                                        model: vendorlist[index],
                                        onTap: () {
                                          print(vendorlist[index].slug!);
                                      Get.to(()=> const vendordetails(),arguments: vendorlist[index],transition: Transition.fadeIn,duration: const Duration(milliseconds: 500));
                                    }),
                                  ))),
                            );
                          },
                        ),
                      )
                      : const Center(child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text("No Vendors Found"),
                      ));
                    },
                    fallback: (context) {
                      return  Skeletonizer(
                        enabled: controller.isLoadingVendors.isTrue,
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 5.0,

                          childAspectRatio: 1 / 0.85,

                          // Replace with your desired number of shimmer items
                          children: List.generate(
                            6,
                                (index) {
                              return vendorwidget(
                                  model: fakevendorlist[index], onTap: () {},condition: controller.isLoadingVendors.isTrue);

                            },
                          ),
                        ),
                      );
                      /* Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: CupertinoActivityIndicator(
                                                    radius: 30,
                                                  ),
                          ));*/
                    }),

                //controller.listtest[controller.Selectedvendor.value],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
