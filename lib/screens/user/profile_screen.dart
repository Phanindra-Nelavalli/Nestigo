import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  ProfileScreen({super.key, required this.user});

  final List<Map<String, dynamic>> accountItems = [
    {'icon': Icons.person_outline, 'label': 'Personal Information'},
    {'icon': Icons.payment, 'label': 'Payment Methods'},
    {'icon': Icons.notifications_none, 'label': 'Notifications'},
  ];

  final List<Map<String, dynamic>> supportItems = [
    {'icon': Icons.help_outline, 'label': 'Help Center'},
    {'icon': Icons.privacy_tip_outlined, 'label': 'Privacy Policy'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileWidget(),
            _buildSectionCard("Account", accountItems),
            _buildSectionCard("Support", supportItems),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      padding: EdgeInsets.only(top: 70.h, bottom: 35.h),
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 75.h,
            width: 75.w,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_circle_rounded,
              size: 70.sp,
              color: AppColors.primary.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            user.fullName,
            style: TextStyle(
              fontSize: 28.sp,
              color: AppColors.surface,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.surface,
              letterSpacing: 0.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    String sectionHeading,
    List<Map<String, dynamic>> items,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionHeading,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            children: List.generate(items.length, (index) {
              return _buildListTile(
                items[index]['icon'],
                items[index]['label'],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String label) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(icon, color: AppColors.primary, size: 28.sp),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18.sp,
        color: AppColors.textSecondary,
      ),
      onTap: () {},
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Handle logout logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            "Log Out",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
