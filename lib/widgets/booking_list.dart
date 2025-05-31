import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/booking_model.dart';
import 'package:nestigo/widgets/booking_card.dart';

class BookingList extends StatelessWidget {
  final BookingStatus status;
  const BookingList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bookings =
        BookingModel.dummyBookings
            .where((booking) => booking.status == status)
            .toList();
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 64.sp,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 8.h),
            Text(
              "No ${status.name} bookings",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return BookingCard(booking: booking);
      },
    );
  }
}
