import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: AppColors.background,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: TextStyle(fontSize: 18.sp, color: AppColors.textSecondary),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: AppColors.primary, size: 20.sp),
              Text(
                "San Francisco, CA",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.keyboard_arrow_down, color: AppColors.textPrimary),
            ],
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.surface,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }
}
