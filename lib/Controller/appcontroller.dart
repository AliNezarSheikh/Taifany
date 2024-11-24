import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:tiffany/Models/categoriesModel.dart';
import 'package:tiffany/Models/productModel.dart';
import 'package:tiffany/Models/vendorModel.dart';
import 'package:tiffany/screens/Dashboard/Account.dart';
import 'package:tiffany/screens/Dashboard/Categories.dart';
import 'package:tiffany/screens/Dashboard/Favorites.dart';
import 'package:tiffany/screens/Dashboard/Home.dart';
import 'package:tiffany/screens/Dashboard/Vendor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/subCategoryModel.dart';
import '../reusable/classfordesign.dart';
import '../reusable/comp2.dart';
import '../reusable/components.dart';

class appController extends GetxController {
  RxBool notvisable = true.obs;
  RxBool rememberMe = false.obs;
  RxBool getlocation = false.obs;
  RxBool agree = true.obs;
  RxBool showError = false.obs;
  RxBool isFirstTime = true.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingVendors = false.obs;
  RxInt categoryinitindex=0.obs;
  RxBool successregister = false.obs;
  RxBool successlogin = false.obs;
  RxBool successotp= false.obs;
  RxBool sendedotp= false.obs;
  RxBool resetpass= false.obs;
  RxString  selectedValue="".obs;
RxString filter=filters.first.obs;
RxInt Selectedvendor=0.obs;

  RxBool gridview = true.obs;
  void changeview() {
    gridview.value = !gridview.value;
  }
  void getvisiblepassword() {
    notvisable.value = !notvisable.value;
  }

  void getremember({bool? val}) {
    rememberMe.value = val!;
  }

  void getagree({bool? val}) {
    agree.value = val!;
    showError.value = !agree.value;
  }

  void submitForm() {
    if (agree.value) {
      showError.value = false;
    } else {
      showError.value = true;
    }
  }

//Login

  Future<void> registeruser({
    required String firstname,
    required String username,
    required String lastname,
    required String email,
    required String password,
    required String countrycode,
    required String number,
  }) async
  {
    isLoading.value = true;
    Uri url = Uri.parse("$baseurl/auth/register");

    await http.post(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },
      body: {
        "username": username,
        "first_name": firstname,
        "last_name": lastname,
       "country_code": countrycode,
        "mobile_number": number,
        "email": email,
        "password": password
      },
    ).then((value) {
      if (value.statusCode == 200) {
        isLoading.value = false;

        successregister.value = true;
      } else {
        isLoading.value = false;
        successregister.value = false;
        print(jsonDecode(value.body));
        AwesomeDialog(
                context: Get.context!,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                title: "Error",
                desc: jsonDecode(value.body)["message"],
                btnOkOnPress: () {},
                headerAnimationLoop: false,
                btnOkIcon: Icons.check_circle,
                btnOkColor: Colors.red)
            .show();

        //showresult(context, Colors.red, jsonDecode(value.body)["message"]);
      }
    }).catchError((error) {
      isLoading.value = false;
      successregister.value = false;
      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "Error",
              desc: error.toString(),
              btnOkOnPress: () {},
              headerAnimationLoop: false,
              btnOkIcon: Icons.check_circle,
              btnOkColor: Colors.red)
          .show();


    });
  }

  Future<void> loginuser(
      {
    required String email,
    required String password,
  }) async
  {
    isLoading.value = true;
    Uri url = Uri.parse("$baseurl/auth/login");

    await http.post(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },
      body: {
        "email": email,
        "password": password
      },
    ).then((value) {
      if (value.statusCode == 200) {
        isLoading.value = false;
        successlogin.value = true;
        token=jsonDecode(value.body)["token"];
      } else {
        isLoading.value = false;
        successlogin.value = false;

        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();

        //showresult(context, Colors.red, jsonDecode(value.body)["message"]);
      }
    }).catchError((error) {
      isLoading.value = false;
      successlogin.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }

  Future<void> getotp({
    required String email,

  }) async
  {
    isLoading.value = true;
    Uri url = Uri.parse("$baseurl/auth/forgot-password");

    await http.post(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },
      body: {
        "email": email,

      },
    ).then((value) {
      if (value.statusCode == 200) {
        isLoading.value = false;
        successotp.value = true;
        currenttoken=jsonDecode(value.body)["token"];
      } else {
        isLoading.value = false;
        successotp.value = false;

        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();

        //showresult(context, Colors.red, jsonDecode(value.body)["message"]);
      }
    }).catchError((error) {
      isLoading.value = false;
      successotp.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }

  Future<void> sendotp({
    //required String token,
    required String otp,


  }) async
  {
    isLoading.value = true;
    print(currenttoken);
    Uri url = Uri.parse("$baseurl/auth/forgot-password/verify-otp");

    await http.post(
      url,
      headers: {
       "Accept": "application/json",
        // "Content-Type":"application/json",
      },
      body: {
        "token": currenttoken,
        "otp": otp

      },
    ).then((value) {
      if (value.statusCode == 200) {
        isLoading.value = false;
        sendedotp.value = true;

      } else {
        isLoading.value = false;
        sendedotp.value = false;

        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();

        //showresult(context, Colors.red, jsonDecode(value.body)["message"]);
      }
    }).catchError((error) {
      isLoading.value = false;
      sendedotp.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }


  Future<void> changepassword({
    //required String token,
    required String new_password,
    required String confirm_password,


  }) async
  {
    isLoading.value = true;

    Uri url = Uri.parse("$baseurl/auth/reset-password");

    await http.post(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },
      body: {
        "token": currenttoken,
        "new_password": new_password,
        "confirm_password": confirm_password,

      },
    ).then((value) {
      if (value.statusCode == 200) {
        isLoading.value = false;
        resetpass.value = true;

      } else {
        isLoading.value = false;
        resetpass.value = false;

        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();

        //showresult(context, Colors.red, jsonDecode(value.body)["message"]);
      }
    }).catchError((error) {
      isLoading.value = false;
      resetpass.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }


  //Dashboard
  RxInt currentindex = 0.obs;
  List listtest=[test1(),test2(),test3()];
  List<Widget> bottomscreens = [
    const home(),
    const categories(),
    const vendor(),
    const favorites(),
    const account(),
  ];
  void changenavindex(int index) {
    currentindex.value = index;

  }
  RxInt currentindexcheckout = 0.obs;
  List checkoutscreens=[
    address(), Paymentmethods(),placeorder()];
  void changecheckoutindex() {
    currentindexcheckout.value ++;

  }


  RxBool getcategorys = false.obs;
  Future<void> getCategories() async {
    isLoading.value = true;
    getcategorys.value = false;
    categorieslist=[];
    Uri url = Uri.parse("$baseurl2/categories");

    await http.get(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },

    ).then((value)  {
      if (value.statusCode == 200) {


        var data=jsonDecode(value.body);
         data["data"].forEach((element) {

          categorieslist.add(categoriesModel.fromJson(element));
        });
        getcategorys.value = true;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        getcategorys.value = false;


        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();


      }
    }).catchError((error) {
      isLoading.value = false;
      getcategorys.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }

  RxBool getSubcategorys = false.obs;
  Future<void> getSubCategories({required String categoryname}) async {
    isLoading.value = true;
    getSubcategorys.value = false;
    subcategorieslist=[];
    Uri url = Uri.parse("$baseurl2/categories/sub/$categoryname");

    await http.get(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },

    ).then((value)  {
      if (value.statusCode == 200) {


        var data=jsonDecode(value.body);
         data["data"].forEach((element) {

           subcategorieslist.add(subcatmodel.fromJson(element));
        });
        getSubcategorys.value = true;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        getSubcategorys.value = false;


        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();


      }
    }).catchError((error) {
      isLoading.value = false;
      getSubcategorys.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }


  RxBool getvendors = false.obs;
  Future<void> getVendors({required String type}) async {
    isLoadingVendors.value = true;
    getvendors.value = false;
    vendorlist=[];
    final Map<String, String> queryParams =
    {"type": type};
    String queryString = Uri(queryParameters: queryParams).query;

    Uri url = Uri.parse("$baseurl2/sellers?$queryString");

    await http.get(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },


    ).then((value)  {
      if (value.statusCode == 200) {


        var data=jsonDecode(value.body);
        data["data"].forEach((element) {

          vendorlist.add(vendormodel.fromJson(element));
        });

        getvendors.value = true;
        isLoadingVendors.value = false;
      } else {
        isLoadingVendors.value = false;
        getvendors.value = false;
        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();


      }
    }).catchError((error) {
      isLoadingVendors.value = false;
      getvendors.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }

  RxBool getvendor = false.obs;
  Future<void> getVendorbyname({required String name}) async {
    isLoading.value = true;
    getvendor.value = false;
    productvendorlist=[];
    Uri url = Uri.parse("$baseurl2/sellers/$name");

    await http.get(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type":"application/json",
      },


    ).then((value)  {
      if (value.statusCode == 200) {


        var data=jsonDecode(value.body);
        data["data"]["products"].forEach((element) {

          productvendorlist.add(productmodel.fromJson(element));
        });

        getvendor.value = true;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        getvendor.value = false;
        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Error",
            desc: jsonDecode(value.body)["message"],
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();


      }
    }).catchError((error) {
      isLoading.value = false;
      getvendor.value = false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Error",
          desc: error.toString(),
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();


    });
  }


//Location
  Future getposition({required BuildContext context})async{
    bool serv;
    LocationPermission per;
    serv=await Geolocator.isLocationServiceEnabled();
    //var connectivityResult = await (Connectivity().checkConnectivity());
    /*if(connectivityResult==ConnectivityResult.none){

      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Internet Connection",
          desc:"No Internet Connection",
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();
    }else{*/
      if(serv == false) {
        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: "Location Service",
            desc:"Location is not Enabled",
            btnOkOnPress: () {},
            headerAnimationLoop: false,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.red)
            .show();

      }
      else {
        per = await Geolocator.checkPermission();
        if (per == LocationPermission.denied) {
          per = await Geolocator.requestPermission();
        }
        if (per == LocationPermission.deniedForever) {
          per = await Geolocator.requestPermission();
        }
        if (per == LocationPermission.always) {
          await getlatandlong(context: context);

        }
        if (per == LocationPermission.whileInUse) {
          await getlatandlong(context: context);


        }
      }
  //  }

  }

  Future getlatandlong({required BuildContext context})
  async{
   // isloadmap.value=true;
    getlocation.value=false;
    await setLocaleIdentifier("en_US");
    await Geolocator.getCurrentPosition()
        .then((value) async {
      currentlocation =value;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(
            currentlocation!.latitude,
            currentlocation!.longitude,
      );
      currentemarite=placemarks[0].administrativeArea!;
      currentarea=placemarks[0].subLocality!;
      getlocation.value=true;

      /*kGooglePlex = CameraPosition(
        target: LatLng( currentlocation!.latitude,currentlocation!.longitude),
        zoom: 14.4746,
      );
      marker = Marker(
        markerId: MarkerId('1'),
        draggable: true,
        position: LatLng( currentlocation!.latitude,currentlocation!.longitude),
      ).obs;


      isloadmap.value=false;

      visiblesave.value = true;*/
    })
        .catchError((error){
    //  isloadmap.value=false;
      getlocation.value=false;
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: "Location Service",
          desc:"Error While Get Location",
          btnOkOnPress: () {},
          headerAnimationLoop: false,
          btnOkIcon: Icons.check_circle,
          btnOkColor: Colors.red)
          .show();
    });
  }
  Rx<Marker> marker = Marker(
    markerId: const MarkerId('1'),
    //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

    position:currentlocation!=null? LatLng( currentlocation!.latitude,currentlocation!.longitude): const LatLng( 0,0),
  ).obs;
  CameraPosition  kGooglePlex = CameraPosition(
    target: currentlocation!=null? LatLng( currentlocation!.latitude,currentlocation!.longitude): const LatLng( 0,0),
    zoom: 14.4746,
  );
  void updateMarker(LatLng newPosition) {
    marker.value = marker.value.copyWith(positionParam: newPosition);
  }


  Future<void> openUrl({required String link,required BuildContext context,required String name}) async {
    Uri url = Uri.parse(link);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        showToast(context, "Error", "No Link For $name Page");
      }
    }
   catch(e){
     showToast(context, "Error", "Error While Open Link");
    }
  }
}
