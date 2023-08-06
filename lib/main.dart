import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Global/Core/Services/services.dart';
import 'Global/Core/Theme/Themes.dart';
import 'Local/Core/Constant/Routes.dart';
import 'Routes.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.lightsTheme,
          initialRoute: AppRoute.register,
          getPages: routes,
        );
      },
    );
  }
}
