import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tiffany/Models/productModel.dart';
import 'package:tiffany/screens/Dashboard/dashboard.dart';
import 'package:validators/validators.dart';

import '../Controller/appcontroller.dart';
import '../Models/bannerModel.dart';
import '../Models/categoriesModel.dart';
import '../Models/dashboardmodel.dart';
import '../Models/subCategoryModel.dart';
import '../Models/vendorModel.dart';
import 'classfordesign.dart';

bool nav = false;
bool vis = true;
List<categoriesModel> categorieslist = [];
List<subcatmodel> subcategorieslist = [];
List sorts = [
  "Recommended",
  "New Arrivals",
  "Price: low to high",
  "Price: high to low",
  "A to Z",
  "Z to A"
];
Color onselectcolor = const Color(0xff51B4C7);
Position? currentlocation;
String currentemarite = "...";
String currentarea = "...";

Widget myText(
        {required String text,
        required Color color,
        required double fontSize,
        required FontWeight weight,
        TextAlign? align,
        bool? softWrap,
        int? maxLines,
        TextOverflow? overflow}) =>
    Text(
      text,
      textAlign: align,
      softWrap: softWrap ?? false,
      maxLines: maxLines,
      style: GoogleFonts.getFont('Poppins').copyWith(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: weight,
        overflow: overflow,
      ),
    );

Widget mybutton({
  required Function() onpress,
  required String name,
}) =>
    InkWell(
      onTap: onpress,
      child: Container(
        width: 0.7.sw,
        height: 0.13.sw,
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 0,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff0D3652),
              Color(0xff1D79A1),
            ],
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Center(
            child: myText(
                text: "Login",
                color: Colors.white,
                fontSize: 18,
                weight: FontWeight.w600)),
      ),
    );

Widget buildborditem2(
        {required PageController controller, void Function()? onTap}) =>
    Column(
      children: [
        const Expanded(
          child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 80),
                child: Image(image: AssetImage("assets/image.jpg")),
              )),
        ),
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff09253D),
                            Color(0xff2285AF),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      // height: 0.45.sh,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            myText(
                              fontSize: 24,
                              color: Colors.white,
                              text: "Welcome to TAIFANY",
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            myText(
                                align: TextAlign.center,
                                text:
                                    "Reference site about Lorem\nIpsum, giving information origins\nas well as a random",
                                color: Colors.white,
                                fontSize: 16,
                                weight: FontWeight.normal),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            InkWell(
                              onTap: onTap ??
                                  () {
                                    /*  if (islast) {
                                  // controller.isFirstTime.value=false;
                                  // FirstTime.write("isFirstTime",controller.isFirstTime.value);

                                  Navigator.pushAndRemoveUntil(

                                    context,

                                    FadeSlidePageRoute(page: signorlogin()),

                                        (Route<dynamic> route) => false,

                                  );

                                } else {
                                  bordcontroller.nextPage(
                                      duration: Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                }*/
                                  },
                              child: Container(
                                width: 0.7.sw,
                                height: 0.065.sh,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                    child: myText(
                                        text: "Get Started",
                                        color: const Color(0xff65558F),
                                        fontSize: 18,
                                        weight: FontWeight.w600)),
                              ),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmoothPageIndicator(
                                  controller: controller,
                                  count: 3,
                                  effect: const WormEffect(
                                    activeDotColor: Color(0xffE8B931),
                                    dotColor: Colors.white,
                                    dotHeight: 15,
                                    spacing: 10.0,
                                    type: WormType.thinUnderground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.07.sh,
                            ),

                            /* InkWell(
                              onTap: () async {
                               /* Navigator.push(
                                  context,
                                  AnimationsRoutebtt(page: loginpage()),
                                );*/
                              },
                              child: Container(
                                width: 0.7.sw,
                                height: 0.065.sh,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff0D3652),
                                      Color(0xff1D79A1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                    child: myText(
                                        text: "Login",
                                        color: Colors.white,
                                        fontSize: 18,
                                        weight: FontWeight.w600)),
                              ),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            InkWell(
                              onTap: () async {
                               /* Navigator.push(
                                  context,
                                  AnimationsRouteltr(page: SignUpPage()),
                                );*/
                              },
                              child: Container(
                                width: 0.7.sw,
                                height: 0.065.sh,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff51B4C7).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                    child: myText(
                                        text: "Register",
                                        color: const Color(0xff625B71),
                                        fontSize: 18,
                                        weight: FontWeight.w600)),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Transform.rotate(
                  angle: 70 * 3.141592653589793 / 180,
                  child: Transform.translate(
                    offset: const Offset(0.0, -600.0),
                    child: Container(
                      child: Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        color: Colors.white.withOpacity(0.25), //,Colors.red
                        size: 900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

Widget childinnav(
        {required String imagePath,
        required Color color,
        required String text}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(imagePath),
          color: color,
          height: 30,
        ),
        myText(text: text, color: color, fontSize: 10, weight: FontWeight.w500)
      ],
    );

Widget textinput(
        {String? Function(String?)? validator,
        TextAlignVertical? textAlignVertical,
        required String hint,
        TextEditingController? controller,
        required TextInputType type,
        bool? secure,
        Widget? suffix,
        Widget? prefix,
        String? character}) =>
    Center(
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: secure ?? false,
        obscuringCharacter: character ?? "•",
        textAlignVertical: textAlignVertical,
        validator: validator,
        decoration: InputDecoration(
          fillColor: const Color(0xfff4f5f7),
          suffixIcon: suffix,
          filled: true,
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: Color(0xfff4f5f7),
                strokeAlign: 0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: Color(0xfff4f5f7),
                strokeAlign: 0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          prefixIcon: prefix,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: Color(0xfff4f5f7),
                strokeAlign: 0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
    );

//Validation
bool isValidEmail(String input) {
  return isEmail(input);
}

bool isValidNumber(String input) {
  return isNumeric(input) && input.length > 8;
}

bool validateOtp(String otp) {
  if (otp.length != 4) {
    return false;
  }

  final numericRegex = RegExp(r'^[0-9]+$');

  if (!numericRegex.hasMatch(otp)) {
    return false;
  }

  return true;
}

String baseurl = 'https://dev.taifany.com/api';
String baseurl2 = 'https://dev.taifany.com/shop/api/v1';
bool loginorboard = true;
String token = "";
String currenttoken = "";
GetStorage FirstTime = GetStorage();
GetStorage userToken = GetStorage();

List<String> filters = <String>["Filter", "high to low", "low to high"];

List<appModel> landinglist = [
  appModel(image: "assets/landingicons/shop.svg", page: const dashboard()),
  appModel(
    image: "assets/landingicons/connect.svg",
  ),
  appModel(
    image: "assets/landingicons/auction.svg",
  ),
  appModel(
    image: "assets/landingicons/travel.svg",
  ),
  appModel(
    image: "assets/landingicons/crypto.svg",
  ),
  appModel(
    image: "assets/landingicons/adv.svg",
  ),
  appModel(
    image: "assets/landingicons/fun.svg",
  ),
  appModel(
    image: "assets/landingicons/libr.svg",
  ),
];

Widget Landingpage({required appModel model, void Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: SizedBox(
        child: SvgPicture.asset(
          model.image,
          fit: BoxFit.cover,
          width: 0.2.sw,
        ),
      ),
    );

List brandlist = [
  "assets/brand/brand1.png",
  "assets/brand/brand2.png",
  "assets/brand/brand3.png",
  "assets/brand/brand2.png",
  "assets/brand/brand3.png",
  "assets/brand/brand1.png"
];
Widget subbrands({required String image}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF5179C7)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Center(
            child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        )),
      ),
    );

List cellist = [
  "assets/celb/cel1.jpg",
  "assets/celb/cel2.png",
  "assets/celb/cel3.png",
  "assets/celb/cel2.png",
  "assets/celb/cel3.png",
  "assets/celb/cel1.jpg"
];
Widget subcel({required String image, required int num}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(image),
            //child: Image(image: AssetImage(image),fit: BoxFit.cover,),
          ),
          const SizedBox(
            height: 5,
          ),
          myText(
              text: "celebrities $num",
              color: Colors.black,
              fontSize: 10,
              weight: FontWeight.w400)
        ],
      ),
    );
Widget CategoryTitels({
  required categoriesModel model,
  required int index,
  required int currentIndex,
  required void Function()? onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Container(
            //  height: 35,
            color:
                currentIndex == index ? const Color(0xffEEF9F5) : const Color(0xffAFDDE5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: myText(
                  text: model.name!,
                  color:
                      currentIndex == index ? const Color(0xFF4AA4B5) : Colors.black,
                  fontSize: 12,
                  weight: FontWeight.w400,
                  align: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.clip),
            )),
      ),
    );
Widget CategoryList(
        {required categoriesModel model,
        required double size,
        required double imagewidth,
        required double fontsize}) =>
    Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(
              Icons.hexagon_outlined,
              color: Colors.transparent,
              size: size,
              shadows: [
                Shadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(3, 5),
                    blurRadius: 5)
              ],
            ),
            Transform.rotate(
              angle: 3.14 / 2,
              child: ClipPath(
                clipper: HexagonClipper(),
                child: Transform.rotate(
                  angle: -3.14 / 2,
                  child: CachedNetworkImage(
                    imageUrl: model.image!,
                    placeholder: (context, url) =>
                        const Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: imagewidth / 1.5,
                    )),
                    width: imagewidth,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        myText(
            text: model.name!,
            color: Colors.black,
            fontSize: fontsize,
            weight: FontWeight.w500,
            softWrap: true,
            maxLines: 2,
            align: TextAlign.center,
            overflow: TextOverflow.clip)
      ],
    );

Widget CategorySubList(
        {required subcatmodel model,
        required double size,
        required double imagewidth,
        required double fontsize}) =>
    Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(
              Icons.hexagon_outlined,
              color: Colors.transparent,
              size: size,
              shadows: [
                Shadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(3, 5),
                    blurRadius: 5)
              ],
            ),
            Transform.rotate(
              angle: 3.14 / 2,
              child: ClipPath(
                clipper: HexagonClipper(),
                child: Transform.rotate(
                  angle: -3.14 / 2,
                  child: CachedNetworkImage(
                    imageUrl: model.image!,
                    placeholder: (context, url) =>
                        const Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: imagewidth / 1.5,
                    )),
                    width: imagewidth,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        myText(
            text: model.name!,
            color: Colors.black,
            fontSize: fontsize,
            weight: FontWeight.w500,
            softWrap: true,
            maxLines: 2,
            align: TextAlign.center,
            overflow: TextOverflow.clip)
      ],
    );

Widget CategoryListLoad() => Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Transform.rotate(
              angle: 3.14 / 2,
              child: ClipPath(
                clipper: HexagonClipper(),
                child: Shimmer(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[100]!,
                      Colors.grey[300]!
                    ],
                    stops: const [0.4, 0.5, 0.6],
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.hexagon_outlined,
              color: Color(0xff74C3D2),
              size: 100,
            ),
          ],
        ),
        Shimmer(
          gradient: LinearGradient(
            colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
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
        ),
      ],
    );

List bannerimages = [
  bannerModel(image: "assets/banner1.jpg"),
  bannerModel(image: "assets/banner2.jpg"),
  bannerModel(image: "assets/banner1.jpg"),
  bannerModel(image: "assets/banner2.jpg"),
];

Widget buildBanner({required bannerModel model}) => Container(
      width: 1.sw,
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
          child: Image(
            image: AssetImage(model.image!),
            fit: BoxFit.cover,
          )),
    );

Widget buildBanner2({
  required bannerModel model,
  required int count,
  required int position,
}) =>
    Stack(
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
              child: Image(
                image: AssetImage(model.image!),
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              myText(
                  text: "Collections",
                  color: Colors.white,
                  fontSize: 13,
                  weight: FontWeight.w400),
              myText(
                  text: "New Arrivals",
                  color: Colors.white,
                  fontSize: 17,
                  weight: FontWeight.w700),
              myText(
                  text: "Headphone",
                  color: Colors.white,
                  fontSize: 17,
                  weight: FontWeight.w700),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              child: Container(
                width: 100,
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: myText(
                      text: 'Shop Now',
                      color: Colors.black,
                      fontSize: 12,
                      weight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: DotsIndicator(
              dotsCount: count,
              position: position,
              decorator: DotsDecorator(
                size: const Size.square(7.0),
                activeSize: const Size.square(10.0),
                color: Colors.grey,
                activeColor: Colors.white,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        )
      ],
    );
List sttt = ["assets/per.jpg", "assets/per.jpg", "assets/per.jpg"];
Widget perlist({
  required String imge,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 200,
        height: 100,
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(imge),
                    fit: BoxFit.cover,
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    myText(
                        text: "Perfume V ",
                        color: Colors.white,
                        fontSize: 14,
                        weight: FontWeight.w500),
                    myText(
                        text: "100 ml",
                        color: Colors.white,
                        fontSize: 12,
                        weight: FontWeight.w400),
                    const SizedBox(
                      height: 10,
                    ),
                    myText(
                        text: "AED 30.50",
                        color: Colors.white,
                        fontSize: 14,
                        weight: FontWeight.w500),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget Loading() => Container(
      width: 1.sw,
      height: 1.sh,
      color: Colors.grey.withOpacity(0.4),
      child: Center(
        child: Image(
          image: const AssetImage("assets/load.gif"),
          width: 0.3.sw,
        ),
      ),
    );

Widget accountbanner({
  required void Function(bool)? onChanged,
  required bool value,
}) =>
    Container(
      width: 1.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(children: [
        Container(
          width: 1.sw, //height: 0.05.sh,
          decoration: const BoxDecoration(
            color: Color(0xff224C54),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: myText(
                  text: "Taifany Coins",
                  color: Colors.white,
                  fontSize: 11,
                  weight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                child: Container(
                  width: 0.3.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff4AA4B5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 14,
                            child: Image(
                                image: AssetImage("assets/tifanycoin.jpg"),
                                height: 20,
                                width: 20),
                          ),
                        ),
                        myText(
                          text: "300.5",
                          color: Colors.white,
                          fontSize: 11,
                          weight: FontWeight.w600,
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1.sw,
          child: Row(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: const AssetImage("assets/avatar.jpg"),
                  fit: BoxFit.cover,
                  width: 0.2.sw,
                ),
              ),
            ),
            Column(children: [
              myText(
                  text: "Sumi Sumi",
                  color: Colors.black,
                  fontSize: 15,
                  weight: FontWeight.bold),
              myText(
                  text: "Sumi@gmail.com",
                  color: const Color(0xff353636),
                  fontSize: 12,
                  weight: FontWeight.bold)
            ]),
          ]),
        ),
        SizedBox(
          width: 1.sw,
          child: Row(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
              child: Container(
                height: 0.05.sh,
                decoration: const BoxDecoration(
                  color: Color(0xff224C54),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: Image(
                            image: AssetImage("assets/lightdak.jpg"),
                            height: 20,
                            width: 20),
                      ),
                      SizedBox(
                        width: 0.02.sw,
                      ),
                      myText(
                          text: "Mode",
                          color: Colors.white,
                          fontSize: 11,
                          weight: FontWeight.normal),
                      Transform.scale(
                        scale: 0.6,
                        transformHitTests: true,
                        child: Switch(
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.transparent,
                          activeTrackColor: Colors.white,
                          activeColor: const Color(0xff224C54),
                          value: value,
                          onChanged: onChanged,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
              child: Container(
                height: 0.05.sh,
                decoration: const BoxDecoration(
                  color: Color(0xff224C54),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 0.02.sw,
                      ),
                      myText(
                          text: "Edit",
                          color: Colors.white,
                          fontSize: 11,
                          weight: FontWeight.normal),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );

Widget accountcontent({
  IconData? icon,
  String? image,
  required String text,
  Widget? widget,
}) =>
    Row(
      children: [
        icon != null
            ? Icon(
                icon,
                size: 30,
                color: const Color(0xff74C3D2),
              )
            : const SizedBox(),
        image != null
            ? Image(
                image: AssetImage(image),
                width: 30,
                height: 30,
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: myText(
              text: text,
              color: Colors.black,
              fontSize: 13,
              weight: FontWeight.w700),
        ),
        const Spacer(
          flex: 8,
        ),
        widget ?? const SizedBox(),
        const Spacer(
          flex: 1,
        ),
        const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 20,
          color: Colors.black,
        ),
      ],
    );

List imagesprod = [
  "assets/try.jpg",
  "assets/6.jpg",
  "assets/9.jpg",
  "assets/10.jpg"
];
Widget productgridtest({
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          /*  boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(
                3,
                4,
              ),
            ),
          ],*/
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        width: 1.sw,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 3.0, top: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image(image: AssetImage("assets/off20.png")),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: myText(
                  text:
                      "${"Product Name Product Name Product Name Product Name".substring(0, 26)} ...",
                  color: Colors.black,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  align: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.clip),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  myText(
                      text: "AED  1000",
                      color: Colors.black,
                      fontSize: 13,
                      weight: FontWeight.w600),
                  SizedBox(
                    width: 0.02.sw,
                  ),
                  Text("2000",
                      style: GoogleFonts.getFont('Poppins').copyWith(
                        color: const Color(0xffC7C7CC),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFCB05),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  myText(
                      text: "4.5",
                      align: TextAlign.end,
                      color: Colors.black,
                      fontSize: 10,
                      weight: FontWeight.w500),
                  const Spacer(
                    flex: 8,
                  ), // SizedBox(width: 0.17.sw,),
                  const Icon(
                    Icons.favorite_border,
                    color: Color(0xff51B4C7),
                    size: 20,
                  ),
                  const Spacer(
                    flex: 1,
                  ), //SizedBox(width: 0.014.sw,),
                  const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Color(0xff51B4C7),
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
          ],
        ),
      ),
    );
Widget productlisthoriz({
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.white,

          /*  boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(
                3,
                4,
              ),
            ),
                      ],*/
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        height: 150,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 3.0, top: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image(image: AssetImage("assets/off20.png")),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: myText(
                  text:
                      "${"Product Name Product Name Product Name Product Name".substring(0, 26)} ...",
                  color: Colors.black,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  align: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.clip),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  myText(
                      text: "AED  1000",
                      color: Colors.black,
                      fontSize: 13,
                      weight: FontWeight.w600),
                  SizedBox(
                    width: 0.02.sw,
                  ),
                  Text("2000",
                      style: GoogleFonts.getFont('Poppins').copyWith(
                        color: const Color(0xffC7C7CC),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFCB05),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  myText(
                      text: "4.5",
                      align: TextAlign.end,
                      color: Colors.black,
                      fontSize: 10,
                      weight: FontWeight.w500),
                  const Spacer(
                    flex: 8,
                  ), // SizedBox(width: 0.17.sw,),
                  const Icon(
                    Icons.favorite_border,
                    color: Color(0xff51B4C7),
                    size: 20,
                  ),
                  const Spacer(
                    flex: 1,
                  ), //SizedBox(width: 0.014.sw,),
                  const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Color(0xff51B4C7),
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
          ],
        ),
      ),
    );

Widget productlist({
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          /*  boxShadow: [
            BoxShadow(
              color: fontcolorprimary.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(
                2,
                4,
              ),
            ),
          ],*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                    width: 0.3.sw,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: -5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image(
                      image: AssetImage("assets/off20.png"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: myText(
                          text:
                              "${"Product Name Product Name Product Name Product Name".substring(0, 26)} ...",
                          color: Colors.black,
                          fontSize: 14,
                          weight: FontWeight.w600,
                          align: TextAlign.start,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.clip),
                    ),
                    SizedBox(
                      height: 0.016.sh,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          myText(
                              text: "AED  1000",
                              color: Colors.black,
                              fontSize: 15,
                              weight: FontWeight.w600),
                          SizedBox(
                            width: 0.02.sw,
                          ),
                          Text("2000",
                              style: GoogleFonts.getFont('Poppins').copyWith(
                                color: const Color(0xffC7C7CC),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.016.sh,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFCB05),
                          size: 25,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        myText(
                            text: "4.5",
                            align: TextAlign.end,
                            color: Colors.black,
                            fontSize: 14,
                            weight: FontWeight.w500),
                      ],
                    ),
                    /*SizedBox(
                      height: 0.005.sh,
                    ),*/
                  ],
                ),
              ),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0xff51B4C7),
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.07.sh,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 15.0),
                  child: InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Color(0xff51B4C7),
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

Widget Favoritelist({
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          /*  boxShadow: [
            BoxShadow(
              color: fontcolorprimary.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(
                2,
                4,
              ),
            ),
          ],*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                    width: 0.3.sw,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: -5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image(
                      image: AssetImage("assets/off20.png"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: myText(
                          text:
                              "${"Product Name Product Name Product Name Product Name".substring(0, 26)} ...",
                          color: Colors.black,
                          fontSize: 14,
                          weight: FontWeight.w600,
                          align: TextAlign.start,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.clip),
                    ),
                    SizedBox(
                      height: 0.016.sh,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          myText(
                              text: "AED  1000",
                              color: Colors.black,
                              fontSize: 15,
                              weight: FontWeight.w600),
                          SizedBox(
                            width: 0.02.sw,
                          ),
                          Text("2000",
                              style: GoogleFonts.getFont('Poppins').copyWith(
                                color: const Color(0xffC7C7CC),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.016.sh,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFCB05),
                          size: 25,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        myText(
                            text: "4.5",
                            align: TextAlign.end,
                            color: Colors.black,
                            fontSize: 14,
                            weight: FontWeight.w500),
                      ],
                    ),
                    /*SizedBox(
                      height: 0.005.sh,
                    ),*/
                  ],
                ),
              ),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.07.sh,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 15.0),
                  child: InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Color(0xff51B4C7),
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

Widget buttonproduct({
  required void Function()? onTap,
  required String text,
  required IconData? icon,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffAFDDE5),
          borderRadius: BorderRadius.circular(5),
          /*boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(
                1,
                1,
              ),
            ),
          ],*/
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon, // Icons.sort_by_alpha_outlined,
                color: const Color(0xff224C54),
                size: 14,
              ),
              //SizedBox(width: 0.03.sw,),
              myText(
                  text: text,
                  align: TextAlign.center,
                  color: const Color(0xff224C54),
                  fontSize: 10,
                  weight: FontWeight.normal)
            ],
          ),
        ),
      ),
    );

///Vendors
List vendorTypes = ["International", "United Arab Emirates", "Grand Brazar"];
Widget Vendorscat(
        {required int index,
        required void Function()? onTap,
        required appController controller}) =>
    Obx(
      () => InkWell(
        onTap: onTap,
        child: Row(
          children: [
            controller.Selectedvendor.value == index
                ? Stack(
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(7.0, 15.0)
                          ..rotateZ(0),
                        child: Container(
                          width: 25,
                          height: 25,
                          color: const Color(0xFF51B4C7),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Color(0xffEEF9F5),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: controller.Selectedvendor.value == index
                  ? const ShapeDecoration(
                      color: Color(0xFF51B4C7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    )
                  : const BoxDecoration(color: Colors.transparent),
              child: Center(
                child: myText(
                  text: vendorTypes[index],
                  color: controller.Selectedvendor.value == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            controller.Selectedvendor.value == index
                ? Stack(
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(-1.0, 15.0)
                          ..rotateZ(0),
                        child: Container(
                          width: 15,
                          height: 15,
                          color: const Color(0xFF51B4C7),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Color(0xffEEF9F5),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );

List<String> sellersforapi = [
  "international",
  "united-arab-emirates",
  "celebrities"
];
List<vendormodel> vendorlist = [];
List<vendormodel> fakevendorlist = [
  vendormodel(
      banner: "dgakj", description: "alkjhkl", name: "alkjhl", logo: "adslj"),
  vendormodel(
      banner: "dgakj", description: "alkjhkl", name: "alkjhl", logo: "adslj"),
  vendormodel(
      banner: "dgakj", description: "alkjhkl", name: "alkjhl", logo: "adslj"),
  vendormodel(
      banner: "dgakj", description: "alkjhkl", name: "alkjhl", logo: "adslj"),
  vendormodel(
      banner: "dgakj", description: "alkjhkl", name: "alkjhl", logo: "adslj"),
  vendormodel(
      banner: "dgakj", description: "alkjhkl", name: "alkjhl", logo: "adslj"),
];
vendorwidget({
  required vendormodel model,
  required void Function()? onTap,
  bool? condition,
}) =>
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: (condition != null)
                            ? condition
                                ? null
                                : Image(
                                    image: NetworkImage(model.banner!),
                                    fit: BoxFit.cover,
                                  )
                            : Image(
                                image: NetworkImage(model.banner!),
                                fit: BoxFit.cover,
                              )),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12),
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              myText(
                                  text: model.name!,
                                  color: Colors.white,
                                  fontSize: 11,
                                  weight: FontWeight.w700),
                              model.description!.length > 44
                                  ? myText(
                                      text:
                                          "${model.description!.substring(0, 44)}...",
                                      color: Colors.white,
                                      fontSize: 8,
                                      weight: FontWeight.w500,
                                      align: TextAlign.center,
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.clip)
                                  : myText(
                                      text: model.description!,
                                      color: Colors.white,
                                      fontSize: 8,
                                      weight: FontWeight.w500,
                                      align: TextAlign.center,
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.clip),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color(0xff51B4C7),
                  child: Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEF8F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    myText(
                                        align: TextAlign.center,
                                        text: "Visit Store",
                                        color: const Color(0xff51B4C7),
                                        fontSize: 8,
                                        weight: FontWeight.w500),
                                    const Icon(
                                      Icons.keyboard_double_arrow_right_rounded,
                                      color: Color(0xff51B4C7),
                                      size: 12,
                                    )
                                  ],
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            child: CircleAvatar(
              backgroundImage: (condition != null)
                  ? condition
                      ? null
                      : NetworkImage(
                          model.logo!,
                        )
                  : NetworkImage(
                      model.logo!,
                    ),
            ),
          ),
        )
      ],
    );

List sellersimages = [
  "assets/inter.jpg",
  "assets/uae.jpg",
  "assets/baz.jpg",
];
List sellersname = [
  "International\nSellers",
  "UAE\nSellers",
  "Grand\nBazaar",
];
sellerswidget({required int index, void Function()? onTap}) => InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: const Color(0xFF51B4C7)),
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x332285AF),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 3,
                )
              ]),
          child: Column(children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image(
                      image: AssetImage(sellersimages[index]),
                      fit: BoxFit.cover,
                    ))),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: myText(
                  text: sellersname[index],
                  color: Colors.black,
                  fontSize: 13,
                  weight: FontWeight.w400,
                  align: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 2),
            )),
          ]),
        ),
      ),
    );

List<productmodel> productvendorlist = [];
Widget productgrid({
  required productmodel model,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          /*  boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(
                3,
                4,
              ),
            ),
          ],*/
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: CachedNetworkImage(
                      imageUrl: model.main_image!,
                      placeholder: (context, url) =>
                          const Center(child: CupertinoActivityIndicator()),
                      errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error_outline,
                              color: Colors.red, size: 30)),
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                model.discount != "0"
                    ? const Padding(
                        padding: EdgeInsets.only(right: 3.0, top: 5),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image(image: AssetImage("assets/off20.png")),
                        ),
                      )
                    : Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: myText(
                  text: model.name!.length > 26
                      ? "${model.name!.substring(0, 26)} ..."
                      : model.name!,
                  color: Colors.black,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  align: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.clip),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  myText(
                      text: "AED  ${model.price}",
                      color: Colors.black,
                      fontSize: 13,
                      weight: FontWeight.w600),
                  SizedBox(
                    width: 0.02.sw,
                  ),
                  model.discount != "0"
                      ? Text("2000",
                          style: GoogleFonts.getFont('Poppins').copyWith(
                            color: const Color(0xffC7C7CC),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                          ))
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFCB05),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  myText(
                      text: model.reviews_avg_rating.toString(),
                      align: TextAlign.end,
                      color: Colors.black,
                      fontSize: 10,
                      weight: FontWeight.w500),
                  const Spacer(
                    flex: 8,
                  ), // SizedBox(width: 0.17.sw,),
                  const Icon(
                    Icons.favorite_border,
                    color: Color(0xff51B4C7),
                    size: 20,
                  ),
                  const Spacer(
                    flex: 1,
                  ), //SizedBox(width: 0.014.sw,),
                  const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Color(0xff51B4C7),
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.005.sh,
            ),
          ],
        ),
      ),
    );



Widget cartlist({
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          /*  boxShadow: [
            BoxShadow(
              color: fontcolorprimary.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(
                2,
                4,
              ),
            ),
          ],*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                    width: 0.3.sw,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: -5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image(
                      image: AssetImage("assets/off20.png"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: myText(
                          text:
                              "${"Product Name Product Name Product Name Product Name".substring(0, 26)} ...",
                          color: Colors.black,
                          fontSize: 10,
                          weight: FontWeight.w600,
                          align: TextAlign.start,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.clip),
                    ),
                    SizedBox(
                      height: 0.016.sh,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          myText(
                              text: "AED  1000",
                              color: Colors.black,
                              fontSize: 15,
                              weight: FontWeight.w600),
                          SizedBox(
                            width: 0.02.sw,
                          ),
                          Text("2000",
                              style: GoogleFonts.getFont('Poppins').copyWith(
                                color: const Color(0xffC7C7CC),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.016.sh,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFCB05),
                          size: 25,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        myText(
                            text: "4.5",
                            align: TextAlign.end,
                            color: Colors.black,
                            fontSize: 14,
                            weight: FontWeight.w500),
                      ],
                    ),
                    /*SizedBox(
                      height: 0.005.sh,
                    ),*/
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.07.sh,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                        size: 23,
                      ),
                      SizedBox(
                        width: 0.025.sw,
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8ACDD9),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16,
                        )),
                      ),
                      SizedBox(
                        width: 0.015.sw,
                      ),
                      myText(
                          text: "1",
                          color: Colors.black,
                          fontSize: 16,
                          weight: FontWeight.w400),
                      SizedBox(
                        width: 0.015.sw,
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF9595F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
