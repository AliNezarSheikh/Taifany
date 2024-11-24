import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../reusable/components.dart';

class favorites extends StatefulWidget {
  const favorites({super.key});

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
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
      body:  Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xffEEF9F5),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
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
                              child: Favoritelist(
                                  image: imagesprod[index])),
                        ),
                      );
                    }),
              ),
            ]),
          )
        ),
      ),
    );
  }
}
