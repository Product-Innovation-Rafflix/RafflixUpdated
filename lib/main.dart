import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/screens/browse.dart';
import 'package:rafflix/screens/createNewPassword.dart';
import 'package:rafflix/screens/logIn.dart';
import 'package:rafflix/screens/resetPassword.dart';
import 'package:rafflix/screens/signUp.dart';
import 'package:rafflix/screens/ticketChoose.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/screens/admin.dart';
import 'package:rafflix/screens/home.dart';
import 'package:rafflix/screens/profile.dart';
import 'package:rafflix/screens/shop.dart';
import 'package:rafflix/controllers/auth_service.dart'; // Import the AuthService

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
          home: AuthChecker(), // Use AuthChecker as the home widget
          routes: {
            '/admin': (context) => admin(),
            '/tickets': (context) {
              final Map<String, dynamic>? args = ModalRoute.of(context)!
                  .settings
                  .arguments as Map<String, dynamic>?;

              if (args != null) {
                return TicketChoose(
                  itemName: args['itemName'] as String,
                  price: args['price'] as int,
                );
              } else {
                return TicketChoose(itemName: "DefaultItem", price: 0);
              }
            },
            '/shop': (context) => Shop(),
            '/profile': (context) => Profile(),
            '/signin': (context) => SignIn(),
            '/signup': (context) => SignUp(),
            '/reset': (context) => ResetPass(),
            '/create': (context) => CreateNewPassword(),
          },
        );
      },
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthService
          .isAuthenticated(), // Implement a method to check authentication
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.data == true) {
            return Home();
          } else {
            return SignIn();
          }
        }
      },
    );
  }
}
