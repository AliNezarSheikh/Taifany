import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../reusable/comp2.dart';
import '../../reusable/components.dart';
import '../Cartandpay/Cart.dart';

class productdetails extends StatefulWidget {
  const productdetails({super.key});

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  int initcolor=0;
  int initimge=0;
  int initsize=0;
  double initrating=4.0;
  bool open1=false;
  bool open2=false;
  bool open3=false;
  List cate=["Fashion","Men"];
  List tags=["Tshirt","Longsleve","Shirt"];
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

        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
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
        //automaticallyImplyLeading: false,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xffEEF9F5),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: 1.sw,
                    height: 1.sw,
                  color: const Color(0xfff8f8f8),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                             width: 0.2.sw,

                              child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index){
                                  return colorsproduct(
                                    color: colors[index],
                                    index: index,
                                    selected: initcolor,
                                    onTap: (){
                                      setState(() {
                                        initcolor=index;
                                      });
                                    }
                                  );

                                  }, separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 15,
                                  );
                              },),
                            ),
                            const Spacer(flex: 1,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 48.0),
                              child: Image(image: AssetImage(imagesprod[initimge]),width: 0.6.sw,),
                            ),
                            const Spacer(flex: 1,),
                            const Column(

                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 48),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xffE2E3E9),
                                    child: Center(
                                      child: Icon(Icons.share,color: Color(0xff51B4C7),),
                                    ),
                                  ),
                                ),

                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xffE2E3E9),
                                  child: Center(
                                    child: Icon(Icons.favorite_border,color: Color(0xff51B4C7),),
                                  ),
                                ),

                              ],
                            ),
                            const Spacer(flex: 1,),
                          ],
                        )
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: SizedBox(
                            height: 50,
                            child:ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return productlistimg(
                                  index: index,
                                  image: imagesprod[index],
                                  selected: initimge,
                                  onTap: (){
                                    setState(() {
                                      initimge=index;
                                    });
                                  }
                                );

                              }, separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                width: 15,
                              );
                            },),
                          ),
                        )
                      )

                    ]
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: myText(text: "Mercedes-AMG Petronas Motorsport Formula One MT7 Mens T-Shirt",
                        color: Colors.black, fontSize: 16, weight: FontWeight.w400,maxLines: 2,softWrap: true,overflow: TextOverflow.clip),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            height: 40,
                            width: 100,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return  index+1<=initrating.ceil()? const Icon(Icons.star,color: Colors.yellow,size: 20,):const Icon(Icons.star,color: Colors.grey,size: 20,);
                                },
                                separatorBuilder:(context,index){ return const SizedBox(width: 1,);},
                                itemCount: 5),
                          ),
                        ),
                      myText(
                            text:initrating.toString(),
                            color: Colors.black, fontSize: 13, weight: FontWeight.w300),
                        SizedBox(width: 0.3.sw,),
                      myText(
                            text: "124 reviews",
                            color: const Color(0xff9A9DB1), fontSize: 13, weight: FontWeight.w300),
                        const SizedBox(width: 5,),
                        const Icon(Icons.arrow_forward_ios_sharp, color: Color(0xff9A9DB1), size: 15,)


                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 1.sw,
                      height: 1,
                      color: const Color(0xffAFDDE5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        myText(
                            text:"Size :",
                            color: Colors.black, fontSize: 16, weight: FontWeight.w400),
                       SizedBox(width: 0.4.sw,),

                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            height: 36,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return sizesall(
                                    onpress: (){
                                      setState(() {
                                        initsize=index;
                                      });
                                    },
                                    index: index,
                                    selected: initsize,
                                    size: sizes[index],
                                  );
                                },
                                separatorBuilder:(context,index){ return const SizedBox(width: 10,);},
                                itemCount: sizes.length),
                          ),
                        ),




                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 1.sw,
                      height: 1,
                      color: const Color(0xffAFDDE5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 2),
                    child: myText(
                        text:"Description",
                        color: Colors.black, fontSize: 16, weight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 6),
                    //substring 250 char
                    child: myText(
                        text:"Design is an evolutionary process, and filler text is just one tool in your progress-pushing arsenal. Relax and do whatever fits with your design process. Don’t set a lot of restrictive hard-and-fast rules distract designers and design.",
                        color: Color(0xFF353535), fontSize: 13, weight: FontWeight.w400,
                    maxLines: 5,softWrap: true,overflow: TextOverflow.clip,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12),
                    child: Row(
                      children: [
                        myText(
                            text:"Categories ",
                            color: Colors.black, fontSize: 12, weight: FontWeight.w400),
                        const SizedBox(width: 40,),
                        myText(
                            text:" :",
                            color: Colors.black, fontSize: 12, weight: FontWeight.w400),
                        const SizedBox(width: 40,),
                        for(int i=0;i<cate.length;i++)
                          i==cate.length-1
                              ?myText(
                              text:cate[i],
                              color: Colors.black, fontSize: 12, weight: FontWeight.w600)
                              :myText(
                              text:cate[i]+",",
                              color: Colors.black, fontSize: 12, weight: FontWeight.w600),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 0),
                    child: Row(
                      children: [
                        myText(
                            text:"Tags ",
                            color: Colors.black, fontSize: 12, weight: FontWeight.w400),
                        const SizedBox(width: 85,),
                        myText(
                            text:" :",
                            color: Colors.black, fontSize: 12, weight: FontWeight.w400),
                        const SizedBox(width: 40,),
                        for(int i=0;i<tags.length;i++)
                          i==tags.length-1
                              ?myText(
                              text:"#"+tags[i],
                              color: Colors.black, fontSize: 12, weight: FontWeight.w600)
                              :myText(
                              text:"#"+tags[i]+",",
                              color: Colors.black, fontSize: 12, weight: FontWeight.w600),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              setState(() {
                                open1=!open1;
                              });
                            },
                            icon: open1 ?Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20,)) :Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20,)
                        ),
                        myText(
                            text:"Specification",
                            color: Colors.black, fontSize: 13, weight: FontWeight.w500),

                      ]
                    ),
                  ),
                  open1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:48.0),
                    child: Container(
                      width: 1.sw,
                      height: 200,
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return listinfo(info: infodata[index], data: datainfo[index]);
                          },
                          separatorBuilder: (context,index){
                            return const Divider(color: Color(0xFFAFDDE5),);
                          },
                          itemCount: 6),
                    ),
                  ):SizedBox(height: 0,),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  open2=!open2;
                                });
                              },
                              icon: open2 ?Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20,)) :Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20,)
                          ),
                          myText(
                              text:"Composition and Care",
                              color: Colors.black, fontSize: 13, weight: FontWeight.w500),

                        ]
                    ),
                  ),
                  open2?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:48.0),
                    child: Container(
                      width: 1.sw,
                      height: 200,
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return listinfo(info: infodata[index], data: datainfo[index]);
                          },
                          separatorBuilder: (context,index){
                            return const Divider(color: Color(0xFFAFDDE5),);
                          },
                          itemCount: 6),
                    ),
                  ):SizedBox(height: 0,),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  open3=!open3;
                                });
                              },
                              icon: open3 ?Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20,)) :Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20,)
                          ),
                          myText(
                              text:"Shipping and Return",
                              color: Colors.black, fontSize: 13, weight: FontWeight.w500),

                        ]
                    ),
                  ),
                  open3?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:48.0),
                    child: Container(
                      width: 1.sw,
                      height: 200,
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return listinfo(info: infodata[index], data: datainfo[index]);
                          },
                          separatorBuilder: (context,index){
                            return const Divider(color: Color(0xFFAFDDE5),);
                          },
                          itemCount: 6),
                    ),
                  ):SizedBox(height: 0,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 1.sw,
                      height: 1,
                      color: const Color(0xffAFDDE5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: myText(
                        text: "Seller Reviews",
                        color: Colors.black,
                        fontSize: 15,
                        weight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                               ),
                              child: Image(
                                   fit: BoxFit.contain,
                                    image: AssetImage("assets/brand/brand1.png",),
                                    ),

                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                            myText(
                                text: "Seller Name",
                                color: Colors.black, fontSize: 13,
                                weight: FontWeight.w400),
                              SizedBox(height: 5,),
                              myText(
                                  text: "248 Reviews",
                                  color: Colors.black, fontSize: 10,
                                  weight: FontWeight.w300)
                            ],
                          ),
                        ),
                        Spacer(),
                        myText(
                            text: "4.8 Out of 5.0 ",
                            color: Colors.black,
                            fontSize: 14,
                            weight: FontWeight.w600)
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 1.sw,
                      height: 1,
                      color: const Color(0xffAFDDE5),
                    ),
                  ),
                  SizedBox(height: 100,),






                ]
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 1.sw,
                height: 100,

                    color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF74C3D2)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Center(
                            child: myText(
                                text: "Add To Cart",
                                color: Color(0xFF51B4C7),
                                fontSize: 16,
                                weight: FontWeight.w500,
                                align: TextAlign.center),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Color(0xFF51B4C7),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF74C3D2)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Center(
                            child: myText(
                                text: "Buy Now",
                                color: Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w500,
                                align: TextAlign.center),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
