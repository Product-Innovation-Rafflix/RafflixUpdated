import 'package:flutter/material.dart';

import 'ticketWidget.dart';

class SlideWidget extends StatefulWidget {
  final List<Map> mydata;
  final List<Map> selectedItems;
  final int numberOfSlides; // Add this variable

  SlideWidget({
    required this.mydata,
    required this.selectedItems,
    required this.numberOfSlides,
  });

  @override
  _SlideWidgetState createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch, // Ensure the Column expands to full width
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return buildSlide(widget.mydata, widget.selectedItems, index);
            },
            itemCount: widget.numberOfSlides,
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildSlide(List<Map> mydata, List<Map> selectedItems, int pageIndex) {
    int itemsPerPage = 35;

    int start = pageIndex * itemsPerPage;
    int end = start + itemsPerPage;
    end = end > mydata.length ? mydata.length : end;

    List<Map> pageData = mydata.sublist(start, end);

    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return TicketWidget(
                onTap: () {
                  setState(() {
                    if (selectedItems.contains(pageData[index])) {
                      selectedItems.remove(pageData[index]);
                    } else {
                      selectedItems.add(pageData[index]);
                    }
                  });
                },
                item: pageData[index],
                isSelected: selectedItems.contains(pageData[index]),
              );
            },
            childCount: pageData.length,
          ),
        ),
      ],
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.numberOfSlides, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blueAccent : Colors.grey,
          ),
        );
      }),
    );
  }
}
