

import 'package:flutter/material.dart';

class UserDetails {
  static String apiToken = '';
  static String userId = '';
  static String userEmail = '';
  static String userName = '';
  static String userMobile = '';
  static String userRole = '';
  static String userStoreId='';
  static String userEmpId='';
  static String userImageUrl = '';
  static ValueNotifier userImageUrlValueNotifier = ValueNotifier("");

  static void set(
      String token,
      String id,
      String name,
      String email,
      String mobile,
      String role,
      String storeId,
      String empId,
      String imageUrl) {
    apiToken = token;
    userId = id;
    userName = name;
    userEmail = email;
    userMobile = mobile;
    userRole = role;
    userStoreId = storeId;
    userEmpId = empId;
    userImageUrl = imageUrl;
  }
}
