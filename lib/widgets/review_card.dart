import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/rating_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewCard extends StatelessWidget {
  final RatingModel rating;
  const ReviewCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rating.userName,
                style: TextStyle(
                  fontSize: 19.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 14.sp),
                  SizedBox(width: 5.w),
                  Text(
                    rating.rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            rating.comment,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            timeago.format(rating.timeStamp).toString(),
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
