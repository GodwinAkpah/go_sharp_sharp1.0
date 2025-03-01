// import 'package:flutter/material.dart';
// import 'package:invoyse/domain/models/authentication/login/login_user_response.dart';
// import 'package:invoyse/domain/models/business/get_business/get_all__business_response.dart'
//     as bizz;
// import 'package:invoyse/domain/models/client/create_client/create_client_request.dart';
// import 'package:invoyse/domain/models/expenses/create/create_expense_request.dart';
// import 'package:invoyse/domain/models/invoices/create/create_invoice_request.dart';
// import 'package:invoyse/domain/models/items/create_item/create_item_request.dart';
// import 'package:invoyse/domain/models/payment/payment_model.dart';
// import 'package:invoyse/domain/models/quotation/create/create_quotation_request.dart'
//     as quo;
// import 'package:invoyse/domain/models/signature/signature_model.dart';
// import 'package:invoyse/domain/models/tax/create_tax_model.dart';
// import 'package:invoyse/infrastructure/enums/subscription_enum.dart';
//
// abstract class CacheData {
//   Future<void> logOut();
//
//   Future<LoginUserResponse?> getAuthTokenResponse();
//   Future<void> cacheAuthTokenResponse(
//       {required LoginUserResponse accessTokenResponse});
//   Future<String> getToken();
//   Future<num?> readOnboardCount();
//   Future<void> saveOnboardCount({required num count});
//   Future<num?> readLoginCount();
//   Future<void> saveLoginCount({required num count});
//   Future<bool?> readBioDetails();
//   Future<void> saveBioDetails({required bool count});
//   Future<Map<String, dynamic>?> readBusinessId();
//   Future<void> saveBusinessId({required num count});
//   Future<Map<String, dynamic>?> readTempleteId();
//
//   Future<void> saveTempleteId({required num count});
//
//   Future<Map<String, dynamic>?> readTempletePrimaryColor();
//
//   Future<void> saveTempletePrimaryColor({required String count});
//   Future<Map<String, dynamic>?> readTempleteSecondaryColor();
//
//   Future<void> saveTempleteSecondaryColor({required String count});
//
//   Future<ThemeMode> cacheTheme({required ThemeMode themeMode});
//   Future<ThemeMode?> getCachedTheme();
//
//   Future saveUserDetails({required LoginUserResponse data});
//   Future<LoginUserResponse?> getUserDetails();
//   Future storeSignature({required List<CreateSignatureRequest> data});
//   Future<List<CreateSignatureRequest>?> getSignature();
//
//   Future<void> clearAll();
//    Future<void> saveSubscriptionDetails({
//     required SubscriptionTier tier,
//     required DateTime lastResetDate,
//   });
//
//   Future<Map<String, dynamic>> getSubscriptionDetails();
//
//   Future<void> saveMonthlyUsage(Map<String, int> usage);
//   Future<Map<String, int>> getMonthlyUsage();
//   Future<void> resetMonthlyUsage();
//   Future<void> resetIfNewMonth();
//   Future<void> readLastResetDate();
//   Future<void> saveLastResetDate(DateTime date);
// }
//
// abstract class TempCacheData {
//   Future saveBusinessDetails({required List<bizz.Result> data});
//   Future<List<bizz.Result>?> getBusiness();
//   Future storeClients({required List<CreateClientRequest> data});
//   Future<List<CreateClientRequest>?> getClients();
//   Future storeProducts({required List<CreateItemRequest> data});
//   Future<List<CreateItemRequest>?> getProducts();
//   Future storeSignature({required CreateSignatureRequest data});
//   Future<CreateSignatureRequest?> getSignature();
//   Future storeQuotations({required List<quo.CreateQuotationRequest> data});
//   Future<List<quo.CreateQuotationRequest>?> getQuotations();
//   Future storePaymentDetails({required List<CreatePaymentModel> data});
//   Future<List<CreatePaymentModel>?> getPaymentDetails();
//   Future storeTaxDetails({required CreateTaxModel data});
//   Future<CreateTaxModel?> getTaxDetails();
//   Future storeInvoices({required List<CreateInvoiceRequest> data});
//   Future<List<CreateInvoiceRequest>?> getInvoices();
//   Future storeExpense({required List<CreateExpenseRequest> data});
//   Future<List<CreateExpenseRequest>?> getExpenses();
// }
