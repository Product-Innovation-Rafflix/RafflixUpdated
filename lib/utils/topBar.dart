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
        padding: const EdgeInsets.only(
          top: 2,
        ),
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
                          width: 0.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showAddDialog(context);
                          },
                          child: Container(
                            height: double.infinity,
                            width: 25.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: primaryRed,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
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

  void _showAddDialog(BuildContext context) {
    double dialogWidth = MediaQuery.of(context).size.width * 0.9;

    // Create a TextEditingController
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(
                "Gift Card",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.r),
              ),
              Spacer(),
              Container(
                height: 30.h,
                width: 30.w,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          content: Container(
            height: 105.h,
            width: dialogWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fill coins here."),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: textController, // Set the controller
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your gift text here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          surfaceTintColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                // Retrieve the entered value from the controller
                String enteredValue = textController.text;
                print("Entered value: $enteredValue");
                Navigator.of(context).pop(); // Close the dialog
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
