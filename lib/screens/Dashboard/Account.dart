import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiffany/reusable/components.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 20.0),
            child: Column(
              children: [
                     accountbanner(onChanged:   (value) {
                       setState(() {
                         show = value;
                       });
                     }, value: show,),
                SizedBox(
                  height:0.03.sh,


                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: myText(
                      text: "Account",
                      color: Colors.black,
                      fontSize: 16,
                      weight: FontWeight.normal),
                ),
                SizedBox(
                  height:0.015.sh,


                ),
                accountcontent(icon: Icons.shopping_bag_outlined, text: "My Orders"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.favorite, text: "My Favourites"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.location_on_rounded, text: "Shipping Address"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.notifications_outlined, text: "Notification"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.credit_card_sharp, text: "My Saved Cards"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.lock, text: "Change Password"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                SizedBox(
                  height:0.03.sh,


                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: myText(
                      text: "General",
                      color: Colors.black,
                      fontSize: 16,
                      weight: FontWeight.normal),
                ),
                SizedBox(
                  height:0.015.sh,


                ),
                accountcontent(icon: Icons.translate, text: "Languages",widget: myText(text: "English", color: const Color(0xFF8E8E93), fontSize: 13, weight: FontWeight.w300)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.currency_exchange_outlined, text: "Currency",widget: myText(text: "AED", color: const Color(0xFF8E8E93), fontSize: 13, weight: FontWeight.w300)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.sunny, text: "Appearance"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                accountcontent(icon: Icons.info, text: "About Taifany"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                SizedBox(
                  height:0.02.sh,


                ),
                Container(

                  decoration: const BoxDecoration(
                    color: Color(0xFF51B4C7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.rightFromBracket,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 0.02.sw,
                        ),
                        myText(
                            text: "Logout",
                            color: Colors.white,
                            fontSize: 16,
                            weight: FontWeight.w500),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height:0.02.sh,


                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
