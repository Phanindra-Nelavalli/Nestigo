import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/common/widgets/page_layout.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/property_model.dart';
import 'package:nestigo/widgets/property_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Favourites",
      body:
          PropertyModel.dummyProperties.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 64.sp,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "No favourites yet!",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Start saving your favourite properties",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              )
              : GridView.builder(
                padding: EdgeInsets.all(16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.64,
                ),
                itemCount: PropertyModel.dummyProperties.length,
                itemBuilder: (context, index) {
                  final property = PropertyModel.dummyProperties[index];
                  return PropertyCard(property: property, onTap: () {});
                },
              ),
    );
  }
}
