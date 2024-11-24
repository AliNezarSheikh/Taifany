import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffany/reusable/components.dart';

import '../../Controller/appcontroller.dart';
import '../../reusable/comp2.dart';

class dashboard0 extends StatefulWidget {
  const dashboard0({super.key});

  @override
  State<dashboard0> createState() => _dashboard0State();
}

class _dashboard0State extends State<dashboard0> {
  appController controller = Get.put(appController());
  int carusalindex=0;


  @override
  void initState() {
    controller.getposition(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            // controller: controller,

                            keyboardType: TextInputType.text,

                            //  validator: validator,

                            decoration: const InputDecoration(
                              fillColor: Color(0xFFF6F6F6),
                              filled: true,
                              hintText: "Search Here",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xfff4f5f7),
                                    strokeAlign: 0,
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xfff4f5f7),
                                    strokeAlign: 0,
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              prefixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xfff4f5f7),
                                    strokeAlign: 0,
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Badge(
                            label: const Text("5"),
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.notifications_active_outlined,
                              size: 0.08.sw,
                              color: const Color(0xff51B4C7),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:  Icon(
                            Icons.translate_outlined,
                            size: 0.08.sw,
                            color: const Color(0xff51B4C7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                locationbar(context: context,controller: controller),
                CarouselSlider(
                  //carouselController: bordcon,
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


                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 1.sw,

                  color:  const Color(0xffD5C8E7),
                  child:  GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics:
                    const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 2.0,

                    children: List.generate(
                        8, (index) {
                      return Landingpage(model: landinglist[index],
                          onTap: (){
                            landinglist[index].page !=null ?
                            Get.to(landinglist[index].page)
                                :   showToast(context,"Under Development","Coming Soon");
                             });
                    }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      myText(
                          text: "Brands",
                          color: Colors.black,
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const Spacer(),
                      TextButton(onPressed: (){

                      }, child: myText(
                          text: "See all",
                          color: Colors.black,
                          fontSize: 12,
                          weight: FontWeight.w400),)
                    ],
                  ),
                ),
                GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics:
                  const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio:2.3,
                  children: List.generate(
                      6, (index) {
                    return subbrands(image: brandlist[index]);
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      myText(
                          text: "Celebrities",
                          color: Colors.black,
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const Spacer(),
                      TextButton(onPressed: (){

                      }, child: myText(
                          text: "See all",
                          color: Colors.black,
                          fontSize: 12,
                          weight: FontWeight.w400),)
                    ],
                  ),
                ),
                GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics:
                  const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio:1/1,
                  children: List.generate(
                      6, (index) {
                    return subcel(image: cellist[index], num: index+1);
                  }),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
