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
        padding: const EdgeInsets.only(top: 10),
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
                          child: const Icon(
                            Icons.account_balance_wallet_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$balance R',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
                    width: 15.w,
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 24.r,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 24.r,
                  ),
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
