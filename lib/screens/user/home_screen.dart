import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/common/widgets/custom_text_field.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/core/constants/text_constants.dart';
import 'package:nestigo/widgets/banner_carousel.dart';
import 'package:nestigo/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.findYourHome,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: EdgeInsets.all(16.w),
                    //     decoration: BoxDecoration(
                    //       color: AppColors.surface,
                    //       borderRadius: BorderRadius.circular(16.r),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.search_rounded,
                    //           color: AppColors.textSecondary,
                    //         ),
                    //         SizedBox(width: 12.w),
                    //         Text(
                    //           AppTexts.searchHint,
                    //           style: TextStyle(
                    //             color: AppColors.textSecondary,
                    //             fontSize: 16.sp,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    CustomTextField(
                      label: AppTexts.searchHint,
                      prefixIcon: Icons.search_rounded,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: BannerCarousel(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
