import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/screens/browse.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/screens/admin.dart';
import 'package:rafflix/screens/home.dart';
import 'package:rafflix/screens/profile.dart';
import 'package:rafflix/screens/shop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryRed,
              background: bgColor,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),

            // '/item': (context) {
            //   final String? itemName =
            //       ModalRoute.of(context)!.settings.arguments as String?;
            //   return ItemDetails(
            //       itemName:
            //           itemName!); // Use the null-aware operator to ensure the value is not null
            // },
            '/admin': (context) => admin(),
            '/shop': (context) => Shop(),
            '/profile': (context) => profile(),
            // '/signin': (context) => const SignIn(),
            // '/signup': (context) => const SignUp(),
          },
        );
      },
    );
  }
}
