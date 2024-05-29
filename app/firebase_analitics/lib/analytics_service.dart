// import 'package:firebase_analytics/firebase_analytics.dart';

// // Analytics service class for logging various events
// class AnalyticsService {
//   // Firebase Analytics instance
//   final firebaseAnalyticsInstance = FirebaseAnalytics.instance;

//   // Factory constructor for singleton pattern
//   factory AnalyticsService() => _singleton;
//   AnalyticsService._();
//   static final _singleton = AnalyticsService._();

//   // Log the beginning of a checkout process
//   Future<void> logBeginCheckout() async {
//     await firebaseAnalyticsInstance.logBeginCheckout();
//   }

//   // Log an ad impression event
//   Future<void> logAdImpression() async {
//     await firebaseAnalyticsInstance.logAdImpression();
//   }

//   // Log when a user earns virtual currency
//   Future<void> logEarnVirtualCurrency({required String virtualCurrencyName, required int value}) async {
//     await firebaseAnalyticsInstance.logEarnVirtualCurrency(
//       virtualCurrencyName: virtualCurrencyName,
//       value: value,
//     );
//   }

//   // Log when a user generates a lead
//   Future<void> logGenerateLead() async {
//     await firebaseAnalyticsInstance.logGenerateLead();
//   }

//   // Log when a user joins a group
//   Future<void> logJoinGroup({required String groupId}) async {
//     await firebaseAnalyticsInstance.logJoinGroup(groupId: groupId);
//   }

//   // Log a user login event
//   Future<void> logLogin() async {
//     await firebaseAnalyticsInstance.logLogin();
//   }

//   // Log a purchase event with value and currency
//   Future<void> logPurchase({required double value, required String currency}) async {
//     await firebaseAnalyticsInstance.logPurchase(
//       value: value,
//       currency: currency,
//     );
//   }

//   // Log a refund event
//   Future<void> logRefund({required String transactionId, required double value, required String currency}) async {
//     await firebaseAnalyticsInstance.logRefund(
//       transactionId: transactionId,
//       value: value,
//       currency: currency,
//     );
//   }

//   // Log a search event with the search term used
//   Future<void> logSearch({required String searchTerm}) async {
//     await firebaseAnalyticsInstance.logSearch(searchTerm: searchTerm);
//   }

//   // Log when a user selects content
//   Future<void> logSelectContent({required String contentType, required String itemId}) async {
//     await firebaseAnalyticsInstance.logSelectContent(
//       contentType: contentType,
//       itemId: itemId,
//     );
//   }

//   // Log a share event with content type, item ID, and method used
//   Future<void> logShare({required String contentType, required String itemId, required String method}) async {
//     await firebaseAnalyticsInstance.logShare(
//       contentType: contentType,
//       itemId: itemId,
//       method: method,
//     );
//   }

//   // Log a user signup event
//   Future<void> logSignUp() async {
//     await firebaseAnalyticsInstance.logSignUp(signUpMethod: 'email');
//   }

//   // Log when a user spends virtual currency
//   Future<void> logSpendVirtualCurrency({required String itemName, required int value}) async {
//     await firebaseAnalyticsInstance.logSpendVirtualCurrency(
//       itemName: itemName,
//       value: value,
//     );
//   }

//   // Log when a user begins a tutorial
//   Future<void> logTutorialBegin() async {
//     await firebaseAnalyticsInstance.logTutorialBegin();
//   }

//   // Log when a user completes a tutorial
//   Future<void> logTutorialComplete() async {
//     await firebaseAnalyticsInstance.logTutorialComplete();
//   }

//   // Set the current screen name for analytics tracking
//   Future<void> setCurrentScreen(AnalyticsServiceScreenName screenName) async {
//     await firebaseAnalyticsInstance.setCurrentScreen(screenName: screenName.ja);
//   }
// }
