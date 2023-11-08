import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/utils/bottomNavigation.dart';
import 'package:rafflix/utils/topBar.dart';

class shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: topBar(),
      ),
      body: Center(
        child: Container(
          width: ScreenUtil().screenWidth * 0.7,
          height: ScreenUtil().screenHeight * 0.3,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            'ShopPage',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 1),
    );
  }
}
