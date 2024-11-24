import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tiffany/reusable/components.dart';

import '../screens/Cartandpay/addcard.dart';
import '../screens/address/addaddress.dart';

class DynamicTextSplit extends StatelessWidget {
  final String text;

  const DynamicTextSplit(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');
    String firstLine = '';
    String secondLine = '';

    if (text.length > 8) {
      if (words.length > 1) {
        firstLine = "${words[0]}\n${words[1]} ${words[2]}" ;
        //secondLine =;
      }
    } else {
      firstLine = text;
    }

    return  myText(text: firstLine, color: Colors.black, fontSize: 12, weight: FontWeight.w500);
    /*Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(firstLine),
        //  if (secondLine.isNotEmpty) Text(secondLine),

       if (secondLine.isNotEmpty)  myText(text: secondLine, color: Colors.black, fontSize: 12, weight: FontWeight.w500),
      ],
    );*/
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    for (int i = 0; i < 6; i++) {
      double angle = 2 * pi / 6 * (i + 0.5);
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HexagonClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width * 0.25, 0.0);
    path.lineTo(size.width * 0.75, 0.0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.lineTo(0.0, size.height * 0.5);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


Widget test1()=>
    Container(
  child: AnimationLimiter(
    child: GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics:
      const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      mainAxisSpacing: 30.0,
      crossAxisSpacing: 1.0,
      childAspectRatio: 1 / 1.41,
      children: List.generate(categorieslist.length, (index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 1000),
          columnCount: 2,
          child: ScaleAnimation(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.fastLinearToSlowEaseIn,
            child: FadeInAnimation(
              child: InkWell(
                onTap: (){
                 // Get.to(()=> productsincategoriey( ),arguments: categorieslist[index],transition: Transition.size,curve: Curves.bounceInOut,duration: const Duration(milliseconds: 500));
                },
                child: CategoryList(model: categorieslist[index],size: 120,imagewidth: 105,fontsize: 17),
              ),
            ),
          ),
        );
      }),
    ),
  ),
);

Widget test2()=>AnimationLimiter(
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
);
Widget test3()=>AnimationLimiter(
  child: GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    mainAxisSpacing: 10.0,
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
);
List paymethodtext=["Apple pay","Google pay","Pay Pal","Debit / Credit Card","Taifany points","Cash on delivery"];
List paymethodimage=["assets/applepay.png","assets/Gpay.png","assets/paypal.png","assets/credit.png","assets/tiphanypay.png","assets/cash.png"];
Widget address()=>Column(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          myText(
              text: "Address",
              color: Colors.black,
              fontSize: 17,
              weight: FontWeight.w600),
          const Spacer(),
          InkWell(
            onTap: (){
              Get.to(()=> const addaddress());
            },
            child: Container(
              decoration: ShapeDecoration(
                color: const Color(0xFF51B4C7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                child: myText(text: "New Address", color: Colors.white, fontSize: 11, weight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    ),
    ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          );
        },
        itemCount: 3,//listship.length,
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
            child: Container(
                child:Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myText(text: "Ramees 1", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                            SizedBox(height: 0.01.sh,),
                            myText(text: "3012 Broaddus Avenue Saint Joseph, California 4908", color: const Color(0xFF8E8E93), fontSize: 11, weight: FontWeight.w500,maxLines: 2,softWrap: true,overflow: TextOverflow.clip),
                            SizedBox(height: 0.01.sh,),
                            myText(text: "+971 123456789", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                          ]
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Radio(
                          activeColor:const Color(0xFF51B4C7),
                          value: index==0?true:false,
                          groupValue: true,
                          onChanged: ( val){

                          }),
                    ),
                  ],
                )
            ),
          );
        }),


  ],
);
Widget Paymentmethods()=>Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            myText(
                text: "Payments method",
                color: Colors.black,
                fontSize: 17,
                weight: FontWeight.w600),

          ],
        ),
      ),
      SizedBox(height: 0.01.sh),
      ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            );
          },
          itemCount: paymethodtext.length,
          itemBuilder: (context, index) {

            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(duration: const Duration(milliseconds: 3000), curve: Curves.fastLinearToSlowEaseIn, flipAxis: FlipAxis.y,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                      child: Container(
                          child:index != 3
                              ?Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Image(image: AssetImage(paymethodimage[index]),width: 0.15.sw,fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 0.02.sw,),
                              myText(text: paymethodtext[index], color: Colors.black, fontSize: 14, weight: FontWeight.w400),
                              const Spacer(),
                              Radio(
                                  activeColor:const Color(0xFF51B4C7),
                                  value: index==0?true:false,
                                  groupValue: true,
                                  onChanged: ( val){

                                  }),
                            ],
                          )
                              : Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                    child: Image(image: AssetImage(paymethodimage[index]),width: 0.15.sw,fit: BoxFit.cover,),
                                  ),
                                  SizedBox(width: 0.02.sw,),
                                  myText(text: paymethodtext[index], color: Colors.black, fontSize: 14, weight: FontWeight.w400),
                                  const Spacer(),
                                  Radio(
                                      activeColor:const Color(0xFF51B4C7),
                                      value: index==0?true:false,
                                      groupValue: true,
                                      onChanged: ( val){

                                      }),
                                ],
                              ),
                              SizedBox(height: 0.01.sh,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(image: AssetImage("assets/Visa.png"),),
                                  SizedBox(width: 0.01.sw,),
                                  const Image(image: AssetImage("assets/mastercard.png"),),
                                  SizedBox(width: 0.01.sw,),
                                  const Image(image: AssetImage("assets/american.png"),),
                                  SizedBox(width: 0.01.sw,),
                                  const Image(image: AssetImage("assets/jcb.png"),),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 100),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myText(text: "**** 1234", color: Colors.black, fontSize: 11, weight: FontWeight.w400),
                                    const Spacer(),
                                    Container(
                                      width: 60,height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextFormField(
                                        // controller: controller,

                                        keyboardType: TextInputType.number,

                                        //  validator: validator,

                                        decoration: const InputDecoration(
                                          fillColor: Colors.transparent,
                                          filled: true,
                                          hintText: "CVV",
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
                                            color: Color(0xFFBEBBBB),
                                            fontSize: 11,

                                            fontWeight: FontWeight.w300,
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
                                  ],

                                ),
                              ),
                              SizedBox(height: 0.01.sh,),
                              Row(
                                children: [
                                  const Spacer(
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.to(()=>addcard(),transition: Transition.fade,curve: Curves.easeInOut,duration: const Duration(seconds: 1));
                                    },
                                    child: Container(

                                      decoration: const BoxDecoration(
                                        color: Color(0xFF51B4C7),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),

                                            myText(
                                                text: "Add a new card",
                                                color: Colors.white,
                                                fontSize: 11,
                                                weight: FontWeight.w400),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                      ),
                    )),
              ),
            );
          }),
    ]
);
Widget placeorder()=> Column(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          child:Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myText(text: "Ramees 1", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                        SizedBox(height: 0.01.sh,),
                        myText(text: "3012 Broaddus Avenue Saint Joseph, California 4908", color: const Color(0xFF8E8E93), fontSize: 11, weight: FontWeight.w500,maxLines: 2,softWrap: true,overflow: TextOverflow.clip),
                        SizedBox(height: 0.01.sh,),
                        myText(text: "+971 123456789", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                      ]
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Radio(
                        activeColor:const Color(0xFF51B4C7),
                        value: true,
                        groupValue: true,
                        onChanged: ( val){

                        }),
                    SizedBox(height: 0.01.sh,),
                    myText(text: "Change", color: const Color(0xFF51B4C7), fontSize: 13, weight: FontWeight.w400)
                  ],
                ),
              ),
            ],
          )
      ),
    ),
    SizedBox(height: 0.02.sh,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    myText(text: "Card NO", color: Colors.black, fontSize: 13, weight: FontWeight.w400),
                    SizedBox(width: 0.04.sw,),
                    myText(text: ":", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                    const Spacer(),
                    myText(text: "1234 20**  ****  1234", color: Colors.black, fontSize: 13, weight: FontWeight.w600),



                  ],
                ),
                SizedBox(height: 0.02.sh,),
                Row(
                  children: [
                    myText(text: "Exp. Date", color: Colors.black, fontSize: 13, weight: FontWeight.w400),
                    SizedBox(width: 0.04.sw,),
                    myText(text: ":", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                    SizedBox(width: 0.04.sw,),
                    myText(text: "10/25", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                    SizedBox(width: 0.2.sw,),

                    myText(text: "CVV", color: Colors.black, fontSize: 12, weight: FontWeight.w400),
                    const Spacer(),
                    myText(text: "***", color: Colors.black, fontSize: 13, weight: FontWeight.w600),



                  ],
                )
              ],
            ),
          )


        /*Row(
                         children: [
                           Expanded(
                             flex: 3,
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     myText(text: "Ramees 1", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                                     SizedBox(height: 0.01.sh,),
                                     myText(text: "3012 Broaddus Avenue Saint Joseph, California 4908", color: Color(0xFF8E8E93), fontSize: 11, weight: FontWeight.w500,maxLines: 2,softWrap: true,overflow: TextOverflow.clip),
                                     SizedBox(height: 0.01.sh,),
                                     myText(text: "+971 123456789", color: Colors.black, fontSize: 13, weight: FontWeight.w600),
                                   ]
                               ),
                             ),
                           ),

                         ],
                       )*/
      ),
    ),

  ],
);
