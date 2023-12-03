import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminPage'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: ScreenUtil().screenWidth * 0.7,
          height: ScreenUtil().screenHeight * 0.3,
          alignment: Alignment.center,
          child: Text(
            'AdminPage',
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
