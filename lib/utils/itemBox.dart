import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/models/itemBoxModel.dart';

class box extends StatefulWidget {
  final ItemBox itemBox;

  const box({required this.itemBox});

  @override
  State<box> createState() => _boxState();
}

class _boxState extends State<box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(children: [
          Image.asset("assets/images/shop.png"),
          Container(
            width: 195.w,
            height: 90.h,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemBox.itemName,
                    style: TextStyle(
                      fontSize: 16.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(widget.itemBox.details),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
