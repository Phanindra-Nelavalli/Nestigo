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
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Image.asset(content.image, height: 250.h, fit: BoxFit.contain),
              SizedBox(height: 60.h),
              Text(
                content.title,
                style: TextStyle(
                  color: AppColors.surface,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  content.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.surface.withOpacity(0.8),
                    height: 1.5,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
