import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tiffany/reusable/components.dart';

import '../Controller/appcontroller.dart';
void showToast(BuildContext context,String title,String subtitle) {
AchievementView(
alignment: Alignment.center,
  title: title,
  color: Colors.white.withOpacity(0.5),
  icon: const Icon(Icons.error,color: Colors.red,),
  isCircle: false,
  duration: const Duration(seconds: 1),
  subTitle: subtitle,
  listener: (status){},
  textStyleSubTitle: const TextStyle(
    fontSize: 12,
    color: Colors.black
  ),
  textStyleTitle:  const TextStyle(
      fontSize: 12,
      color: Colors.black
  ),

).show(context);
}
List colors = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.green,];
Widget colorsproduct(
        {required void Function()? onTap,
        required int index,
          required Color color,
        required int selected}) =>
    InkWell(
      onTap: onTap,
      child: index == selected
          ?CircleAvatar(
        radius: 15,
        backgroundColor:const Color(0xffE2E3E9),
        child: CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
      ):CircleAvatar(
      radius: 8,
      backgroundColor: color,
    ),

    );

Widget productlistimg({
  required String image,
  required int index,
  required int selected,
  required void Function()? onTap,
})=> InkWell(
  onTap: onTap,
  child:selected==index
      ? Container(
    width: 50,
    height: 50,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF5179C7)),
        borderRadius: BorderRadius.circular(5),
      ),

    ),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image(image: AssetImage(image),fit: BoxFit.cover,)),

  )
      :Stack(
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF5179C7)),
            borderRadius: BorderRadius.circular(5),
          ),

        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(image: AssetImage(image),fit: BoxFit.cover,)),

      ),
      Container(
        width: 50,height: 50,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),

      )
    ],
  ),
);
List sizes = ["S", "M", "L", "XL"];
Widget sizesall({
  required void Function()? onpress,
  required int index,
  required String size,
  required int selected,
})=> InkWell(
  onTap: onpress,
  child: Container(
    width: 36,
    height: 36,
    decoration: selected==index
        ?ShapeDecoration(
      color: const Color(0xFF51B4C7),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(8),
      ),
    )
    :ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: Center(
        child: myText(text:size , color: selected==index ?Colors.white :Colors.black, fontSize: 16, weight: FontWeight.w400)

    ),
  ),
);

Widget searchbar({
  required void Function()? onTap,
})=>
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
        onTap:onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Badge(
            label:  const Text("2"),
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
);


Widget locationbar({
  required appController controller,
  required BuildContext context,
})=>
    Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      myText(
          text: "Ship To",
          color: Colors.black.withOpacity(0.53),
          fontSize: 12,
          weight: FontWeight.w500),
      SizedBox(
        width: 0.03.sw,
      ),
      const Icon(
        Icons.location_on_rounded,
        size: 20,
        color: Color(0xff2563EB),
      ),
      SizedBox(
        width: 0.01.sw,
      ),
      controller.getlocation.isTrue
          ? myText(
          text: "$currentarea , $currentemarite",
          color: Colors.black,
          fontSize: 12,
          weight: FontWeight.bold)
          : FutureBuilder(
        future: controller.getposition(context: context),
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.done) {
            return myText(
                text: "$currentarea , $currentemarite",
                color: Colors.black,
                fontSize: 12,
                weight: FontWeight.bold);
          } else {
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
                height: 0.01.sh,
                color: Colors.white,
                child: myText(
                    text: "          ",
                    color: Colors.black,
                    fontSize: 17,
                    weight: FontWeight.w500,
                    softWrap: true,
                    maxLines: 2,
                    align: TextAlign.center,
                    overflow: TextOverflow.clip),
              ),
            );
          }
        },
      ),
      SizedBox(
        width: 0.01.sw,
      ),
      const Icon(
        Icons.arrow_drop_down_circle_outlined,
        size: 15,
        color: Colors.black,
      ),
    ],
  ),
);

Widget socialIcons({
  required IconData icon,
  required void Function()? onPressed,

})=>
    Padding(
  padding: const EdgeInsets.symmetric(horizontal:4.0),
  child: InkWell(
    onTap: onPressed,
    child: Container(
        width: 1.sw/15,
        height: 1.sw/15,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color:Colors.black),
          borderRadius: BorderRadius.circular(1.sw/15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child:Icon(icon,size: 1.sw/22,)
        )),
  ),
);


List infodata=["Processor","Grapich","Memory","Display","Storage","OS",];
List datainfo=["Core i7 10234","Nvidia MX250","16GB DDR4","IPS 13 inc, FHD","1TB SSD NVMI","Win 10 Home",];
Widget listinfo({required String info,required String data})=>Row(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 100,
        child: myText(
            text: info,
            color: Colors.black,
            fontSize: 11,
            weight: FontWeight.w300),
      ),
    ),
    SizedBox(width: 50),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: myText(
          text: data,
          color: Colors.black,
          fontSize: 11,
          weight: FontWeight.w300),
    ),

  ],
);
