import 'dart:convert';
import 'package:flutter/services.dart';

class SecretLoader {
  final String path;
  const SecretLoader({required this.path});
  Future<Map<String, dynamic>> load() {
    return rootBundle.loadStructuredData<Map<String, dynamic>>(
      path,
          (keys) async => json.decode(keys),
    );
  }
}
