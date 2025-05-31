import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nestigo/core/common/widgets/page_layout.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/message_model.dart';
import 'package:nestigo/widgets/message_card.dart';

class ChatScreen extends StatelessWidget {
  final bool isLandlord;
  final String userId;
  const ChatScreen({super.key, required this.isLandlord, required this.userId});

  @override
  Widget build(BuildContext context) {
    final userMessages =
        MessageModel.dummyMessages
            .where((msg) => msg.senderId == userId || msg.receiverId == userId)
            .toList();
    return PageLayout(
      title: "Chats",
      body:
          userMessages.isEmpty
              ? _buildEmptyState(context)
              : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      child: Text(
                        "Recent Messages",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: userMessages.length,
                      (context, index) {
                        final message = userMessages[index];
                        return MessageCard(
                          message: message,
                          isLandlord: isLandlord,
                          userdId: userId,
                        );
                      },
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(32.w),
        margin: EdgeInsets.all(24.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.08),
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: AppColors.primary,
                size: 48.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "No messages yet",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            if (!isLandlord) ...[
              SizedBox(height: 8.h),
              Text(
                "Start messaging with property owners",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 10.h),
              TextButton.icon(
                onPressed: () => context.go('/home'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  foregroundColor: AppColors.primary,
                ),
                label: Text(
                  "Browse Properties",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
