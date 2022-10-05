import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  const Analytics(
    this.firebaseAnalytics,
  );

  final FirebaseAnalytics firebaseAnalytics;

  logOnGoogleAuthClick() =>
      firebaseAnalytics.logEvent(name: 'AuthWithGoogle clicked');

  logOnFacebookAuthClick() =>
      firebaseAnalytics.logEvent(name: 'AuthWithFacebook clicked');

  logWithEmailAndPassClick() =>
      firebaseAnalytics.logEvent(name: 'AuthEmailAndPassword clicked');
}
