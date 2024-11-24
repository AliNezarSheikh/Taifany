import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';
import 'package:tiffany/reusable/components.dart';

import '../../Controller/appcontroller.dart';


class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  appController controller = Get.put(appController());

  @override
  void initState() {
    controller.getposition(context: context);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Obx(
        ()=> Scaffold(
        bottomNavigationBar:   NavigationView(
         indexs: controller.currentindex.value,
          
          onChangePage: (c) {
           controller.changenavindex(c);
if(c==2){
  controller.getVendors(type: sellersforapi[controller.Selectedvendor.value]);
}
           if(c==1 && categorieslist.isNotEmpty){
             controller.getSubCategories(categoryname: categorieslist[controller.categoryinitindex.value].name!);
           }
          },
          curve: Curves.easeInBack,
          durationAnimation: const Duration(milliseconds: 400),
          color: onselectcolor,
          items: [
            ItemNavigationView(

              childAfter: childinnav(
                imagePath: "assets/Home.png",
                color:controller.currentindex.value==0? onselectcolor:Colors.black,
                text: "Home",
              ),
              childBefore: childinnav(
                imagePath: "assets/Home.png",
                color: Colors.black,
                text: "Home",
              ),
            ),
            ItemNavigationView(
              childAfter: childinnav(
                imagePath: "assets/Categories.png",
                color: controller.currentindex.value==1? onselectcolor:Colors.black,
                text: "Categories",
              ),
              childBefore: childinnav(
                imagePath: "assets/Categories.png",
                color: Colors.black,
                text: "Categories",
              ),
            ),
            ItemNavigationView(
                childAfter: childinnav(
                  imagePath: "assets/Vendor.png",
                  color: controller.currentindex.value==2? onselectcolor:Colors.black,
                  text: "Vendor",
                ),
                childBefore: childinnav(
                  imagePath: "assets/Vendor.png",
                  color: Colors.black,
                  text: "Vendor",
                ),
            ),
            ItemNavigationView(
              childAfter: childinnav(
                imagePath: "assets/Favorites.png",
                color: onselectcolor,
                text: "Favorites",
              ),
              childBefore: childinnav(
                imagePath: "assets/Favorites.png",
                color: Colors.black,
                text: "Favorites",
              ),
            ),
            ItemNavigationView(
              childAfter: childinnav(
                imagePath: "assets/Account.png",
                color: onselectcolor,
                text: "Account",
              ),
              childBefore: childinnav(
                imagePath: "assets/Account.png",
                color: Colors.black,
                text: "Account",
              ),
            ),


          ],
        ),
        backgroundColor: Colors.white,
          body:  PageTransitionSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation, animation2) =>
                  FadeTransition(
                    opacity: animation,
                    child: child,),
              child: controller.bottomscreens[controller.currentindex.value]),
      ),
    );
  }
}
