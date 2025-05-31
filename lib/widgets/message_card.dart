// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/message_model.dart';

class MessageCard extends StatelessWidget {
  final String userdId;
  final bool isLandlord;
  final MessageModel message;
  const MessageCard({
    super.key,
    required this.userdId,
    required this.isLandlord,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final otherPartyName =
        message.receiverId == userdId
            ? message.senderName
            : message.receiverName;
    final isUnread = !message.isSeen && message.receiverId == userdId;
    final duration = DateTime.now().difference(message.timeStamp);
    final timeStamp =
        duration.inHours < 24
            ? "${duration.inHours}h ago"
            : "${duration.inDays}d ago";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color:
              isUnread
                  ? AppColors.primary.withOpacity(0.3)
                  : Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor:
                    isUnread
                        ? AppColors.primary.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                child: Text(
                  otherPartyName[0].toUpperCase(),
                  style: TextStyle(
                    color: isUnread ? AppColors.primary : Colors.grey[700],
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          otherPartyName[0].toUpperCase() +
                              otherPartyName.substring(1),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                            fontWeight:
                                isUnread ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                        Text(
                          timeStamp,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            message.content,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  isUnread
                                      ? AppColors.textPrimary
                                      : AppColors.textSecondary,
                              fontWeight:
                                  isUnread ? FontWeight.w600 : FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isUnread)
                          Container(
                            margin: EdgeInsets.only(left: 8.w),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
