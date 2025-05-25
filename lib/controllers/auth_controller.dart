import 'package:flutter/material.dart';
import 'package:nestigo/model/user_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<UserModel?> loginWithRole(
    String email,
    String password,
    UserRole expectedRole,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 2));
      _currentUser = UserModel.dummyUsers.firstWhere(
        (user) => user.email == email && user.role == expectedRole,
        orElse: () => throw Exception("Invalid Credentials or Role"),
      );
      return _currentUser;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserModel?> register({
    required String fullName,
    required String email,
    required String password,
    required UserRole role,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 2));
      _currentUser = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fullName: fullName,
        email: email,
        role: role,
      );
      return _currentUser;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      _currentUser = null;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String getInitialRoute() {
    if (_currentUser == null) return '/login';
    return (_currentUser!.role == UserRole.landlord)
        ? "/landlord/dashboard"
        : "/home";
  }
}
