import 'package:flutter/material.dart';
import 'package:nestigo/core/constants/app_images.dart';
import 'package:nestigo/model/onboarding_content.dart';
import 'package:nestigo/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  // ignore: unused_field
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      image: 'assets/images/onboarding/onboarding1.png',
      title: "Find Perfect Home",
      description:
          "Discover your perfect home from our vast collection of propeties",
    ),
    OnboardingContent(
      image: 'assets/images/onboarding/onboarding1.png',
      title: "Easy Booking",
      description: "Book your desired property with hust a few taps",
    ),
    OnboardingContent(
      image: 'assets/images/onboarding/onboarding1.png',
      title: "Move In Quickly",
      description: "Quick and hassle-free move-in process of your comfort",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _contents.length,
            onPageChanged: (value) {
              setState(() => _currentPage = value);
            },
            itemBuilder: (context, index) {
              return OnboardingPage(content: _contents[index]);
            },
          ),
        ],
      ),
    );
  }
}
