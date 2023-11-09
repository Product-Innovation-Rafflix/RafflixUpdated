import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/item.dart';
import 'package:rafflix/models/itemModel.dart';

class Browse extends StatefulWidget {
  final String shopName;

  Browse({required this.shopName});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  bool showNewItems = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Gap(5.h),
                Center(
                  child: Text(
                    widget.shopName,
                    style: TextStyle(fontSize: 35.r),
                  ),
                ),
                Gap(10.h),
                Container(
                  width: double.infinity,
                  height: 45.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showNewItems = true;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  showNewItems
                                      ? primaryRed
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  showNewItems ? Colors.white : Colors.grey),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            child: Text('ယခု'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showNewItems = false;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  !showNewItems
                                      ? primaryRed
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  !showNewItems ? Colors.white : Colors.grey),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            child: Text('ယခင်'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                if (showNewItems)
                  _NewItemsTransition()
                else
                  _OldItemsTransition(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NewItemsTransition extends StatelessWidget {
  final List<Widget> newItems = [
    ItemWidget(
      currentItem: item(
        itemName: 'Lipstick',
        price: 50000,
        totalTickets: 50,
        photo: 'assets/images/item.png',
        category: 'Fashion',
      ),
    ),
    ItemWidget(
      currentItem: item(
        itemName: 'Smartphone',
        price: 50000,
        totalTickets: 50,
        photo: 'assets/images/item.png',
        category: 'Device',
      ),
    ),
  ]; // Add your list of new items here

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: calculateHeight(
          newItems.length), // Calculate the height based on the number of items
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              170.w, // Adjust the cross-axis extent to fit your item width
          mainAxisSpacing: 10,
          crossAxisSpacing: 7,
        ),
        itemCount: newItems.length,
        itemBuilder: (BuildContext context, int index) {
          return newItems[index];
        },
      ),
    );
  }

  double calculateHeight(int itemCount) {
    final double itemHeight = 170.h; // Change this value if necessary
    const double numberOfColumns = 2;
    final double totalHeight =
        (itemCount / numberOfColumns).ceil() * (itemHeight + 10);
    return totalHeight;
  }
}

class _OldItemsTransition extends StatelessWidget {
  final List<Widget> oldItems = [
    ItemWidget(
      currentItem: item(
        itemName: 'Shoes',
        price: 60000,
        totalTickets: 30,
        photo: 'assets/images/item.png',
        category: 'Fashion',
      ),
    ),
    ItemWidget(
      currentItem: item(
        itemName: 'Car',
        price: 60000,
        totalTickets: 30,
        photo: 'assets/images/item.png',
        category: 'Car',
      ),
    ),
    ItemWidget(
      currentItem: item(
        itemName: 'Tablet',
        price: 60000,
        totalTickets: 30,
        photo: 'assets/images/item.png',
        category: 'Device',
      ),
    ),
    ItemWidget(
      currentItem: item(
        itemName: 'Necklace',
        price: 60000,
        totalTickets: 30,
        photo: 'assets/images/item.png',
        category: 'Jewellery',
      ),
    ),
    ItemWidget(
      currentItem: item(
        itemName: 'House',
        price: 60000,
        totalTickets: 30,
        photo: 'assets/images/item.png',
        category: 'Real Estate',
      ),
    ),
    ItemWidget(
      currentItem: item(
        itemName: 'Motorcycle',
        price: 60000,
        totalTickets: 30,
        photo: 'assets/images/item.png',
        category: 'Car',
      ),
    ),
  ]; // Add your list of old items here

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: calculateHeight(
          oldItems.length), // Calculate the height based on the number of items
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              170.w, // Adjust the cross-axis extent to fit your item width
          mainAxisSpacing: 10,
          crossAxisSpacing: 7,
        ),
        itemCount: oldItems.length,
        itemBuilder: (BuildContext context, int index) {
          return oldItems[index];
        },
      ),
    );
  }

  double calculateHeight(int itemCount) {
    final double itemHeight = 170.h; // Change this value if necessary
    const double numberOfColumns = 2;
    final double totalHeight =
        (itemCount / numberOfColumns).ceil() * (itemHeight + 10);
    return totalHeight;
  }
}
