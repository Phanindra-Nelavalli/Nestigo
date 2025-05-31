// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/booking_model.dart';
import 'package:shimmer/shimmer.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;
  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: booking.property.imageUrl,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => _buildShimmerEffect(),
                    errorWidget: (context, url, error) => _buildErrorWidget(),
                  ),
                ),
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: _builsStatusChip(booking.status),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          booking.property.title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "\$${booking.property.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  _buildLoaction(booking.property.location),
                  SizedBox(height: 12.h),
                  _buildDateRange(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
      ),
    );
  }

  Widget _builsStatusChip(BookingStatus status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        status.name[0].toUpperCase() + status.name.substring(1),
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 32.sp),
          SizedBox(height: 6.h),
          Text(
            "Failed to load image",
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildLoaction(String location) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: 15.sp, color: AppColors.primary),
        SizedBox(width: 4.w),
        Text(
          location,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildDateRange() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: AppColors.primary,
            size: 16.sp,
          ),
          SizedBox(width: 6.w),
          Text(
            "${DateFormat('MMM dd').format(booking.checkIn)} - ${DateFormat('MMM dd').format(booking.checkOut)}",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
