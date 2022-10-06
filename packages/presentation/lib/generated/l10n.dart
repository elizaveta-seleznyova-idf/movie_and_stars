// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated_localization/intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SM {
  SM();

  static SM? _current;

  static SM get current {
    assert(_current != null,
        'No instance of SM was loaded. Try to initialize the SM delegate before accessing SM.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SM> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SM();
      SM._current = instance;

      return instance;
    });
  }

  static SM of(BuildContext context) {
    final instance = SM.maybeOf(context);
    assert(instance != null,
        'No instance of SM present in the widget tree. Did you add SM.delegate in localizationsDelegates?');
    return instance!;
  }

  static SM? maybeOf(BuildContext context) {
    return Localizations.of<SM>(context, SM);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SM> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SM> load(Locale locale) => SM.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
