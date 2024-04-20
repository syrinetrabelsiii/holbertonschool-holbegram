import 'package:flutter/material.dart';
import 'package:holbegram/models/user.dart';
import 'package:holbegram/methods/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? get user => _user;

  Future<void> refreshUser() async {
    try {
      User userDetails = await _authMethods.getUserDetails();
      _user = userDetails;
      notifyListeners();
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }
}
