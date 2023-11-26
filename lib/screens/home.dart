import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rafflix/models/itemBoxModel.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/bottomNavigation.dart';
import 'package:rafflix/utils/slideBar.dart';
import 'package:rafflix/utils/topBar.dart';
import 'package:rafflix/utils/itemBox.dart';

const itemBoxes = <ItemBox>[
  ItemBox(
    itemName: "Sample Shop",
    details: "This is a sample shop made by the Rafflix Team",
    category: "Fashion",
  ),
  ItemBox(
    itemName: "Sample Shop",
    details: "This is a sample shop made by the Rafflix Team",
    category: "Electronics",
  ),
  ItemBox(
    itemName: "Sample Shop",
    details: "This is a sample shop made by the Rafflix Team",
    category: "Fashion",
  ),
  ItemBox(
    itemName: "Sample Shop",
    details: "This is a sample shop made by the Rafflix Team",
    category: "Beauty",
  ),
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "All";
  List<ItemBox> filteredItemBoxes = itemBoxes;

  void filterItems(String category) {
    if (category == "All") {
      setState(() {
        selectedCategory = "All";
        filteredItemBoxes = itemBoxes;
      });
    } else {
      List<ItemBox> tempFilteredItemBoxes =
          itemBoxes.where((item) => item.category == category).toList();
      setState(() {
        selectedCategory = category;
        filteredItemBoxes = tempFilteredItemBoxes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: topBar(),
        backgroundColor: bgColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
            child: Column(children: [SearchBar()]),
          ),
          homePageSlider(),
          Gap(20.h),
          _Categories(
            filterItems: filterItems,
            selectedCategory: selectedCategory,
          ),
          Gap(10.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredItemBoxes.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
                child: box(itemBox: filteredItemBoxes[index]),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(
        currentIndex: 0,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      height: 45.h,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "ရှာဖွေပါ...", border: InputBorder.none),
              ),
            ),
            Icon(Icons.search)
          ],
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  final Function(String) filterItems;
  final String selectedCategory;

  const _Categories(
      {required this.filterItems, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 40.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Gap(15.w),
            _Category(
              icon: Icons.window,
              text: "အားလုံး",
              filterItems: filterItems,
              isSelected: selectedCategory == "All",
            ),
            Gap(20.w),
            _Category(
              icon: Icons.coffee_rounded,
              text: "ဖက်ရှင်",
              filterItems: filterItems,
              isSelected: selectedCategory == "Fashion",
            ),
            Gap(20.w),
            _Category(
              icon: Icons.smart_toy,
              text: "အီလက်ထရောနစ်",
              filterItems: filterItems,
              isSelected: selectedCategory == "Electronics",
            ),
            Gap(20.w),
            _Category(
              icon: Icons.shopify_outlined,
              text: "Beauty",
              filterItems: filterItems,
              isSelected: selectedCategory == "Beauty",
            ),
            Gap(15.w),
          ],
        ),
      ),
    );
  }
}

class _Category extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function(String) filterItems;
  final bool isSelected;

  const _Category({
    required this.icon,
    required this.text,
    required this.filterItems,
    required this.isSelected,
  });

  @override
  __CategoryState createState() => __CategoryState();
}

class __CategoryState extends State<_Category> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.filterItems(widget.text);
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: widget.isSelected ? primaryRed : Colors.black,
              ),
              Gap(6),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.isSelected ? primaryRed : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
