import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nestigo/core/common/widgets/custom_button.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/model/property_model.dart';
import 'package:nestigo/model/rating_model.dart';
import 'package:nestigo/widgets/review_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final PropertyModel property;
  const PropertyDetailsScreen({super.key, required this.property});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int currentImage = 0;
  bool isFavourite = false;
  bool isSaved = false;
  late final List<Map<String, dynamic>> info;
  late final LatLng _location = LatLng(
    widget.property.latitude,
    widget.property.longitude,
  );
  late final Iterable<RatingModel> ratings;

  // ignore: unused_field
  late GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    info = [
      {'icon': Icons.home_outlined, 'label': widget.property.type},
      {'icon': Icons.bed_outlined, 'label': '2 Beds'},
      {'icon': Icons.bathtub_outlined, 'label': '3 Baths'},
    ];
    ratings = RatingModel.dummyRatings.where(
      (rating) => rating.propertyId == widget.property.id,
    );
  }

  Future<void> _openGoogleMaps() async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${_location.latitude},${_location.longitude}',
    );
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open Google Maps')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageContainer(),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImagesListView(),
                  SizedBox(height: 10.h),
                  _buildHeading(),
                  SizedBox(height: 8.h),
                  _buildFacilities(),
                  SizedBox(height: 10.h),
                  _buildInfo(),
                  SizedBox(height: 10.h),
                  CustomButton(text: "Book Now", onPressed: () {}, height: 60),
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
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite ? Colors.red : Colors.black,
                        size: 21.sp,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface.withOpacity(0.5),
                      ),
                      onPressed: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                    ),
                    SizedBox(width: 5.w),
                    IconButton(
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color:
                            isSaved
                                ? AppColors.primary
                                : Colors.black,
                        size: 21.sp,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface.withOpacity(0.5),
                      ),
                      onPressed: () {
                        setState(() {
                          isSaved = !isSaved;
                        });
                      },
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
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
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

  Widget _buildFacilities() {
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

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          widget.property.description,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "Location",
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          height: 175.h,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _location,
              zoom: 15.0,
            ),
            onMapCreated: (controller) => _mapController = controller,
            markers: {
              Marker(
                markerId: MarkerId(widget.property.id),
                position: _location,
                infoWindow: InfoWindow(
                  title: widget.property.title,
                  snippet: widget.property.location,
                  onTap: _openGoogleMaps,
                ),
              ),
            },
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "Ratings & Reviews",
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Text(
              widget.property.averageRating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 38.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: widget.property.averageRating,
                  itemCount: 5,
                  itemSize: 14.sp,
                  direction: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Icon(Icons.star, color: Colors.amber),
                ),
                Text(
                  '${widget.property.numberOfRatings} reviews',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 6.h),
        ...List.generate(
          ratings.length,
          (index) => ReviewCard(rating: ratings.toList()[index]),
        ),
      ],
    );
  }
}
