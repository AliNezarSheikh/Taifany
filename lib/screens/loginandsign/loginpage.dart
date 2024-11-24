import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffany/Controller/appcontroller.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/loginandsign/signorlogin.dart';
import 'package:tiffany/screens/loginandsign/signup.dart';

import '../Dashboard/dashboard0.dart';
import 'forgetpassword.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  appController controller = Get.put(appController());
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.off(() => const signorlogin(),
                  transition: Transition.leftToRight,
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 1));
            },
          ),
          title: const Text(
            'Sign in',
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
                height: 1.sh,
                color: const Color(0xfff9f9ff),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 1.sh,
                    width: 1.sw,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0).r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText(
                              text: "Welcome Back !",
                              color: Colors.black,
                              fontSize: 22,
                              weight: FontWeight.bold),
                          myText(
                              text: "Sign in to continue",
                              color: const Color(0xff1C2340),
                              fontSize: 18,
                              weight: FontWeight.w700),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Form(
                            key: _formKey,
                            child: Center(
                              child: Container(

                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32.0),
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                          left: 14, right: 5.0, top: 32.0,bottom: 18.0)
                                      .r,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      textinput(
                                        validator: (String? value) {
                                          if (!isValidEmail(value!)) {
                                            return 'Invalid email address';
                                          }
                                          return null;
                                        },
                                        controller: emailFieldController,
                                        hint: 'Email',
                                        type: TextInputType.emailAddress,
                                        textAlignVertical: TextAlignVertical.bottom,
                                        prefix: const Icon(Icons.email_rounded),
                                      ),
                                      SizedBox(height: 0.03.sh),
                                      textinput(
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
                                      SizedBox(height: 0.01.sh),
                                      Row(
                                        children: [
                                          Checkbox(
                                            activeColor: Colors.black,
                                            value: controller.rememberMe.value,
                                            onChanged: (value) {
                                              controller.getremember(val: value);
                                            },
                                          ),
                                          myText(
                                              text: 'Remember me',
                                              color: const Color(0xff1C2340),
                                              fontSize: 14,
                                              weight: FontWeight.w600),
                                          //  Spacer(),
                                          TextButton(
                                              onPressed: () {
                                                Get.off(() => const forgetpassword(),
                                                    transition:
                                                        Transition.rightToLeft,
                                                    curve: Curves.easeInOut,
                                                    duration: const Duration(seconds: 1));
                                              },
                                              child: myText(
                                                  text: 'Forget password ?',
                                                  color: const Color(0xff764CB2),
                                                  fontSize: 13,
                                                  weight: FontWeight.w600)),
                                        ],
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      InkWell(
                                        onTap: () async {
                                          if (_formKey.currentState!.validate()) {
                                            await controller.loginuser(
                                                email: emailFieldController.text,
                                                password: passwordFieldController.text,

                                            ).then((value){
                                              if(controller.successlogin.isTrue)
                                                {
                                                  if(controller.rememberMe.isTrue){
                                                    userToken.write("token", token);
                                                  }
                                                  controller.currentindex.value=0;
                                                  Get.off(() => const dashboard0(),
                                                      transition: Transition.zoom,
                                                      curve: Curves.easeInOut,
                                                      duration: const Duration(seconds: 1));
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
                                                  text: "Login",
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
                          ),
                          SizedBox(
                            height: 0.05.sh,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myText(
                                  text: "Already have not an account?",
                                  color: const Color(0xff1C2340),
                                  fontSize: 16,
                                  weight: FontWeight.w700),
                              SizedBox(
                                width: 0.025.sw,
                              ),
                              InkWell(
                                  onTap: () async {
                                    Get.off(() => const SignUpPage(),
                                        transition: Transition.fadeIn,
                                        curve: Curves.easeInOut,
                                        duration: const Duration(seconds: 1));
                                  },
                                  child: myText(
                                    text: 'Sign up !',
                                    color: Colors.purple,
                                    fontSize: 14,
                                    weight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible:controller.isLoading.value,
                child:   Loading(),

              ),
            ],
          ),
        ),
      )
    ;
  }
}
