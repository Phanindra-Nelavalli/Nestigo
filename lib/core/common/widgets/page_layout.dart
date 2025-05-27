import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  const PageLayout({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
          color: AppColors.textPrimary,
        ),
        actions: actions,
        backgroundColor: AppColors.background,
      ),
      body: body,
    );
  }
}
