import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_stars/di/app_injector.dart';
import 'package:presentation/star_movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initAppInjector();
  runApp(const StarMovieApp());
}
