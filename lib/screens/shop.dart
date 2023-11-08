// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rafflix/models/itemBoxModel.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/bottomNavigation.dart';
import 'package:rafflix/utils/itemBox.dart';
import 'package:rafflix/utils/topBar.dart';

const fashion = <ItemBox>[
  ItemBox(
    itemName: "Sample Shop for Fashion",
    details: "This is a sample shop for Fashion made by the Rafflix Team",
    category: "Fashion",
  ),
  ItemBox(
    itemName: "Sample Shop for Fashion",
    details: "This is a sample shop for Fashion made by the Rafflix Team",
    category: "Fashion",
  ),
  ItemBox(
    itemName: "Sample Shop for Fashion",
    details: "This is a sample shop for Fashion made by the Rafflix Team",
    category: "Fashion",
  ),
  ItemBox(
    itemName: "Sample Shop for Fashion",
    details: "This is a sample shop for Fashion made by the Rafflix Team",
    category: "Fashion",
  ),
];

const device = <ItemBox>[
  ItemBox(
    itemName: "Sample Shop for Devices",
    details: "This is a sample shop for Devices made by the Rafflix Team",
    category: "Devices",
  ),
  ItemBox(
    itemName: "Sample Shop for Devices",
    details: "This is a sample shop for Devices made by the Rafflix Team",
    category: "Devices",
  ),
  ItemBox(
    itemName: "Sample Shop for Devices",
    details: "This is a sample shop for Devices made by the Rafflix Team",
    category: "Devices",
  ),
  ItemBox(
    itemName: "Sample Shop for Devices",
    details: "This is a sample shop for Devices made by the Rafflix Team",
    category: "Devices",
  ),
];

const jewellery = <ItemBox>[
  ItemBox(
    itemName: "Sample Shop for Jewellery",
    details: "This is a sample shop for Jewellery made by the Rafflix Team",
    category: "Jewellery",
  ),
  ItemBox(
    itemName: "Sample Shop for Jewellery",
    details: "This is a sample shop for Jewellery made by the Rafflix Team",
    category: "Jewellery",
  ),
  ItemBox(
    itemName: "Sample Shop for Jewellery",
    details: "This is a sample shop for Jewellery made by the Rafflix Team",
    category: "Jewellery",
  ),
  ItemBox(
    itemName: "Sample Shop for Jewellery",
    details: "This is a sample shop for Jewellery made by the Rafflix Team",
    category: "Jewellery",
  ),
];

const car = <ItemBox>[
  ItemBox(
    itemName: "Sample Shop for Car",
    details: "This is a sample shop for Car made by the Rafflix Team",
    category: "Car",
  ),
  ItemBox(
    itemName: "Sample Shop for Car",
    details: "This is a sample shop for Car made by the Rafflix Team",
    category: "Car",
  ),
  ItemBox(
    itemName: "Sample Shop for Car",
    details: "This is a sample shop for Car made by the Rafflix Team",
    category: "Car",
  ),
  ItemBox(
    itemName: "Sample Shop for Car",
    details: "This is a sample shop for Car made by the Rafflix Team",
    category: "Car",
  ),
];

const realEstate = <ItemBox>[
  ItemBox(
    itemName: "Sample Shop for Real Estate",
    details: "This is a sample shop for Real Estate made by the Rafflix Team",
    category: "Real Estate",
  ),
  ItemBox(
    itemName: "Sample Shop for Real Estate",
    details: "This is a sample shop for Real Estate made by the Rafflix Team",
    category: "Real Estate",
  ),
  ItemBox(
    itemName: "Sample Shop for Real Estate",
    details: "This is a sample shop for Real Estate made by the Rafflix Team",
    category: "Real Estate",
  ),
  ItemBox(
    itemName: "Sample Shop for Real Estate",
    details: "This is a sample shop for Real Estate made by the Rafflix Team",
    category: "Real Estate",
  ),
];

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<List<ItemBox>> categories = [
    fashion,
    device,
    jewellery,
    car,
    realEstate,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double tabBarHeight = 0;
    double itemBoxHeight = 125.0.h;
    double totalItemBoxHeight = categories.length * itemBoxHeight;

    double maxHeight = MediaQuery.of(context).size.height - tabBarHeight;

    double tabViewHeight =
        totalItemBoxHeight < maxHeight ? totalItemBoxHeight : maxHeight;

    return Scaffold(
      appBar: AppBar(title: topBar()),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 20.0),
              children: <Widget>[
                const Gap(20),
                const Text(
                  'Shop',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                _Categories(tabController: _tabController),
                SizedBox(
                  height: tabViewHeight,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      for (var category in categories) Items(items: category),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CustomBottomNavigation(currentIndex: 1),
        ],
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelColor: primaryRed,
      isScrollable: true,
      labelPadding: const EdgeInsets.only(right: 10),
      unselectedLabelColor: const Color(0xffcdcdcd),
      tabs: const [
        Tab(
          child: Text(
            'Fashion',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Device',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Jewellery',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Car',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Real Estate',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class Items extends StatelessWidget {
  final List<ItemBox> items;

  const Items({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: box(itemBox: items[index]),
          );
        },
      ),
    );
  }
}
