import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nestigo/core/common/widgets/custom_bottom_navigation.dart';

class MainLayout extends StatefulWidget {
  final String location;
  final Widget child;
  const MainLayout({super.key, required this.location, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = _getIndexFromLocation(widget.location);
  }

  @override
  void didUpdateWidget(MainLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      setState(() {
        _currentIndex = _getIndexFromLocation(widget.location);
      });
    }
  }

  int _getIndexFromLocation(String location) {
    if (location.startsWith("/favorites")) return 1;
    if (location.startsWith("/bookings")) return 2;
    if (location.startsWith("/chats")) return 3;
    if (location.startsWith("/profile")) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/favorites');
              break;
            case 2:
              context.go('/bookings');
              break;
            case 3:
              context.go('/chats');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }
}
