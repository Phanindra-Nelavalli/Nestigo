import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/property_model.dart';
import 'package:shimmer/shimmer.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final PropertyModel property;
  const PropertyDetailsScreen({super.key, required this.property});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int currentImage = 0;
  late final List<Map<String, dynamic>> info;

  @override
  void initState() {
    super.initState();
    info = [
      {'icon': Icons.home_outlined, 'label': widget.property.type},
      {'icon': Icons.bed_outlined, 'label': '2 Beds'},
      {'icon': Icons.bathtub_outlined, 'label': '3 Baths'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildImageContainer(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _buildImagesListView(),
                  SizedBox(height: 10.h),
                  _buildHeading(),
                  SizedBox(height: 8.h),
                  _buildInfo(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          child: CachedNetworkImage(
            imageUrl: widget.property.images[currentImage],
            height: 250.h,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => _buildShimmerEffect(),
            errorWidget:
                (context, url, error) => Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                  ),
                  child: Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 32.sp,
                  ),
                ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(top: 25.h, left: 15.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surface.withOpacity(0.5),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 21.sp,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 21.sp,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface.withOpacity(0.5),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 5.w),
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.black,
                        size: 21.sp,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface.withOpacity(0.5),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagesListView() {
    return Container(
      height: 110.h,
      margin: EdgeInsets.only(top: 10.h),

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.property.images.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final image = widget.property.images[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                currentImage = index;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        color: Colors.white,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      width: 100.w,
                      height: 100.h,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 24.sp,
                      ),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.property.title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6.h),
              Text(
                widget.property.location,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            "\$${widget.property.price}/mo",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        info.length,
        (index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(info[index]['icon'], color: AppColors.primary, size: 18.sp),
              SizedBox(width: 6.w),
              Text(
                info[index]['label'],
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
