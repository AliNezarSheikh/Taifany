import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffany/screens/loginandsign/signorlogin.dart';

import '../../Controller/appcontroller.dart';
import '../../animation/animation.dart';
import '../../reusable/components.dart';
import 'changepassword.dart';


class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword>
    with TickerProviderStateMixin {
  appController controller = Get.put(appController());
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AnimationController? _controller;
  AnimationController? _controller2;
  Animation<double>? _animation;
  Animation<double>? _animation2;
  String _otp = '';

  String _errorText = '';
  bool finish = false;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!);
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(_controller2!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              nav = false;
            });
            Navigator.pushAndRemoveUntil(
              context,
              AnimationsRouteltr(page: const signorlogin()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'Forget Password',
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
            nav == false
                ? Container(
              width: 1.sw,
              height: double.infinity,
              color: const Color(0xffF9F9FF),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      //width: 0.9.sw,
                    //  height: 0.45.sh,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 18.0, top: 32.0,bottom: 32.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            myText(
                                align: TextAlign.center,
                                text:
                                "We will send a mail to\nthe email address you registered\nto regain your password.",
                                color: const Color(0xff1C2340),
                                fontSize: 16,
                                weight: FontWeight.w500),
                            SizedBox(height: 0.02.sh),
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                                child: textinput(

                                  hint: 'Email Address',
                                  controller: emailFieldController,
                                  validator: (String? value) {
                                    if (!isValidEmail(value!)) {
                                      return 'Invalid email address';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            SizedBox(height: 0.03.sh),
                            InkWell(
                              onTap: () async {
                                if(_formKey.currentState!.validate()){
                                await controller.getotp(email: emailFieldController.text)
                                    .then((value){
                                  if (controller.successotp.isTrue) {
                                    _controller!.forward();
                                    setState(() {
                                      nav = true;
                                      vis = true;
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
                                        text: "Send",
                                        color: Colors.white,
                                        fontSize: 18,
                                        weight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
                : FadeTransition(
              opacity: _animation!,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: _animation2!,
                    child: Container(
                      width: 1.sw,
                     height: double.infinity,
                      color: const Color(0xffF9F9FF),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(

                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 18.0, top: 32.0,bottom: 32.0).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    myText(
                                        align: TextAlign.center,
                                        text:
                                        "We will send a mail to\nthe email address you registered\nto regain your password.",
                                        color: const Color(0xff1C2340),
                                        fontSize: 16,
                                        weight: FontWeight.w500),
                                    SizedBox(height: 0.02.sh),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: OtpTextField(
                                        numberOfFields: 4,

                                        fieldWidth: 0.15.sw,



                                        cursorColor: Colors.black,



                                        showCursor: true,
                                        fillColor: const Color(0xffF4F5F7),
                                        filled: true,
                                        borderColor: const Color(0xffF4F5F7),
                                        enabledBorderColor: const Color(0xffF4F5F7),
                                        focusedBorderColor: const Color(0xffF4F5F7),
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        keyboardType: TextInputType.number,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        decoration: const InputDecoration(

                                        ),
                                        showFieldAsBox: true,

                                        onCodeChanged: (String code) {

                                        },

                                        onSubmit: (String verificationCode) {
                                          setState(() {
                                            finish = true;
                                            _otp = verificationCode;

                                            if (validateOtp(_otp)) {

                                              _errorText = '';

                                            } else {

                                              _errorText = 'Invalid OTP';

                                            }

                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 0.01.sh),
                                    if (_errorText.isNotEmpty)
                                      Text(
                                        _errorText,

                                        style: const TextStyle(color: Colors.red),
                                      ),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        myText(
                                            text: 'Not Yet Code',
                                            color: const Color(0xff1C2340),
                                            fontSize: 16,
                                            weight: FontWeight.w700),
                                        //  Spacer(),
                                        TextButton(
                                            onPressed: () async {
                                              await controller.getotp(email: emailFieldController.text);
                                              if(controller.successotp.isTrue){
                                                AwesomeDialog(
                                                    context: Get.context!,
                                                    dialogType: DialogType.success,
                                                    animType: AnimType.topSlide,
                                                    title: "Success",
                                                    desc: "OTP has been sent",
                                                    btnOkOnPress: () {},
                                                    headerAnimationLoop: false,
                                                    btnOkIcon: Icons.check_circle,
                                                    btnOkColor: Colors.green)
                                                    .show();
                                              }
                                            },
                                            child: myText(
                                                text: 'Resend Now !',
                                                color: const Color(0xff764CB2),
                                                fontSize: 16,
                                                weight: FontWeight.w700)),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () async {


                                        if (_errorText.isEmpty && finish) {
                                        await controller.sendotp(
                                            otp: _otp,
                                          ).then((value){
                                              if(controller.sendedotp.isTrue){
                                                setState(() {

                                                  nav = true;
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              FadePageRoute(page: const changepass()),
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
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                        ),
                                        child: Center(
                                            child: myText(
                                                text: "Send",
                                                color: Colors.white,
                                                fontSize: 18,
                                                weight: FontWeight.w600)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: vis,
                      child: Container(
                        width: 1.sw,
                        height: 1.sh,
                        color: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //width: 0.9.sw,
                              //  height: 0.4.sh,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                           height: 0.07.sh,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Color(0xff0D3652),
                                                  Color(0xff1D79A1),
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                                child: myText(
                                                    text:
                                                    "Password Reset Email Sent",
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    weight: FontWeight.w600)),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 26.0),
                                      child: myText(
                                          align: TextAlign.center,
                                          text:
                                          "An email has been sent to\nyou Follow direction in the email to\nreset password.",
                                          color: const Color(0xff1C2340),
                                          fontSize: 16,
                                          weight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 0.02.sh),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          vis = false;
                                          _controller2!.forward();
                                        });
                                      },
                                      child: Container(
                                        width: 0.7.sw,
                                        height: 0.13.sw,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color(0xff0D3652),
                                              Color(0xff1D79A1),
                                            ],
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                        ),
                                        child: Center(
                                            child: myText(
                                                text: "OK",
                                                color: Colors.white,
                                                fontSize: 18,
                                                weight: FontWeight.w600)),
                                      ),
                                    ),
                                    SizedBox(height: 0.02.sh),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Visibility(
              visible: controller.isLoading.value,
              child: Loading(),

            ),
          ],
        ),
      ),
    );
  }
}
