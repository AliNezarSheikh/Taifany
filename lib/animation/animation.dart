import 'package:flutter/material.dart';

class FadeSlidePageRoute extends PageRouteBuilder {
  final Widget page;

  FadeSlidePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        );
}

class AnimationsRoutertl extends PageRouteBuilder{
  final page;
  AnimationsRoutertl({
    this.page,
  }): super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration:  const Duration(milliseconds: 700),
    pageBuilder: (context,animation,animation2,)=>page,
    transitionsBuilder: (context,animation,animation2,child)=>
        SlideTransition(
          position: animation.drive(Tween(begin:const Offset(1,0),end: const Offset(0,0))),
          child: child,),
  );
}
class AnimationsRouteltr extends PageRouteBuilder{
  final page;
  AnimationsRouteltr({
    this.page,
  }): super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration:  const Duration(milliseconds: 700),
    pageBuilder: (context,animation,animation2,)=>page,
    transitionsBuilder: (context,animation,animation2,child)=>
        SlideTransition(
          position: animation.drive(Tween(begin:const Offset(-1,0),end: const Offset(0,0))),
          child: child,),
  );
}
class AnimationsRoutebtt extends PageRouteBuilder{
  final page;
  AnimationsRoutebtt({
    this.page,
  }): super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration:  const Duration(milliseconds: 700),
    pageBuilder: (context,animation,animation2,)=>page,
    transitionsBuilder: (context,animation,animation2,child)=>
        SlideTransition(
          position: animation.drive(Tween(begin:const Offset(0,1),end: const Offset(0,0))),
          child: child,),
  );
}
class AnimationsRoutettb extends PageRouteBuilder{
  final page;
  AnimationsRoutettb({
    this.page,
  }): super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration:  const Duration(milliseconds: 700),
    pageBuilder: (context,animation,animation2,)=>page,
    transitionsBuilder: (context,animation,animation2,child)=>
        SlideTransition(
          position: animation.drive(Tween(begin:const Offset(0,-1),end: const Offset(0,0))),
          child: child,),
  );
}


class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,

      );
    },
  );
}

class scaleanimation extends PageRouteBuilder{
  final page;
  scaleanimation({
    this.page,
  }): super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration:  const Duration(milliseconds: 700),
    pageBuilder: (context,animation,animation2,)=>page,
    transitionsBuilder: (context,animation,animation2,child)=>
        ScaleTransition(

          scale: animation,
          child: child,),
  );
}
class opestscale extends PageRouteBuilder{
  final page;
  opestscale({
    this.page,
  }): super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration:  const Duration(milliseconds: 700),
    pageBuilder: (context,animation,animation2,)=>page,
    transitionsBuilder: (context,animation,animation2,child)=>
        ScaleTransition(

          scale: animation2,
          child: child,),
  );
}
