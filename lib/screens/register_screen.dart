import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nestigo/controllers/auth_controller.dart';
import 'package:nestigo/core/common/widgets/custom_button.dart';
import 'package:nestigo/core/common/widgets/custom_text_field.dart';
import 'package:nestigo/core/constants/color_constants.dart';
import 'package:nestigo/core/constants/text_constants.dart';
import 'package:nestigo/model/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthController _authController = AuthController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  UserRole _selectedRole = UserRole.tenant;

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      if (_confirmPasswordController.text != _passwordController.text) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Passwords does not match")));
        return;
      }
      setState(() {
        _isLoading = true;
      });
      try {
        final user = _authController.register(
          fullName: _fullNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          role: _selectedRole,
        );

        // ignore: unnecessary_null_comparison
        if (mounted && user != null) {
          context.go(
            _selectedRole == UserRole.landlord
                ? '/landlord/dashboard'
                : '/home',
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surface,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    iconSize: 36.sp,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppTexts.createAccount,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                      color: AppColors.textPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Fill in your details to get started",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildTabRole("Tenant", UserRole.tenant),
                        ),
                        Expanded(
                          child: _buildTabRole("Landlord", UserRole.landlord),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _fullNameController,
                    label: "Full Name",
                    prefixIcon: (Icons.person_2_outlined),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Email",
                    prefixIcon: Icons.email_outlined,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Password",
                    prefixIcon: Icons.lock_outline_rounded,
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Password",
                    prefixIcon: Icons.lock_outline_rounded,
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 56.h,
                    width: double.infinity,
                    child: CustomButton(
                      text: "Create Account",
                      onPressed: _handleRegister,
                      isLoading: _isLoading,
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/login'),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabRole(String label, UserRole role) {
    final isSelected = _selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
