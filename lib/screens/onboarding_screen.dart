import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nestigo/core/constants/app_images.dart';
import 'package:nestigo/core/constants/color_constants.dart';
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
      image: AppImages.onboarding1,
      title: "Find Perfect Home",
      description:
          "Discover your perfect home from our vast collection of propeties",
    ),
    OnboardingContent(
      image: AppImages.onboarding2,
      title: "Easy Booking",
      description: "Book your desired property with hust a few taps",
    ),
    OnboardingContent(
      image: AppImages.onboarding1,
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
          Positioned(
            bottom: 60.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _contents.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 8.h,
                      width: _currentPage == index ? 24.w : 8.w,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index
                                ? AppColors.surface
                                : AppColors.surface.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(
                            _contents.length - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: AppColors.surface,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_currentPage == _contents.length - 1) {
                            context.go('/login');
                          } else {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          backgroundColor: AppColors.surface,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 17.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textStyle: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Text(
                          _currentPage == _contents.length - 1
                              ? "Get Started"
                              : "Next",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
