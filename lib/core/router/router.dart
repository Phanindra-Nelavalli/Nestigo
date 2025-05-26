import 'package:go_router/go_router.dart';
import 'package:nestigo/landlord_layout.dart';
import 'package:nestigo/main_layout.dart';
import 'package:nestigo/screens/chat_screen.dart';
import 'package:nestigo/screens/forgot_password_screen.dart';
import 'package:nestigo/screens/landlord/landlord_bookings_screen.dart';
import 'package:nestigo/screens/landlord/landlord_profile_screen.dart';
import 'package:nestigo/screens/landlord/landlord_properties_screen.dart';
import 'package:nestigo/screens/register_screen.dart';
import 'package:nestigo/screens/user/bookings_list_screen.dart';
import 'package:nestigo/screens/user/favorites_screen.dart';
import 'package:nestigo/screens/user/home_screen.dart';
import 'package:nestigo/screens/landlord/landlord_dashboard_screen.dart';
import 'package:nestigo/screens/login_screen.dart';
import 'package:nestigo/screens/onboarding_screen.dart';
import 'package:nestigo/screens/splash_screen.dart';
import 'package:nestigo/screens/user/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/forgotPassword',
      name: 'forgotPassword',
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    ShellRoute(
      builder:
          (context, state, child) =>
              MainLayout(location: state.uri.toString(), child: child),
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => FavoritesScreen(),
        ),
        GoRoute(
          path: '/bookings',
          builder: (context, state) => BookingsListScreen(),
        ),
        GoRoute(path: '/chats', builder: (context, state) => ChatScreen()),
        GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      ],
    ),
    ShellRoute(
      builder:
          (context, state, child) =>
              LandlordLayout(location: state.uri.toString(), child: child),
      routes: [
        GoRoute(
          path: '/landlord/dashboard',
          builder: (context, state) => LandlordDashboardScreen(),
        ),
        GoRoute(
          path: '/landlord/properties',
          builder: (context, state) => LandlordPropertiesScreen(),
        ),
        GoRoute(
          path: '/landlord/bookings',
          builder: (context, state) => LandlordBookingsScreen(),
        ),
        GoRoute(
          path: '/landlord/chats',
          builder: (context, state) => ChatScreen(),
        ),
        GoRoute(
          path: '/landlord/profile',
          builder: (context, state) => LandlordProfileScreen(),
        ),
      ],
    ),
  ],
);
