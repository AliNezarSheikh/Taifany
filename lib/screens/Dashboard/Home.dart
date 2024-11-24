import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tiffany/screens/Dashboard/dashboard.dart';

import '../../Controller/appcontroller.dart';
import '../../animation/animation.dart';
import '../../reusable/comp2.dart';
import '../../reusable/components.dart';
import '../Cartandpay/Cart.dart';
import '../products/productdetails.dart';
import '../products/productsincategoriey.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  appController controller = Get.put(appController());
  final ScrollController _scrollController = ScrollController();
  int carusalindex=0;
  int carusalindex2=0;


  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // This is where you can call your method when scrolling to the bottom
      print("Reached the bottom!");
      print(_scrollController.position.pixels );
      // Example method call
    }
  }


  @override
  void dispose() {

    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          width: 1.sw,
          height: 1.sh,
          color: const Color(0xffEEF9F5),
          child: SingleChildScrollView(
            controller: _scrollController,
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
                       carusalindex=index;
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
                  height:20,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return carusalindex==index ?
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 9.0,
                            width: 36.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF51B4C7).withOpacity(0.2), // Light background for the bar
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),

                          // Actual progress
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 9.0,
                            width: (carusalindex + 1) * (36.0 / bannerimages.length), // Width is proportional to current index
                            decoration: BoxDecoration(
                              color: Colors.blueAccent, // Blue color for active progress
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      )
                      : DotsIndicator(
                        dotsCount:1,
                        position: 0,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size.square(9.0),
                          color: const Color(0xFF51B4C7).withOpacity(0.2),
                          activeColor: const Color(0xFF51B4C7).withOpacity(0.2),

                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
                        text: "Official Sellers",
                        color: Colors.black,
                        fontSize: 16,
                        weight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return sellerswidget(
                          index: index,
                          onTap: () {
                            controller.currentindex.value = 2;
                            controller.Selectedvendor.value = index;
                            controller.getVendors(type: sellersforapi[controller.Selectedvendor.value]);
                            Navigator.of(context).pushReplacement(
                              FadePageRoute(page: const dashboard()),
                            );
                          }
                          // controller,
                          );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: myText(
                        text: "Categories",
                        color: Colors.black,
                        fontSize: 16,
                        weight: FontWeight.w800),
                  ),
                ),
                controller.getcategorys.isTrue
                ? Container(
                  width: 1.sw,

                  color:  const Color(0xFFC9E8EE),
                  child:  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics:
                    const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 2.0,

                    children: List.generate(
                        categorieslist.length>=8 ?8: categorieslist.length, (index) {
                      return InkWell(
                        onTap: (){
                          controller.currentindex.value = 1;
                          controller.getSubCategories(categoryname: categorieslist[index].name!);
                          controller.categoryinitindex.value=index;

                          Navigator.of(context).pushReplacement(
                            FadePageRoute(page: const dashboard()),
                          );

                        },
                        child: CategoryList(model: categorieslist[index],size: 0.16.sw,imagewidth: 0.16.sw,fontsize: 10),
                      );
                    }),
                  ),
                )
                    : FutureBuilder(
                  future: controller.getCategories() ,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done){
                      return Container(
                        width: 1.sw,
                        height: 260,
                        color:  const Color(0xFFC9E8EE),
                        child:  GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          physics:
                          const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.1,
                          children: List.generate(
                              categorieslist.length>=8 ?8: categorieslist.length, (index) {
                            return InkWell(
                              onTap: (){
                                Get.to(()=> const productsincategoriey( ),arguments: categorieslist[index],transition: Transition.size,curve: Curves.bounceInOut,duration: const Duration(milliseconds: 500));
                              },
                              child: CategoryList(model: categorieslist[index],size: 70,imagewidth: 70,fontsize: 12),
                            );
                          }),
                        ),
                      );
                    }
                   else{
                     return Shimmer(
                       gradient: LinearGradient(
                     colors: [
                     Colors.grey[300]!,
                       Colors.grey[100]!,
                       Colors.grey[300]!
                       ],
                       stops: const [0.4, 0.5, 0.6],
                     ),
                       child: Container(
                         width: 1.sw,
                         height: 130,
                         color:  const Color(0xFFC9E8EE),
                       ),
                     );
                    }
                  },

                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Container(

                        padding: const EdgeInsets.all(2),
                        decoration: ShapeDecoration(
                          color: const Color(0x33EF4444),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      child: myText(
                          text: "02",
                          color: const Color(0xFFDC2626),
                          fontSize: 12,
                          weight: FontWeight.w500),

                      ),
                      const SizedBox(width: 3),
                      myText(
                          text: ":",
                          color:const Color(0xFFDC2626),
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const SizedBox(width: 3),
                      Container(

                        padding: const EdgeInsets.all(2),
                        decoration: ShapeDecoration(
                          color: const Color(0x33EF4444),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: myText(
                            text: "45",
                            color: const Color(0xFFDC2626),
                            fontSize: 12,
                            weight: FontWeight.w500),

                      ),
                      const SizedBox(width: 3),
                      myText(
                          text: ":",
                          color:const Color(0xFFDC2626),
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const SizedBox(width: 3),
                      Container(

                        padding: const EdgeInsets.all(2),
                        decoration: ShapeDecoration(
                          color: const Color(0x33EF4444),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: myText(
                            text: "20",
                            color: const Color(0xFFDC2626),
                            fontSize: 12,
                            weight: FontWeight.w500),

                      ),
                      const SizedBox(width: 15),
                      myText(
                          text: "Flash sales",
                          color: Colors.black,
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const Spacer(),
                      TextButton(onPressed: (){}, child: myText(
                          text: "See all",
                          color: Colors.black,
                          fontSize: 12,
                          weight: FontWeight.w400),)
                    ],
                  ),
                ),

                SizedBox(
                  height:292,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Get.to(()=>const productdetails());
                        },
                          child: productlisthoriz(image: imagesprod[index]));
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesprod.length,
                  ),
                ),

                CarouselSlider(
                  //carouselController: bordcon,
                  items: List.generate(bannerimages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildBanner2(model: bannerimages[index],position: carusalindex2, count: bannerimages.length),
                    );
                  }),
                  options: CarouselOptions(
                    reverse: false,
                    initialPage: carusalindex2,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        carusalindex2=index;
                      });
                    },
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      myText(
                          text: "UAE Sellers",
                          color: Colors.black,
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const Spacer(),
                      TextButton(onPressed: (){
                        controller.currentindex.value = 2;
                        controller.Selectedvendor.value = 1;

                        Navigator.of(context).pushReplacement(
                          AnimationsRouteltr(page: const dashboard()),
                        );
                      }, child: myText(
                          text: "See all",
                          color: Colors.black,
                          fontSize: 12,
                          weight: FontWeight.w400),)
                    ],
                  ),
                ),
                SizedBox(
                  height:292,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return productlisthoriz(image: imagesprod[index]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesprod.length,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                  Container(
                    width: 1.sw,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(
                            2,
                            4,
                          ),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(image: AssetImage("assets/fur.jpg"),fit: BoxFit.cover,)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          myText(
                              text: "For Today's ",
                              color: Colors.white,
                              fontSize: 17,
                              weight: FontWeight.w700),
                          myText(
                              text: "Furnishing",
                              color: Colors.white,
                              fontSize: 17,
                              weight: FontWeight.w700),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(

                            child: Container(
                              width: 102,
                              height: 30,

                              decoration: ShapeDecoration(
                                color: const Color(0xFF51B4C7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: myText(
                                    text: 'Shop Now',
                                    color: Colors.white,
                                    fontSize: 12,
                                    weight: FontWeight.w600),
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
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      myText(
                          text: "International Sellers",
                          color: Colors.black,
                          fontSize: 16,
                          weight: FontWeight.w800),
                      const Spacer(),
                      TextButton(onPressed: (){
                        controller.currentindex.value = 2;
                        controller.Selectedvendor.value = 0;

                        Navigator.of(context).pushReplacement(
                          AnimationsRouteltr(page: const dashboard()),
                        );
                      }, child: myText(
                          text: "See all",
                          color: Colors.black,
                          fontSize: 12,
                          weight: FontWeight.w400),)
                    ],
                  ),
                ),
                SizedBox(
                  height:292,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return productlisthoriz(image: imagesprod[index]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesprod.length,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return perlist(imge: sttt[index]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: sttt.length,
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
