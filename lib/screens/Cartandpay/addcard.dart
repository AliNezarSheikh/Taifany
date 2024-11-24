import 'dart:math' as math;
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_type_detector/models.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiffany/reusable/components.dart';

import '../../reusable/comp2.dart';

class addcard extends StatefulWidget {
  @override
  _addcardState createState() => _addcardState();
}

class _addcardState extends State<addcard> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  String cvvhide = '';
  bool showBack = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  bool isCvvhide = true;
  CreditCardValidator _ccValidator = CreditCardValidator();
  @override
  void initState() {
    super.initState();
    cvvCtrl.addListener(_maskInput);

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  void _maskInput() {
    setState(() {
      // Replace each character in the input with an asterisk
      cvvhide = "*" * cvvCtrl.text.length;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    cvvCtrl.removeListener(_maskInput);
    cvvCtrl.dispose();
    super.dispose();
  }

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
        title: myText(
            text: "Add Card",
            color: Color(0xFF1C2340),
            fontSize: 16,
            weight: FontWeight.w600),
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xffEEF9F5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: myText(
                    text: "Payment",
                    color: Color(0xFF1C2340),
                    fontSize: 17,
                    weight: FontWeight.w600),
              ),
              CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,

                cardHolderName: cardHolderName,
                cvv: isCvvhide ? cvvhide : cvv,
                showBackSide: showBack,
                frontBackground: CardBackgrounds.custom(0xFF51B4C7),
                backBackground: CardBackgrounds.custom(0xFF51B4C7),
                showShadow: true,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      myText(
                          text: "Card Number*",
                          color: Colors.black,
                          fontSize: 13,
                          weight: FontWeight.w600),
                      TextFormField(
                        controller: cardNumberCtrl,
                        validator: (value) {
                          var ccNumResults = _ccValidator
                              .validateCCNum(cardNumberCtrl.toString());
                          if (ccNumResults.isPotentiallyValid) {
                            return "Invalid Card Number";
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final newCardNumber = value.trim();
                          var newStr = '';
                          final step = 4;

                          for (var i = 0; i < newCardNumber.length; i += step) {
                            newStr += newCardNumber.substring(
                                i, math.min(i + step, newCardNumber.length));
                            if (i + step < newCardNumber.length) newStr += ' ';
                          }

                          setState(() {
                            cardNumber = newStr;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      myText(
                          text: "Card Holder Name*",
                          color: Colors.black,
                          fontSize: 13,
                          weight: FontWeight.w600),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter card holder name';
                          }
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]')),
                        ],
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            cardHolderName = value.toUpperCase();
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: myText(
                                  text: "Exp.Date*",
                                  color: Colors.black,
                                  fontSize: 13,
                                  weight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Container(
                                  child: myText(
                                      text: "CCV*",
                                      color: Colors.black,
                                      fontSize: 13,
                                      weight: FontWeight.w600),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    isCvvhide
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isCvvhide = !isCvvhide;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: TextFormField(
                                validator: (value) {
                                  var expDateResults =
                                      _ccValidator.validateExpDate(
                                          expiryFieldCtrl.toString());
                                  if (expDateResults.isPotentiallyValid) {
                                    return "Invalid Expiry Date";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: expiryFieldCtrl,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 5,
                                onChanged: (value) {
                                  var newDateValue = value.trim();
                                  final isPressingBackspace =
                                      expiryDate.length > newDateValue.length;
                                  final containsSlash =
                                      newDateValue.contains('/');

                                  if (newDateValue.length >= 2 &&
                                      !containsSlash &&
                                      !isPressingBackspace) {
                                    newDateValue =
                                        newDateValue.substring(0, 2) +
                                            '/' +
                                            newDateValue.substring(2);
                                  }
                                  setState(() {
                                    expiryFieldCtrl.text = newDateValue;
                                    expiryFieldCtrl.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: newDateValue.length));
                                    expiryDate = newDateValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: TextFormField(
                                controller: cvvCtrl,
                                validator: (value) {
                                  var ccNumResults = _ccValidator
                                      .validateCCNum(cardNumberCtrl.toString());
                                  var cvvResults = _ccValidator.validateCVV(
                                      cvvCtrl.toString(),
                                      ccNumResults.ccType);
                                  if (cvvResults.isPotentiallyValid) {
                                    return "Invalid  CVV";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: isCvvhide,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 3,
                                onChanged: (value) {
                                  setState(() {
                                    cvv = value;
                                  });
                                },
                                focusNode: _focusNode,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            showToast(context,"Success","Card Saved Successfully");
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all( 16.0),
                          child: Container(
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              color: Color(0xFF51B4C7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:   myText(
                                    text: "Save the Card",
                                    color: Colors.white,
                                    fontSize: 18,
                                    weight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
