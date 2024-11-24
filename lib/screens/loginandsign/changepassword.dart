import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffany/screens/loginandsign/signorlogin.dart';
import 'package:tiffany/screens/loginandsign/successpass.dart';

import '../../Controller/appcontroller.dart';
import '../../animation/animation.dart';
import '../../reusable/components.dart';

class changepass extends StatefulWidget {
  const changepass({super.key});

  @override
  State<changepass> createState() => _changepassState();
}

class _changepassState extends State<changepass> {
  appController controller = Get.put(appController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController passwordFieldController=TextEditingController();
  TextEditingController confirmPasswordFieldController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              nav=false;
            });
            Navigator.pushAndRemoveUntil(
              context,
              AnimationsRouteltr(page: const signorlogin()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Obx(
        ()=> Stack(
          children: [
            Container(
              width: 1.sw,
              height: double.infinity,
              color: const Color(0xffF9F9FF),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                     // width: 0.9.sw,
                      //height: 0.7.sw,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20,right: 18.0, top: 18.0,bottom: 18).r,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              SizedBox(height: 0.02.sh),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child:    textinput(
                                  validator: (String? value) {
                                    if (value!.length < 6) {
                                      return "Password is Short";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: passwordFieldController,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  hint: "Password",
                                  type: TextInputType.visiblePassword,
                                  secure: controller.notvisable.value,
                                  character: "*",
                                  prefix: const Icon(Icons.lock),
                                  suffix: IconButton(
                                    icon: Icon(controller.notvisable.isTrue
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined),
                                    onPressed: () {
                                      controller.getvisiblepassword();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.03.sh),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child:   textinput(
                                  validator: (String? value) {
                                    if (value != passwordFieldController.text) {
                                      return "Password does not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: confirmPasswordFieldController,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  hint: "Password",
                                  type: TextInputType.visiblePassword,
                                  secure: controller.notvisable.value,
                                  character: "*",
                                  prefix: const Icon(Icons.lock),
                                  suffix: IconButton(
                                    icon: Icon(controller.notvisable.isTrue
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined),
                                    onPressed: () {
                                      controller.getvisiblepassword();
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.03.sh),

                              InkWell(
                                onTap: () async {
                                  if(_formKey.currentState!.validate()){
                                          await controller.changepassword(
                                              new_password: passwordFieldController.text,
                                              confirm_password: confirmPasswordFieldController.text)
                                              .then((value){
                                                if(controller.resetpass.isTrue){
                                                   setState(() {
                                    nav=true;

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      FadePageRoute(page: const successpass()),
                                          (Route<dynamic> route) => false,
                                    );
                                  });

                                                }
                                          });
                                  }


                                },
                                child: Container(
                                  width: 0.7.sw,
                                  height: 0.065.sh,

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
                                          text: "Save Now !",
                                          color: Colors.white,
                                          fontSize: 18,
                                          weight: FontWeight.w600)),
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
            ),
            Visibility(
              visible: controller.isLoading.value,
              child:  Loading(),

            ),
          ],
        ),
      ),
    );
  }
}
