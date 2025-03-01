// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:invoyse/domain/models/authentication/login/login_user_response.dart';
// import 'package:invoyse/domain/models/signature/signature_model.dart';
//
// import 'package:invoyse/domain/storage/cached_data.dart';
// import 'package:invoyse/infrastructure/enums/subscription_enum.dart';
//
// class CacheDataImpl implements CacheData {
//   @override
//   Future<void> logOut() async {
//     final settingsBox = await Hive.openBox('settings');
//     await settingsBox.clear();
//   }
//
//   @override
//   Future<ThemeMode> cacheTheme({required ThemeMode themeMode}) async {
//     final settingsBox = await Hive.openBox('settings');
//     await settingsBox.put("THEME_MODE", themeMode.toString());
//     return themeMode;
//   }
//
//   @override
//   Future<ThemeMode?> getCachedTheme() async {
//     try {
//       final settingsBox = await Hive.openBox('settings');
//       final data = settingsBox.get(
//         "THEME_MODE",
//       );
//       if (data != null) {
//         debugPrint('data $data');
//         return data == 'ThemeMode.dark'
//             ? ThemeMode.dark
//             : data == 'ThemeMode.light'
//                 ? ThemeMode.light
//                 : ThemeMode.system;
//       } else {
//         debugPrint('no data');
//         return null;
//       }
//     } catch (e, s) {
//       debugPrint("Error:$e");
//       debugPrint("StackTrace:$s");
//     }
//     return null;
//   }
//
//   @override
//   Future<LoginUserResponse?> getAuthTokenResponse() async {
//     final userResponsesBox = await Hive.openBox('user_responses');
//     final String? jsonData = userResponsesBox.get("CACHE_TOKEN");
//     if (jsonData != null) {
//       return LoginUserResponse.fromJson(jsonDecode(jsonData));
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future<void> cacheAuthTokenResponse(
//       {required LoginUserResponse accessTokenResponse}) async {
//     final userResponsesBox = await Hive.openBox('user_responses');
//     await userResponsesBox.put(
//         "CACHE_TOKEN", jsonEncode(accessTokenResponse.toJson()));
//   }
//
//   @override
//   Future<String> getToken() async {
//     final userResponsesBox = await Hive.openBox('user_responses');
//     final String? jsonData = userResponsesBox.get("CACHE_TOKEN");
//     if (jsonData != null) {
//       return LoginUserResponse.fromJson(jsonDecode(jsonData))
//           .tokens!
//           .access!
//           .token!;
//     } else {
//       return '';
//     }
//   }
//
//   @override
//   Future<num?> readOnboardCount() async {
//     final settingsBox = await Hive.openBox('settings');
//     String? data = settingsBox.get("ONBOARD_COUNT");
//     if (data != null) {
//       return num.tryParse(data);
//     } else {
//       return 0;
//     }
//   }
//
//   @override
//   Future<void> saveOnboardCount({required num count}) async {
//     final settingsBox = await Hive.openBox('settings');
//     settingsBox.put("ONBOARD_COUNT", '$count');
//   }
//
//   @override
//   Future<Map<String, dynamic>> readBusinessId() async {
//     final businessIdBox = await Hive.openBox('businessId');
//     var data = businessIdBox.get("BUSINESS_ID");
//     if (data != null && data is Map<dynamic, dynamic>) {
//       return Map<String, dynamic>.from(data);
//     } else {
//       return {
//         'businessId': '0',
//       };
//     }
//   }
//
//   @override
//   Future<void> saveBusinessId({required num count}) async {
//     final businessIdBox = await Hive.openBox('businessId');
//     businessIdBox.put("BUSINESS_ID", {'businessId': '$count'});
//   }
//
//   @override
//   Future<Map<String, dynamic>> readTempletePrimaryColor() async {
//     final businessIdBox = await Hive.openBox('primaryColor');
//     var data = businessIdBox.get("PRIMARY_COLOR");
//     if (data != null && data is Map<dynamic, dynamic>) {
//       return Map<String, dynamic>.from(data);
//     } else {
//       return {
//         'primaryColor': '#D9D9D9',
//       };
//     }
//   }
//
//   @override
//   Future<void> saveTempletePrimaryColor({required String count}) async {
//     final businessIdBox = await Hive.openBox('primaryColor');
//     businessIdBox.put("PRIMARY_COLOR", {'primaryColor': count});
//   }
//
//   @override
//   Future<Map<String, dynamic>> readTempleteSecondaryColor() async {
//     final businessIdBox = await Hive.openBox('secondaryColor');
//     var data = businessIdBox.get("SECONDARY_COLOR");
//     if (data != null && data is Map<dynamic, dynamic>) {
//       return Map<String, dynamic>.from(data);
//     } else {
//       return {
//         'secondaryColor': '#121212',
//       };
//     }
//   }
//
//   @override
//   Future<void> saveTempleteSecondaryColor({required String count}) async {
//     final businessIdBox = await Hive.openBox('secondaryColor');
//     businessIdBox.put("SECONDARY_COLOR", {'secondaryColor': count});
//   }
//
//   @override
//   Future<Map<String, dynamic>> readTempleteId() async {
//     final businessIdBox = await Hive.openBox('templeteId');
//     var data = businessIdBox.get("TEMPLETE_ID");
//     if (data != null && data is Map<dynamic, dynamic>) {
//       return Map<String, dynamic>.from(data);
//     } else {
//       return {
//         'templeteId': '0',
//       };
//     }
//   }
//
//   @override
//   Future<void> saveTempleteId({required num count}) async {
//     final businessIdBox = await Hive.openBox('templeteId');
//     businessIdBox.put("TEMPLETE_ID", {'templeteId': '$count'});
//   }
//
//   @override
//   Future saveUserDetails({required LoginUserResponse data}) async {
//     final userDetailsBox = await Hive.openBox('user_details');
//     await userDetailsBox.put('USERS', jsonEncode(data.toJson()));
//   }
//
//   @override
//   Future<LoginUserResponse?> getUserDetails() async {
//     final userDetailsBox = await Hive.openBox('user_details');
//     final String? jsonData = userDetailsBox.get('USERS');
//     if (jsonData != null) {
//       return LoginUserResponse.fromJson(jsonDecode(jsonData));
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future<List<CreateSignatureRequest>?> getSignature() async {
//     final signatureData = await Hive.openBox('signature_details');
//     final String? jsonData = signatureData.get('SIGNATURE');
//
//     if (jsonData != null) {
//       final List<dynamic> jsonList = jsonDecode(jsonData);
//       return jsonList.map((e) => CreateSignatureRequest.fromJson(e)).toList();
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future storeSignature({required List<CreateSignatureRequest> data}) async {
//     final signatureData = await Hive.openBox('signature_details');
//     await signatureData.put(
//         'SIGNATURE', jsonEncode(data.map((e) => e.toJson()).toList()));
//   }
//
//   @override
//   Future<num?> readLoginCount() async {
//     final settingsBox = await Hive.openBox('settings');
//     String? data = settingsBox.get("LOGIN_COUNT");
//     if (data != null) {
//       return num.tryParse(data);
//     } else {
//       return 0;
//     }
//   }
//
//   @override
//   Future<void> saveLoginCount({required num count}) async {
//     final settingsBox = await Hive.openBox('settings');
//     settingsBox.put("LOGIN_COUNT", '$count');
//   }
//
//   @override
//   Future<bool?> readBioDetails() async {
//     final settingsBox = await Hive.openBox('settings');
//     String? data = settingsBox.get("BIO_DETAILS");
//     if (data != null) {
//       return bool.tryParse(data);
//     } else {
//       return false;
//     }
//   }
//
//   @override
//   Future<void> saveBioDetails({required bool count}) async {
//     final settingsBox = await Hive.openBox('settings');
//     settingsBox.put("BIO_DETAILS", '$count');
//   }
//
//   @override
//   Future<void> clearAll() async {
//     await Hive.deleteFromDisk();
//   }
//
//   @override
//   Future<void> saveSubscriptionDetails({
//     required SubscriptionTier tier,
//     required DateTime lastResetDate,
//   }) async {
//     final subscriptionBox = await Hive.openBox("SUBSCRIPTION_BOX");
//     await subscriptionBox.put('TIER', tier.toString());
//     await subscriptionBox.put(
//         "LAST_RESET_DATE_KEY", lastResetDate.toIso8601String());
//   }
//
//   /// Retrieve subscription details
//   @override
//   Future<Map<String, dynamic>> getSubscriptionDetails() async {
//     final subscriptionBox = await Hive.openBox("SUBSCRIPTION_BOX");
//     final tier =
//         subscriptionBox.get('TIER') ?? SubscriptionTier.free.toString();
//     final lastResetDate = subscriptionBox.get("LAST_RESET_DATE_KEY");
//
//     return {
//       'tier': SubscriptionTier.values.firstWhere((e) => e.toString() == tier),
//       'lastResetDate':
//           lastResetDate != null ? DateTime.parse(lastResetDate) : null,
//     };
//   }
//
//   @override
//   Future<void> saveMonthlyUsage(Map<String, int> usage) async {
//     final subscriptionBox = await Hive.openBox("SUBSCRIPTION_BOX");
//     await subscriptionBox.put("MONTHLY_USAGE_KEY", usage);
//   }
//
//   /// Retrieve monthly usage data
//   @override
//   Future<Map<String, int>> getMonthlyUsage() async {
//     final subscriptionBox = await Hive.openBox("SUBSCRIPTION_BOX");
//     final usage = subscriptionBox.get("MONTHLY_USAGE_KEY");
//     return usage != null ? Map<String, int>.from(usage) : {};
//   }
//
//   /// Reset monthly usage
//   @override
//   Future<void> resetMonthlyUsage() async {
//     await saveMonthlyUsage({
//       'invoices': 0,
//       'expenses': 0,
//       'suppliers': 0,
//       'items': 0,
//       'clients': 0,
//     });
//     await saveSubscriptionDetails(
//       tier: (await getSubscriptionDetails())['tier'],
//       lastResetDate: DateTime.now(),
//     );
//   }
//
//   /// Check and reset usage if a new month starts
//   @override
//   Future<void> resetIfNewMonth() async {
//     final subscriptionDetails = await getSubscriptionDetails();
//     final lastResetDate = subscriptionDetails['lastResetDate'] as DateTime?;
//     final currentMonth = DateTime.now().month;
//
//     if (lastResetDate == null || lastResetDate.month != currentMonth) {
//       await resetMonthlyUsage();
//     }
//   }
//
//   /// Reads the last reset date from Hive
//   @override
//   Future<DateTime?> readLastResetDate() async {
//     final box = await Hive.openBox("SUBSCRIPTION_BOX");
//     final timestamp = box.get("lastResetDate") as int?;
//     if (timestamp == null) return null;
//     return DateTime.fromMillisecondsSinceEpoch(timestamp);
//   }
//
//   /// Saves the last reset date to Hive
//   @override
//   Future<void> saveLastResetDate(DateTime date) async {
//     final box = await Hive.openBox("SUBSCRIPTION_BOX");
//     await box.put("lastResetDate", date.millisecondsSinceEpoch);
//   }
// }
