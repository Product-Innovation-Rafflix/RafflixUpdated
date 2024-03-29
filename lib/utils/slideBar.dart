// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/models/sliderImages.dart';

const carruselImages = <Receta>[
  Receta(
      id: 1,
      name: "iPhone",
      image: "assets/images/iPhone.jpg",
      description: "That is about iPhone"),
  Receta(
      id: 2,
      name: "iPhone",
      image: "assets/images/house.jpg",
      description: "That is about iPhone"),
  Receta(
      id: 3,
      name: "iPhone",
      image: "assets/images/bmw.jpg",
      description: "That is about iPhone"),
];

class homePageSlider extends StatefulWidget {
  const homePageSlider({super.key});

  @override
  State<homePageSlider> createState() => _homePageSliderState();
}

class _homePageSliderState extends State<homePageSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        CarouselSlider.builder(
          itemCount: carruselImages.length,
          itemBuilder: (context, index, realIndex) {
            return CardImages(
              carruselImages: carruselImages[index],
            );
          },
          options: CarouselOptions(
            height: 200.h,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class CardImages extends StatelessWidget {
  final Receta carruselImages;
  const CardImages({super.key, required this.carruselImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          child: FadeInImage(
            placeholder: const AssetImage("assets/images/loading1.gif"),
            image: AssetImage(carruselImages.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

//TODO: use network image and chache