import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiffany/Controller/appcontroller.dart';
import 'package:tiffany/reusable/components.dart';

class addaddress extends StatefulWidget {
  const addaddress({super.key});

  @override
  State<addaddress> createState() => _addaddressState();
}

class _addaddressState extends State<addaddress> {
  late GoogleMapController gmc;
  appController controller=Get.put(appController());

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
        title: const Text(
          'Add Address',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body:
        Container(
          width: 1.sw,
          height: 1.sh,
          color: const Color(0xffEEF9F5),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        myText(
                            text: "Deliver to",
                            color: Colors.black,
                            fontSize: 17,
                            weight: FontWeight.w600),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 0.9.sw,
                    height: 0.9.sw,
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                     /* markers: Set<Marker>.of(
                          [controller.marker.value]),*/
                      onTap: (LatLng) async {
                        controller.updateMarker(LatLng);
                       /* controller.visiblesave = false.obs;
                        await setLocaleIdentifier("en_US");
                        List<Placemark> placemarks =
                        await placemarkFromCoordinates(
                          LatLng.latitude,
                          LatLng.longitude,
                        );
                        adressController.text =
                            placemarks[0].subThoroughfare! +
                                placemarks[0].thoroughfare!;
                        cityController.text =
                        placemarks[0].subLocality!;
                        emarites.contains( placemarks[0].administrativeArea!)?
                        controller.dropdownValueemarite.value =
                        placemarks[0].administrativeArea!
                            : controller.dropdownValueemarite.value =emarites.first;*/
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: controller.kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        gmc = controller;

                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
