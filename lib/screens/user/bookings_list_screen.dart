// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/common/widgets/page_layout.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/booking_model.dart';
import 'package:nestigo/widgets/booking_list.dart';

class BookingsListScreen extends StatefulWidget {
  const BookingsListScreen({super.key});

  @override
  State<BookingsListScreen> createState() => _BookingsListScreenState();
}

class _BookingsListScreenState extends State<BookingsListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<BookingStatus> _tabs = [
    BookingStatus.upcoming,
    BookingStatus.completed,
    BookingStatus.ongoing,
  ];
  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "My Bookings",
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: TabBar(
              controller: _tabController,
              tabs:
                  _tabs
                      .map(
                        (status) => Tab(
                          text:
                              status.name[0].toUpperCase() +
                              status.name.substring(1),
                        ),
                      )
                      .toList(),
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.textSecondary,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              padding: EdgeInsets.all(4.w),
              splashBorderRadius: BorderRadius.circular(30.r),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:
                  _tabs.map((status) => BookingList(status: status)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
