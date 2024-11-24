import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiffany/reusable/components.dart';
import 'package:tiffany/screens/loginandsign/splashscreen.dart';

import 'generated/l10n.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  loginorboard=FirstTime.read("isFirstTime") ?? true;
  token=userToken.read("token") ?? "";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,

      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child){
        return   GetMaterialApp(
          locale: const Locale("en"),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
            supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
            )
          ),
          debugShowCheckedModeBanner: false,

          home:const Splashscreen(),//productsincategoriey()  //Splashscreen(),
        );
      }

    );
  }
}

