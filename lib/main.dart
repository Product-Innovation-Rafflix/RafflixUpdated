import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:rafflix/screens/admin.dart';
import 'package:rafflix/screens/createNewPassword.dart';
import 'package:rafflix/screens/home.dart';
import 'package:rafflix/screens/logIn.dart';
import 'package:rafflix/screens/profile.dart';
import 'package:rafflix/screens/resetPassword.dart';
import 'package:rafflix/screens/shop.dart';
import 'package:rafflix/controllers/auth_service.dart';
import 'package:rafflix/screens/signUp.dart';
import 'package:rafflix/screens/ticketChoose.dart';
import 'package:rafflix/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> _authFuture;

  @override
  void initState() {
    super.initState();
    _authFuture = AuthService.isAuthenticated();
  }

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
          home: AuthHandler(authFuture: _authFuture),
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
            '/signup': (context) => SignUp(),
            '/reset': (context) => ResetPass(),
            '/create': (context) => CreateNewPassword(),
          },
        );
      },
    );
  }
}

class AuthHandler extends StatelessWidget {
  final Future<bool> authFuture;

  const AuthHandler({Key? key, required this.authFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: authFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: SpinKitFadingCube(
                color: Theme.of(context).primaryColor, // Change color as needed
                size: 50.0,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(body: Text('Error: ${snapshot.error}'));
        } else {
          final isAuthenticated = snapshot.data;

          if (isAuthenticated == true) {
            return Home();
          } else {
            return FutureBuilder<bool>(
              future: Future.delayed(Duration(seconds: 2), () => false),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                      child: SpinKitFadingCube(
                        color: Theme.of(context)
                            .primaryColor, // Change color as needed
                        size: 50.0,
                      ),
                    ),
                  );
                } else {
                  return AuthenticationScreen();
                }
              },
            );
          }
        }
      },
    );
  }
}

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace with the navigation to the sign-up screen
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUp()),
                // );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
