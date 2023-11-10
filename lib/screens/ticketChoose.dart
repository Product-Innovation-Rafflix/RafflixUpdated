import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/topBar.dart';

import '../utils/slideWidgetForTicketChoose.dart';
// import 'package:rafflix/utils/socket_manager.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class TicketChoose extends StatefulWidget {
  final String itemName; // Add this line

  const TicketChoose({Key? key, required this.itemName}) : super(key: key);

  static Map<String, String> itemAssetMap = {
    'Item-1': 'assets/images/house.jpg',
    'Item-2': 'assets/images/bmw-.jpg',
    'Item-3': 'assets/images/iPhone15ProMax.jpg',
    // Add more items as needed
  };
  @override
  State<TicketChoose> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<TicketChoose>
    with TickerProviderStateMixin {
  // late IO.Socket socket;
  late AnimationController _buttonController;
  late Animation<double> _buttonScale;
  List<Map> mydata = [
    {"key": "Item-1:1", "value": "true"},
    {"key": "Item-1:2", "value": "true"},
    {"key": "Item-1:3", "value": "true"},
    {"key": "Item-1:4", "value": "true"},
    {"key": "Item-1:5", "value": "true"},
    {"key": "Item-1:6", "value": "true"},
    {"key": "Item-1:7", "value": "true"},
    {"key": "Item-1:8", "value": "true"},
    {"key": "Item-1:9", "value": "true"},
    {"key": "Item-1:10", "value": "true"},
    {"key": "Item-1:11", "value": "true"},
    {"key": "Item-1:12", "value": "true"},
    {"key": "Item-1:13", "value": "true"},
    {"key": "Item-1:14", "value": "true"},
    {"key": "Item-1:15", "value": "true"},
    {"key": "Item-1:16", "value": "true"},
    {"key": "Item-1:17", "value": "true"},
    {"key": "Item-1:18", "value": "true"},
    {"key": "Item-1:19", "value": "true"},
    {"key": "Item-1:20", "value": "true"},
    {"key": "Item-1:21", "value": "true"},
    {"key": "Item-1:22", "value": "true"},
    {"key": "Item-1:23", "value": "true"},
    {"key": "Item-1:24", "value": "true"},
    {"key": "Item-1:25", "value": "true"},
    {"key": "Item-1:26", "value": "true"},
    {"key": "Item-1:27", "value": "true"},
    {"key": "Item-1:28", "value": "true"},
    {"key": "Item-1:29", "value": "true"},
    {"key": "Item-1:30", "value": "true"},
    {"key": "Item-1:31", "value": "true"},
    {"key": "Item-1:32", "value": "true"},
    {"key": "Item-1:33", "value": "true"},
    {"key": "Item-1:34", "value": "true"},
    {"key": "Item-1:35", "value": "true"},
    {"key": "Item-1:36", "value": "true"},
    {"key": "Item-1:37", "value": "true"},
    {"key": "Item-1:38", "value": "true"},
    {"key": "Item-1:39", "value": "true"},
    {"key": "Item-1:40", "value": "true"},
    {"key": "Item-1:41", "value": "true"},
    {"key": "Item-1:42", "value": "true"},
    {"key": "Item-1:43", "value": "true"},
    {"key": "Item-1:44", "value": "true"},
    {"key": "Item-1:45", "value": "true"},
    {"key": "Item-1:46", "value": "true"},
    {"key": "Item-1:47", "value": "true"},
    {"key": "Item-1:48", "value": "true"},
    {"key": "Item-1:49", "value": "true"},
    {"key": "Item-1:50", "value": "true"},
    {"key": "Item-1:51", "value": "true"},
    {"key": "Item-1:52", "value": "true"},
    {"key": "Item-1:53", "value": "true"},
    {"key": "Item-1:54", "value": "true"},
    {"key": "Item-1:55", "value": "true"},
    {"key": "Item-1:56", "value": "true"},
    {"key": "Item-1:57", "value": "true"},
    {"key": "Item-1:58", "value": "true"},
    {"key": "Item-1:59", "value": "true"},
    {"key": "Item-1:60", "value": "true"},
    {"key": "Item-1:61", "value": "true"},
    {"key": "Item-1:62", "value": "true"},
    {"key": "Item-1:63", "value": "true"},
    {"key": "Item-1:64", "value": "true"},
    {"key": "Item-1:65", "value": "true"},
    {"key": "Item-1:66", "value": "true"},
    {"key": "Item-1:67", "value": "true"},
    {"key": "Item-1:68", "value": "true"},
    {"key": "Item-1:69", "value": "true"},
    {"key": "Item-1:70", "value": "true"},
    {"key": "Item-1:71", "value": "true"},
    {"key": "Item-1:72", "value": "true"},
    {"key": "Item-1:73", "value": "true"},
    {"key": "Item-1:74", "value": "true"},
    {"key": "Item-1:75", "value": "true"},
    {"key": "Item-1:76", "value": "true"},
    {"key": "Item-1:77", "value": "true"},
    {"key": "Item-1:78", "value": "true"},
    {"key": "Item-1:79", "value": "true"},
    {"key": "Item-1:80", "value": "true"},
    // Continue adding more data as needed
  ];

  void _handleSocketEvent(dynamic data) {
    if (mounted) {
      setState(() {
        mydata = parseResponseData(data.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // socket = SocketManager().socket;
    // socket.emit(
    //     'request_tickets',
    //     widget
    //         .itemName);
    // socket.on('hello', _handleSocketEvent);
    // Initialize the button animation controller
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Initialize the button scale animation
    _buttonScale = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the button animation controller
    _buttonController.dispose();
    super.dispose();
  }

  void _onButtonPressed() async {
    // Trigger the button animation
    _buttonController.forward(from: 0.0);

    // Call the buyItems function after a delay (simulating a network request)
    await Future.delayed(const Duration(milliseconds: 300));

    bool? userConfirmation = await showCustomDialog(context, selectedItems);

    if (userConfirmation != null && userConfirmation) {
      buyItems();
    } else {
      print("User canceled");
    }
  }

  List<Map> parseResponseData(String response) {
    List<dynamic> parsedData = json.decode(response);
    print(parsedData);
    List<Map> parsedList = [];
    for (var item in parsedData) {
      print(item);
      parsedList.add({
        "key": item['key'],
        "value": item['value'],
      });
    }

    // Sort the list based on the numeric part of the keys
    parsedList.sort((a, b) {
      var aNumber =
          int.parse(a['key'].substring(a['key'].lastIndexOf(':') + 1));
      var bNumber =
          int.parse(b['key'].substring(b['key'].lastIndexOf(':') + 1));
      return aNumber.compareTo(bNumber);
    });

    return parsedList;
  }

  List<Map> selectedItems = [];

  void addToCart(Map item) {
    setState(() {
      selectedItems.add(item);
    });
  }

  void buyItems() {
    print("Items in Cart:");
    for (var item in selectedItems) {
      print("Item Key: ${item['key']}, Value: ${item['value']}");
    }

    // Trigger the tickt_changes event
    // socket.emit("tickt_changes", [widget.itemName, json.encode(selectedItems)]);
  }

  @override
  Widget build(BuildContext context) {
    int trueValuesCount =
        mydata.where((element) => element['value'] == 'true').length;
    String assetPath = TicketChoose.itemAssetMap[widget.itemName] ??
        'assets/images/iPhone15ProMax.jpg';
    return Scaffold(
      appBar: AppBar(title: topBar()),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.grey[350],
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
              top: 0.h,
              child: Container(
                width: 360.w,
                height: 240.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetPath), fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              top: 240.h,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 550.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "iPhone 15 Pro Max",
                          style: TextStyle(
                              fontSize: 30.r, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "5000 Ks / Tickets",
                          style: TextStyle(
                            fontSize: 20.r,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Your Ticket",
                          style: TextStyle(
                              fontSize: 20.r, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "$trueValuesCount Tickets Left",
                          style: TextStyle(
                              fontSize: 15.r, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    // Use the SlideWidget here
                    SizedBox(
                      height: 250.h,
                      child: SlideWidget(
                        mydata: mydata,
                        selectedItems: selectedItems,
                        numberOfSlides: (mydata.length / 35).ceil(),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.h,
              child: GestureDetector(
                onTap: _onButtonPressed,
                child: ScaleTransition(
                  scale: _buttonScale,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryRed)),
                    onPressed: _onButtonPressed,
                    child: SizedBox(
                      height: 50.h,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ဝယ်ယူမည်',
                          style: TextStyle(fontSize: 20.r, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> showCustomDialog(
    BuildContext context, List<Map> selectedItems) async {
  bool? result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.red,
              size: 40.r,
            ),
            SizedBox(width: 10.h),
            Text(
              'အတည်ပြုပါ။',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.r),
            ),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You have selected the following Ticket Numbers:',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10.h),
            for (var item in selectedItems)
              Text(
                'Ticket Number: ${item['key'].split(':')[1]}',
                style: TextStyle(color: Colors.black),
              ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green.shade400)),
                onPressed: () {
                  Navigator.of(context)
                      .pop(false); // Close the dialog with false
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Close the dialog with true
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
              ),
            ],
          ),
        ],
      );
    },
  );

  return result ?? false; // Return false if the dialog is dismissed
}
