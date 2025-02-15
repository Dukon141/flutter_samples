import 'package:flutter/material.dart';
import 'package:flutter_samples/ui/pages/home_page.dart';
import 'package:flutter_samples/ui/theme/AppTheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Samples',
          theme: appTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
