// ignore_for_file: empty_statements, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/bottomNavigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  // Future<String?> getStoredCookie() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('cookie');
  // }

  Future<void> getUserData() async {
    const url = "https://rafflixbackgroundsevice.onrender.com/profile";
    // final storedCookie =
    //     await getStoredCookie();
    final storedCookie = "cookie";

    if (storedCookie != null) {
      // Check if the stored cookie is not null
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Cookie': storedCookie},
      );

      if (response.statusCode == 200) {
        setState(() {
          final Map<String, dynamic> parsedData = json.decode(response.body);
          userData = {
            'name': parsedData['name'] ?? '',
            'phone': parsedData['_id'] ?? '',
            'profile': parsedData['profile'] ?? '',
            'owned_tickets':
                parsedData['own_tickets'] ?? [], // Add the owned tickets data
            // Add other required fields similarly
          };
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } else {
      throw Exception(
          'Cookie not found'); // Handle the case when the cookie is not found
    }
  }

  Future<void> logOut() async {
    const url =
        "https://rafflixbackgroundsevice.onrender.com/logout"; // Replace with your server logout URL
    // final storedCookie = await getStoredCookie();
    final storedCookie = "cookie";

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{'Cookie': storedCookie ?? ''},
    );

    print("Logout URL: $url");

    if (response.statusCode == 200) {
      // Clear the stored cookie in the shared preferences
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.remove('cookie');
      // Perform any additional actions needed upon successful logout
      print("Logout successful");
    } else {
      print("Logout failed");
      throw Exception('Failed to log out');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView(
        padding: const EdgeInsets.all(25),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 35.h,
          ),
          userProfile(),
          Gap(20.h),
          GestureDetector(
            onTap: () {},
            child: _Settings(
              icon: Icons.person_2,
              text: "Admins",
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: _Settings(
              icon: Icons.stacked_bar_chart,
              text: "Tickets",
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: _Settings(
              icon: Icons.settings,
              text: "Setting",
              color: primaryRed,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: _Settings(
              icon: Icons.earbuds_rounded,
              text: "FAQ",
              color: Colors.redAccent,
            ),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 3),
    );
  }

  Widget userProfile() {
    String profileBase64 = userData['profile'] ?? "";
    List<dynamic> ownedTickets = userData['owned_tickets'] ?? [];

    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 3, color: primaryRed))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: double.infinity,
            width: 80.w,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(80)),
            child: profileBase64.isNotEmpty
                ? Image.memory(
                    base64.decode(profileBase64),
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.person,
                    size: 50.r,
                  ),
          ),
          Gap(15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userData['name'] ?? "User Name",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(userData['phone'] ?? "Phone Number")
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              logOut();
            },
            child: Icon(
              Icons.logout,
              color: primaryRed,
              size: 25.r,
            ),
          )
        ]),
      ),
    );
  }
}

class _Settings extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  _Settings({required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Handle tap action here
        },
        splashColor: color.withOpacity(0.3), // Customize the splash color
        child: Container(
          width: double.infinity,
          height: 60,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: color,
                ),
                const SizedBox(width: 10),
                Text(text, style: TextStyle(fontSize: 20, color: color)),
                const Spacer(),
                const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
