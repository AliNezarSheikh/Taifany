import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tiffany/Controller/appcontroller.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/products/productsincategoriey.dart';




class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  appController controller=Get.put(appController());

 @override
  void initState(){
   super.initState();


 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 30),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Obx(
        ()=> Container(
          width: 1.sw,
          height: 1.sh,
          color: const Color(0xffEEF9F5),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                  child: controller.getcategorys.isTrue
                  ?Container(

                    color: const Color(0xffAFDDE5),
                child: ListView.builder(
                    itemCount: categorieslist.length,
                    itemBuilder: (context, index) {
                      return CategoryTitels(
                          model: categorieslist[index],
                          index: index,
                          currentIndex:controller.categoryinitindex.value,
                        onTap: (){
                          controller.categoryinitindex.value=index;
                          controller.getSubCategories(categoryname: categorieslist[index].name!);

                        }
                      );
                    })
                //color: Color(0xff4AA4B5),
              )
                      :FutureBuilder(
                      future: controller.getCategories() ,
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                        if (snapshot.connectionState == ConnectionState.done){
                          return Container(

                              color: const Color(0xffAFDDE5),
                              child: ListView.builder(
                                  itemCount: categorieslist.length,
                                  itemBuilder: (context, index) {
                                    return CategoryTitels(
                                        model: categorieslist[index],
                                        index: index,
                                        currentIndex: controller.categoryinitindex.value,
                                        onTap: (){
                                          controller.categoryinitindex.value=index;

                                        }
                                    );
                                  })
                            //color: Color(0xff4AA4B5),
                          );
                        }else{
                          return Shimmer(
                              gradient: LinearGradient(
                              colors: [
                                Colors.grey[300]!,
                                Colors.grey[100]!,
                                Colors.grey[300]!
                              ],
                              stops: const [0.4, 0.5, 0.6],
                            ),
                              child: SizedBox(
                                width: 1.sw,
                                height: 1.sh,

                              ),);
                        }
                      })
              ),


             controller.getSubcategorys.isTrue?
                   Expanded(
                flex: 2,
                  child: Container(
                child:SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all( 16),
                          child: myText(
                              text: "Shop By Category",
                              color: Colors.black,
                              fontSize: 12,
                              weight: FontWeight.w800),
                        ),
                        subcategorieslist.isNotEmpty?   Container(
                          child: AnimationLimiter(
                            child: GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics:
                              const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 1.0,
                              //childAspectRatio: 1 / 1.41,
                              children: List.generate(subcategorieslist.length, (index) {
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

                                          Get.to(()=>  const productsincategoriey( ),arguments: subcategorieslist[index],transition: Transition.size,curve: Curves.bounceInOut,duration: const Duration(milliseconds: 500));
                                        },
                                        child: CategorySubList(model: subcategorieslist[index],size: 50,imagewidth: 50,fontsize: 10),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ):const Center(
                          child: Text("No Sub Category"),
                        ),
                      ]),
                ),
              ))
                  :controller.isLoading.isTrue?
                 const Expanded(   flex: 2,
                     child:
                     Center(child: CupertinoActivityIndicator(radius: 30,)),)
            : Expanded(
                  flex: 2,
                  child: Container(
                    child:SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all( 16),
                              child: myText(
                                  text: "Shop By Category",
                                  color: Colors.black,
                                  fontSize: 12,
                                  weight: FontWeight.w800),
                            ),
                            /*Container(
                              child: AnimationLimiter(
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  physics:
                                  const BouncingScrollPhysics(), //BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 1.0,
                                  //childAspectRatio: 1 / 1.41,
                                  children: List.generate(subcategorieslist.length, (index) {
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

                                              Get.to(()=> const productsincategoriey( ),arguments: categorieslist[index],transition: Transition.size,curve: Curves.bounceInOut,duration: const Duration(milliseconds: 500));
                                            },
                                            child: CategorySubList(model: subcategorieslist[index],size: 50,imagewidth: 50,fontsize: 10),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),*/
                          ]),
                    ),
                  )),
            ]
          ),

        ),
      ),

    );
  }
}
