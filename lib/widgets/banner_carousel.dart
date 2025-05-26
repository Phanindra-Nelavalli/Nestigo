// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/banner_ad.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
              BannerAd.dummyBanners.map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: CachedNetworkImage(
                          imageUrl: banner.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _buildShimmerEffect(),
                          errorWidget:
                              (context, url, error) => Container(
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.error_outline,
                                  color: AppColors.error,
                                  size: 32.sp,
                                ),
                              ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
          options: CarouselOptions(
            height: 180.h,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged:
                (index, reason) => setState(() {
                  _currentIndex = index;
                }),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              BannerAd.dummyBanners.asMap().entries.map((entry) {
                return Container(
                  height: 8.h,
                  width: _currentIndex == entry.key ? 20.w : 8.w,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color:
                        _currentIndex == entry.key
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.2),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
