import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfilePage'),
      ),
      body: Center(
        child: Container(
          width: ScreenUtil().screenWidth * 0.7,
          height: ScreenUtil().screenHeight * 0.3,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            'ProfilePage',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
