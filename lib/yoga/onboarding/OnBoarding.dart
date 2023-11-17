// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/yoga/onboarding/BoardModel.dart';
import 'package:flutter_ui/yoga/widgets/PrimaryAppButton.dart';
import 'package:flutter_ui/yoga/yougaUtils/YColors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Variables
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;
  List<OnBoardingModel> demoData = [
    OnBoardingModel(
      "Your Yoga",
      "Does Hydroderm Work",
      "assert/images/first.jpg",
    ),
    OnBoardingModel(
      "Your healthy",
      "Recommended You To Use After Before \nBreast Enhancement",
      "assert/images/second.jpg",
    ),
    OnBoardingModel(
      "Learning to Relex",
      "The Health Benefits Of Sunglasses",
      "assert/images/third.jpg",
    )
  ];

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Background gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              //Color(0xffac255e),
              // Color(0xffca485c),
              // Color(0xffe16b5c),
              // Color(0xfff39060),
              // Color(0xffffb56b)
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            // Carousel area
            AspectRatio(
              aspectRatio: 9 / 16,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].imageUrl,
                ),
              ),
            ),
            // Indicator area
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Privacy policy area
            const Text("By proceeding you agree to our Privacy Policy",
                style: TextStyle(
                  fontFamily: "HappyMonkey",
                  color: Colors.white,
                  fontSize: 15,
                )),
            // White space
            const SizedBox(height: 16),
            PrimaryAppButton(
                onClick: () {},
                text: "Login",
                textStyle: const TextStyle(
                    fontFamily: "HappyMonkey",
                    color: Colors.white,
                    fontSize: 18)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: double.infinity, height: 40),
        const Spacer(),
        Image.asset(image,
            height: 450, width: double.infinity, fit: BoxFit.fitWidth),
        const Spacer(),
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? YColors.yPrimaryColor : Colors.white,
        border: isActive ? null : Border.all(color: YColors.yColorGray),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
