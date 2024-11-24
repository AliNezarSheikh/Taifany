import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/loginandsign/signorlogin.dart';
import 'package:tiffany/screens/loginandsign/successcreat.dart';

import '../../Controller/appcontroller.dart';
import '../../animation/animation.dart';
import '../../screens/loginandsign/loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  appController controller = Get.put(appController());
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController userFieldController = TextEditingController();
  TextEditingController fNameFieldController = TextEditingController();
  TextEditingController lNameFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+971'; // Default country code



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              AnimationsRouteltr(page: const signorlogin()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'Sign up',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Obx(
            () => Stack(
              children: [
                Container(
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.grey[200],
                          child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0.03.sh),
                        Center(
                          child: CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.grey[200],
                            child: const Icon(
                              Icons.camera_alt,
                              size: 48,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 0.03.sh),
                        textinput(
                                controller: userFieldController,
                                hint: 'User Name',
                                type: TextInputType.text,
                                validator: (String? value) {
                                  if (value!.length < 4) {
                                    return "User Name is Short";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 0.02.sh),
                        textinput(
                          controller: fNameFieldController,
                          hint: 'First Name',
                          type: TextInputType.text,
                          validator: (String? value) {
                            if (value!.length < 2) {
                              return "First Name is Short";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 0.02.sh),
                        textinput(
                          controller: lNameFieldController,
                          hint: 'Last Name',
                          type: TextInputType.text,
                          validator: (String? value) {
                            if (value!.length < 2) {
                              return "Last Name is Short";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 0.02.sh),
                        Stack(
                          children: [
                            TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              controller: phoneFieldController,
                              validator: (String? value) {
                                if (!isValidNumber(value!)) {
                                  return "Invalid Phone Number";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                fillColor: Color(0xfff4f5f7),
                                filled: true,
                                hintText: 'Phone',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0,
                                      color: Color(0xfff4f5f7),
                                      strokeAlign: 0,
                                      style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0,
                                      color: Color(0xfff4f5f7),
                                      strokeAlign: 0,
                                      style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
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
                            CountryCodePicker(
                              dialogSize: Size(0.5.sw, 0.4.sh),
                              onChanged: (countryCode) {
                                setState(() {
                                  _selectedCountryCode = countryCode.dialCode!;
                                });
                              },
                              initialSelection: 'AE',
                              flagDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              favorite: const ['+971', 'AE'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              backgroundColor: const Color(0xfff4f5f7),
                              boxDecoration: const BoxDecoration(
                                color: Color(0xfff4f5f7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                            ),
                            //textinput(hint: 'Phone Number',type: TextInputType.phone,),
                          ],
                        ),
                        SizedBox(height: 0.02.sh),
                        textinput(
                          hint: 'Email',
                          type: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (!isValidEmail(value!)) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                          controller: emailFieldController,
                        ),
                        SizedBox(height: 0.02.sh),
                        textinput(
                          hint: "Password",
                          type: TextInputType.visiblePassword,
                          secure: controller.notvisable.value,
                          character: "*",
                          controller: passwordFieldController,
                          validator: (String? value) {
                            if (value!.length < 6) {
                              return "Password is Short";
                            } else {
                              return null;
                            }
                          },
                          suffix: IconButton(
                            icon: Icon(controller.notvisable.isTrue
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: () {
                              controller.getvisiblepassword();
                            },
                          ),
                        ),
                        SizedBox(height: 0.03.sh),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.black,
                              value: controller.agree.value,
                              onChanged: (value) {
                                controller.getagree(val: value);
                              },
                            ),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                        'By creating an account you agree to '),
                                    TextSpan(
                                      text:
                                      'our Terms of Service and Privacy Policy',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        controller.showError.value
                            ? const Text(
                          'Please agree to the terms and conditions',
                          style: TextStyle(color: Colors.red),
                        )
                            : const SizedBox(),
                        SizedBox(height: 0.025.sh),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                controller.submitForm();
                                if (controller.agree.isTrue) {
                                  await controller.registeruser(
                                    username: userFieldController.text,
                                    email: emailFieldController.text,
                                    password: passwordFieldController.text,
                                    firstname: fNameFieldController.text,
                                    countrycode: _selectedCountryCode.toString(),
                                    lastname: lNameFieldController.text,
                                    number: phoneFieldController.text,
                                  );
                                  if(controller.successregister.isTrue){
                                    Get.off(() => const successcreate(),
                                        transition: Transition.upToDown,
                                        curve: Curves.easeInOut,
                                        duration: const Duration(milliseconds: 700));
                                    controller.successregister.value=false;
                                  }

                                }
                              }
                            },
                            child: Container(
                              width: 0.75.sw,
                              height: 0.065.sh,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff1D79A1),
                                    Color(0xff0D3652),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 0.02.sh),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Already have an account? '),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 0.025.sw,
                            ),
                            InkWell(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    FadeSlidePageRoute(page: const loginpage()),
                                  );
                                },
                                child: myText(
                                  text: 'Sign in !',
                                  color: Colors.purple,
                                  fontSize: 14,
                                  weight: FontWeight.bold,
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
                  visible: controller.isLoading.value,
                  child:Loading(),

                ),
              ],
            ),
      ),
    );

      const Stack(
        children: [


        ],
      )
    ;
  }
}
