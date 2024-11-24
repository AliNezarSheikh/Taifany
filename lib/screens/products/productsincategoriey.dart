import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tiffany/Controller/appcontroller.dart';
import 'package:tiffany/Models/subCategoryModel.dart';
import 'package:tiffany/reusable/components.dart';

import '../Cartandpay/Cart.dart';

class productsincategoriey extends StatefulWidget {
  const productsincategoriey({super.key});

  @override
  State<productsincategoriey> createState() => _productsincategorieyState();
}

class _productsincategorieyState extends State<productsincategoriey> {
  appController controller = Get.put(appController());
  subcatmodel? model;
  int carusalindex=0;
  @override
  void initState() {
    super.initState();
    model = Get.arguments;
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          title: Text(
            '${model!.name}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          //automaticallyImplyLeading: false,
        ),
        body:  Obx(
          ()=>
              Container(
              width: 1.sw,
              height: 1.sh,
              color: const Color(0xffEEF9F5),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(

                            child: TextFormField(
                              // controller: controller,

                              keyboardType: TextInputType.text,

                              //  validator: validator,

                              decoration: const InputDecoration(
                                fillColor: Color(0xffffffff),
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
                          onTap: (){
                            controller.changeview();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: controller.gridview.value?
                            Image(image: const AssetImage("assets/grid.png"),width: 0.08.sw,fit: BoxFit.cover,)
                                :Image(image: const AssetImage("assets/list.png"),width: 0.08.sw,fit: BoxFit.cover,)

                          ),
                        ),


                        InkWell(
                          onTap: (){
                            Get.to(()=>const CartScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Badge(
                              label: const Text("2"),
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 0.08.sw,
                                color: const Color(0xff51B4C7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  const SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonproduct(onTap: (){}, text: "Filter", icon:  Icons.filter_alt_outlined,),

                          buttonproduct(onTap:  (){
                            showModalBottomSheet(
                              context: context,

                              enableDrag: true,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 0.5.sh,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),),
                                    border: Border.all(color: Colors.grey, width: 1),

                                  ),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16.0),
                                        child: myText(text: "Sorting", color: Colors.black, fontSize: 21, weight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 0.3.sh,
                                        child: ListView.builder(
                                          itemCount: sorts.length, // Change this to the number of radio buttons you want
                                          itemBuilder: (context, index) {
                                            return Obx(
                                                  ()=> RadioListTile(
                                                title: Text(sorts[index]),
                                                value: "${sorts[index]}",
                                                groupValue: controller.selectedValue.value, // _selectedValue should be a variable to hold the selected radio button value
                                                onChanged: (value) {
                                                  setState(() {
                                                    //  print(value);
                                                    controller.selectedValue.value= value!;
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 0.0 , horizontal: 12.0),
                                            child: InkWell(
                                              onTap: () async {
                                                controller.selectedValue.value="";
                                                Get.to(()=>const productsincategoriey(),arguments: model,transition: Transition.zoom,curve: Curves.slowMiddle,duration: const Duration(seconds: 1));
                                                Get.back();
                                              },
                                              child: Container(
                                               width: 0.3.sw,
                                               height: 0.06.sh,

                                                decoration: BoxDecoration(
                                                  color: const Color(0xffAFDDE5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.8),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      offset: const Offset(
                                                        2,
                                                        1,
                                                      ),
                                                    ),
                                                  ],
                                                  borderRadius: BorderRadius.circular(10.0),

                                                ),
                                                child: Center(
                                                    child: myText(
                                                        text: "Reset",
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        weight: FontWeight.normal)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 0.0 , horizontal: 12.0),
                                            child: InkWell(
                                              onTap: () async {

                                                Get.to(()=>const productsincategoriey(),arguments: model,transition: Transition.zoom,curve: Curves.slowMiddle,duration: const Duration(seconds: 1));
                                                Get.back();
                                              },
                                              child: Container(
                                               width: 0.5.sw,
                                                height: 0.06.sh,

                                                decoration: BoxDecoration(
                                                  color: const Color(0xff51B4C7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.8),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      offset: const Offset(
                                                        2,
                                                        1,
                                                      ),
                                                    ),
                                                  ],
                                                  borderRadius: BorderRadius.circular(10.0),

                                                ),
                                                child: Center(
                                                    child: myText(
                                                        text: "Apply",
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        weight: FontWeight.w600)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  /* Column(
                                          children: [
                                            ListView.builder(
                                              itemCount: 3, // Change this to the number of radio buttons you want
                                              itemBuilder: (context, index) {
                                                return RadioListTile(
                                                  title: Text('Radio Button $index'),
                                                  value: index,
                                                  groupValue: "_selectedValue", // _selectedValue should be a variable to hold the selected radio button value
                                                  onChanged: (value) {
                                                    setState(() {
                                                     // _selectedValue = value;
                                                    });
                                                  },
                                                );
                                              },
                                            ),

                                          ],
                                        ),
                                                */
                                );
                              },
                            );
                          }, text: "Sorts", icon:  Icons.sort_rounded,),

                          buttonproduct(onTap: (){}, text: "Size", icon: CupertinoIcons.arrowtriangle_down_fill, ),
                          buttonproduct(onTap: (){}, text: "Color", icon:   CupertinoIcons.arrowtriangle_down_fill, ),
                          buttonproduct(onTap: (){}, text: "Pattern", icon: CupertinoIcons.arrowtriangle_down_fill,),



                        ],
                      ),
                  ),
                  const SizedBox(height: 10),
                  controller.gridview.value?
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
                        itemCount: imagesprod.length,
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
                                  child: productlist(
                                      image: imagesprod[index])),
                            ),
                          );
                        }),
                  )
                      : AnimationLimiter(
                        child: GridView.count(
                                            crossAxisCount: 2,
                                            shrinkWrap: true,
                                            physics: const BouncingScrollPhysics(),
                                            mainAxisSpacing: 0.0,
                                            crossAxisSpacing: 0.0,

                                           childAspectRatio: 1 / 1.59,

                                            // Replace with your desired number of shimmer items
                                            children: List.generate(
                        imagesprod.length,
                        (index) {
                          return AnimationConfiguration
                              .staggeredGrid(
                            position: index,
                            columnCount: 2,
                            delay: const Duration(milliseconds: 100),

                            child: ScaleAnimation(
                                duration: const Duration(
                                    milliseconds: 1200),
                                curve: Curves
                                    .fastLinearToSlowEaseIn,
                                child: FadeInAnimation(child: productgridtest(image: imagesprod[index]))),
                          );
                        },
                                            ),
                                          ),
                      ),
                ]),
              ),

              /*Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                               Radius.circular(10.0),

                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.only(
                                     topRight:  Radius.circular(10.0),
                                     topLeft:  Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Image(image: AssetImage("assets/try.jpg"))),
                              SizedBox(height: 0.005.sh,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: myText(
                                    text: "Product Name",
                                    color: Colors.black,
                                    fontSize: 11,
                                    weight: FontWeight.w600,
                                align: TextAlign.start),
                              ),
                              SizedBox(height: 0.005.sh,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(

                                  children: [
                                    myText(
                                        text: "AED  1000",
                                        color: Colors.black,
                                        fontSize: 10,
                                        weight: FontWeight.w400),
                                    SizedBox(width: 0.02.sw,),
                                    Text("2000", style: GoogleFonts.getFont('Roboto').copyWith(
                                      color: Color(0xffC7C7CC),
                                      fontSize: 7,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.lineThrough,

                                    ))

                                  ],
                                ),
                              ),
                              SizedBox(height: 0.005.sh,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(

                                  children: [
                                    Icon(Icons.star, color: Color(0xffFFCB05),size: 12,),
                                    myText(
                                        text: "4.5",
                                        align: TextAlign.end,
                                        color: Colors.black,
                                        fontSize: 8,
                                        weight: FontWeight.w300),
                                    SizedBox(width: 0.13.sw,),
                                    Icon(Icons.favorite_border, color: Color(0xff51B4C7),size: 12,),
                                    SizedBox(width: 0.015.sw,),
                                    Icon(Icons.add_shopping_cart_rounded, color: Color(0xff51B4C7),size: 12,),


                                  ],
                                ),
                              ),
                              SizedBox(height: 0.005.sh,),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Image(image: AssetImage("assets/off20.png")),
                      )
                    ],
                  ),
                ],
              )*/
            ),
        ),

      )
    ;
  }
}
