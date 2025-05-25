import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nestigo/core/constants/app_constants.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/core/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    try {
      await Future.delayed(AppConstants.splashDuration);
      if (!mounted) return;
      final isFirstTime = await StorageService.isFirstTimeUser();
      if (!mounted) return;
      if (isFirstTime) {
        await StorageService.setFirstTimeUser(false);
        if (!mounted) return;
        if (context.mounted) {
          context.pushReplacement('/onboarding');
        }
      } else {
        if (context.mounted) {
          context.pushReplacement('/login');
        }
      }
    } catch (e) {
      print("NavigationDebug Error ${e}");
      if (mounted) {
        context.pushReplacement('/onboarding');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 1500),
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value,
                  child: Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.home_rounded,
                      color: AppColors.primary,
                      size: 72.w,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 21.h),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 1500),
              builder: (context, double value, child) {
                return Opacity(opacity: value, child: child);
              },
              child: Column(
                children: [
                  Text(
                    "Home Rental",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      letterSpacing: 0.8,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 1500),
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 3,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
