import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/onboarding_content.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingContent content;
  const OnboardingPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Image.asset(content.image, height: 300.h, fit: BoxFit.contain),
            ],
          ),
        ),
      ),
    );
  }
}
