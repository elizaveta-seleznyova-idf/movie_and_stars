import 'package:flutter/material.dart';
import 'package:movies_and_stars/di/app_injector.dart';
import 'package:presentation/star_movie_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppInjector();
  runApp(const StarMovieApp());
}
