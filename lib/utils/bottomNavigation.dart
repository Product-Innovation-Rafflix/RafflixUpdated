// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/data.dart';
import 'package:rafflix/theme.dart';
// import 'package:rafflix/utils/GetStoredCookie.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int currentIndex; // Add currentIndex as a parameter

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetectorButton(
            icon: Icons.dashboard_outlined,
            route: '/',
            isSelected: widget.currentIndex == 0,
          ),
          GestureDetectorButton(
            icon: Icons.store_outlined,
            route: '/shop',
            isSelected: widget.currentIndex == 1,
          ),
          if (status == "seller")
            GestureDetectorButton(
              icon: Icons.currency_exchange_outlined,
              route: '/admin',
              isSelected: widget.currentIndex == 2,
            ),
          GestureDetectorButton(
            icon: Icons.person_2_outlined,
            route: '/profile',
            isSelected: widget.currentIndex == 3,
          )
        ],
      ),
    );
  }
}

class GestureDetectorButton extends StatelessWidget {
  final IconData icon;
  final String route;
  final bool isSelected;

  const GestureDetectorButton({
    super.key,
    required this.icon,
    required this.route,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Navigator.pushNamed(context, route);
        }
      },
      child: SizedBox(
          height: 60.h,
          child: Icon(icon,
              size: 24.r, color: isSelected ? Colors.black : Colors.grey)),
    );
  }
}
