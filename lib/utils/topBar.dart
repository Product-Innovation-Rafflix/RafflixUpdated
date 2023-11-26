import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class topBar extends StatelessWidget {
  String balance = "15";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Center(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 360.w,
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: primaryRed,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: primaryRed,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Icon(
                            Icons.account_balance_wallet_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$balance R',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(Icons.notifications_outlined),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(Icons.shopping_bag_outlined),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
