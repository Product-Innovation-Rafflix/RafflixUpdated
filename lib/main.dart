import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/screens/browse.dart';
import 'package:rafflix/screens/ticketChoose.dart';
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
            '/admin': (context) => admin(),
            '/tickets': (context) {
              final Map<String, dynamic>? args = ModalRoute.of(context)!
                  .settings
                  .arguments as Map<String, dynamic>?;

              if (args != null) {
                return TicketChoose(itemName: args['itemName'] as String);
              } else {
                // Handle the case where args is null
                return TicketChoose(itemName: "DefaultItem");
              }
            },
            '/shop': (context) => Shop(),
            '/profile': (context) => profile(),
          },
        );
      },
    );
  }
}
