import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tiffany/Models/vendorModel.dart';

import '../../Controller/appcontroller.dart';
import '../../reusable/comp2.dart';
import '../../reusable/components.dart';
import '../Cartandpay/Cart.dart';

class vendordetails extends StatefulWidget {
  const vendordetails({super.key});

  @override
  State<vendordetails> createState() => _vendordetailsState();
}

class _vendordetailsState extends State<vendordetails> {
  appController controller = Get.put(appController());
  vendormodel? model;
  double initrating = 3.5;

  @override
  void initState() {
    super.initState();
    model = Get.arguments;

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
            child: Column(
              children: [
                Container(
                  height: 0.03.sh,
                  color: Colors.white,
                ),
                searchbar(onTap: () {
                  Get.to(() => const CartScreen());
                }),
                locationbar(context: context, controller: controller),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0.0),
                  child: SizedBox(
                    width: 1.sw,
                    height: 490,

                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: ShapeDecoration(

                                image: DecorationImage(
                                  image: NetworkImage(model!.banner!),
                                  fit: BoxFit.fill,

                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 48.0, right: 5, left: 5, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myText(
                                        text: model!.name!.toUpperCase(),
                                        color: Colors.black,
                                        fontSize: 20,
                                        weight: FontWeight.w600),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    model!.description!.length > 95
                                        ? myText(
                                            text: "${model!.description!
                                                    .substring(0, 95)}  .....",
                                            color: Colors.black,
                                            fontSize: 15,
                                            align: TextAlign.center,
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            weight: FontWeight.w400)
                                        : myText(
                                            text: model!.description!,
                                            color: Colors.black,
                                            fontSize: 15,
                                            align: TextAlign.center,
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            weight: FontWeight.w400),
                                    const SizedBox(
                                      height: 5,
                                    ),

                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Container(
                                              padding: const EdgeInsets.all(0.0),
                                              height: 20,
                                              width: 96,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return index + 1 <=
                                                            initrating.ceil()
                                                        ? const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 18,
                                                          )
                                                        : const Icon(
                                                            Icons.star,
                                                            color: Colors.grey,
                                                            size: 18,
                                                          );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return const SizedBox(
                                                      width: 1,
                                                    );
                                                  },
                                                  itemCount: 5),
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                            myText(text:initrating.toString(), color: Colors.black, fontSize: 13, weight: FontWeight.w300),

                                        ]),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Row(
                                      children: [
                                        socialIcons(
                                            icon: FontAwesome.facebook_f_brand,
                                            onPressed: () async {

                                             if (model!.facebook !=null ){
                                              await controller.openUrl(link:model!.facebook! ,context: context,name: "Facebook");
                                             }else{
                                               showToast(context, "Error", "No Facebook Link Found");
                                             }
                                            }),
                                        socialIcons(
                                            icon: FontAwesome.instagram_brand,
                                            onPressed:  () async {
                                             if (model!.instagram !=null ){
                                                await controller.openUrl(link: model!.instagram!,context: context,name: "Instagram");
                                            }
                                            }),
                                        socialIcons(
                                            icon: FontAwesome.x_twitter_brand,
                                            onPressed:  () async {
                                              if (model!.twitter !=null ){
                                                await controller.openUrl(link: model!.twitter!,context: context,name: "Twitter");
                                              }
                                            }),
                                        socialIcons(
                                            icon: FontAwesome.snapchat_brand,
                                            onPressed:  () async {
                                              if (model!.snapchat !=null ){
                                                await controller.openUrl(link: model!.snapchat!,context: context,name: "Snapchat");
                                              }
                                            }),
                                        socialIcons(
                                            icon: FontAwesome.tiktok_brand,
                                            onPressed: () async {
                                              if (model!.tiktok !=null ){
                                                await controller.openUrl(link: model!.tiktok!,context: context,name: "TikTok");
                                              }
                                            }),
                                        socialIcons(
                                            icon: FontAwesome.youtube_brand,
                                            onPressed:  () async {
                                              if (model!.youtube !=null ){
                                                await controller.openUrl(link: model!.youtube!,context: context,name: "Youtube");
                                              }
                                            }),

                                        const Spacer(
                                          flex: 1,
                                        ),
                                        InkWell(
                                          onTap: () {
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
                                                        padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 40.0),
                                                        child: myText(text: "Contact us", color: Colors.black, fontSize: 20, weight: FontWeight.w600),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 40.0,right: 40,bottom: 15),
                                                        child: Container(
                                                          child: TextFormField(
                                                            // controller: controller,

                                                            keyboardType: TextInputType.text,

                                                            //  validator: validator,

                                                            decoration: const InputDecoration(
                                                              fillColor: Color(0xFFF4F5F7),
                                                              filled: true,
                                                              hintText: "Name",
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

                                                              hintStyle: TextStyle(
                                                                color:  Color(0xFF8A8D9F),
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400,
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
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 40.0,right: 40,bottom: 15),
                                                        child: Container(
                                                          child: TextFormField(
                                                            // controller: controller,

                                                            keyboardType: TextInputType.text,

                                                            //  validator: validator,

                                                            decoration: const InputDecoration(
                                                              fillColor: Color(0xFFF4F5F7),
                                                              filled: true,
                                                              hintText: "Email",
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

                                                              hintStyle: TextStyle(
                                                                color:  Color(0xFF8A8D9F),
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w400,
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
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 40.0,right: 40,bottom: 15),
                                                        child: Container(
                                                          height: 90,
                                                          child: TextFormField(
                                                            // controller: controller,
                                                            expands: true,
                                                            keyboardType: TextInputType.multiline,
                                                            maxLines: null,

                                                             textAlignVertical: TextAlignVertical.top,
                                                            //  validator: validator,

                                                            decoration:  InputDecoration(
                                                              fillColor: Color(0xFFF4F5F7),
                                                              filled: true,
                                                              hintText: "Message",


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

                                                              hintStyle: TextStyle(
                                                                color:  Color(0xFF8A8D9F),
                                                                fontSize: 16,

                                                                fontWeight: FontWeight.w400,
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
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 9.0 , horizontal: 20.0),
                                                        child: InkWell(
                                                          onTap: () async {

                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            width: 1.sw,
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
                                                                    text: "Send Message",
                                                                    color: Colors.white,
                                                                    fontSize: 18,
                                                                    weight: FontWeight.w600)),
                                                          ),
                                                        ),
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
                                          },
                                          child: Container(
                                            width: 0.25.sw,

                                            decoration: ShapeDecoration(
                                              color: const Color(0xFF51B4C7),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .mark_unread_chat_alt_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  myText(
                                                      text: "Contact Us",
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      weight: FontWeight.w400)
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 42,
                              backgroundColor: const Color(0xFF51B4C7),
                              child: Stack(
                                children: [
                                  // The Circle Avatar
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.blue,
                                    child: ClipOval(
                                      child: Image.network(
                                        model!.logo!,
                                        fit: BoxFit.cover,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                  // The Inner Shadow
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.transparent,

                                          Colors.black.withOpacity(
                                              0.3), // Darker at the edges
                                          // Transparent at the center
                                        ],
                                        center: Alignment.center,
                                        radius: 0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                FutureBuilder(future: controller.getVendorbyname(name:model!.slug!),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                      if (snapshot.connectionState == ConnectionState.done){

                        if (productvendorlist.isNotEmpty){
                                return AnimationLimiter(
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,

                            childAspectRatio: 1 / 1.59,

                            // Replace with your desired number of shimmer items
                            children: List.generate(
                              productvendorlist.length,
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
                                      child: FadeInAnimation(child: productgrid(model: productvendorlist[index]))),
                                );
                              },
                            ),
                          ),
                        );
                        }else{
                          return Padding(
                            padding: const EdgeInsets.all(48.0),
                            child: SizedBox(
                              width: 1.sw,
                              child: const Center(
                               child:  Image(image: AssetImage("assets/noItem.png")),
                              ),
                            ),
                          );
                        }
                      }
                      else{
                        return const Padding(
                          padding: EdgeInsets.all(48.0),
                          child: Center(
                            child: CupertinoActivityIndicator(radius: 30,),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
