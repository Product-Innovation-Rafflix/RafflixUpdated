import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/models/itemBoxModel.dart';
import 'package:rafflix/screens/browse.dart'; // Import the browse screen

class box extends StatefulWidget {
  final ItemBox itemBox;

  const box({required this.itemBox});

  @override
  State<box> createState() => _boxState();
}

class _boxState extends State<box> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Browse(
                shopName: widget
                    .itemBox.itemName), // Pass the itemName as the shopName
          ), // Navigate to the browse screen
        );
      },
      child: Container(
        width: double.infinity,
        height: 125.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Image.asset("assets/images/shop.png"),
              SizedBox(width: 15.w),
              Flexible(
                child: Container(
                  height: 90.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.itemBox.itemName,
                        style: TextStyle(
                          fontSize: 16.r,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.h),
                      Flexible(
                        child: Text(
                          widget.itemBox.details,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
