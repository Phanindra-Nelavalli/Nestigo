import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/common/widgets/custom_text_field.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/core/constants/text_constants.dart';
import 'package:nestigo/model/property_model.dart';
import 'package:nestigo/widgets/banner_carousel.dart';
import 'package:nestigo/widgets/home_app_bar.dart';
import 'package:nestigo/widgets/property_card.dart';
import 'package:nestigo/widgets/section_title.dart';

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
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top:16.h,right: 16.w,left: 16.w),
                child: SectionTitle(
                  title: "Popular Properties",
                  actionText: "see more",
                  onActionPressed: () {},
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: PropertyModel.dummyProperties.length,
                  (context, index) {
                    final property = PropertyModel.dummyProperties[index];
                    return PropertyCard(property: property, onTap: () {});
                  },
                ),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.64,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
