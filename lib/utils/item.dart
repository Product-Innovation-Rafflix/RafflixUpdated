import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/models/itemModel.dart'; // Replace with the actual path to your item model

const Map categories = {
  "Fashion": Colors.pink,
  "Car": Colors.blueGrey,
  "Jewellery": Colors.lightBlue,
  "Real Estate": Colors.orange,
  "Device": Colors.redAccent
};

class ItemWidget extends StatelessWidget {
  final item currentItem;

  ItemWidget({required this.currentItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168.w,
      height: 168.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              width: 174.h,
              height: 33.w,
              decoration: BoxDecoration(
                color: categories[
                    currentItem.category], // Use the category to set the color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: Center(
                child: Text(
                  currentItem.itemName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 13, left: 8, right: 8, bottom: 8),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.w,
                      child: Image(
                        image: AssetImage(currentItem.photo),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${currentItem.price} ကျပ်",
                              style: TextStyle(
                                  fontSize: 13.r, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Text(
                              "${currentItem.totalTickets} Tickets left",
                              style: TextStyle(fontSize: 12.r),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 29.r,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
