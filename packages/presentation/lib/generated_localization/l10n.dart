// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

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

  /// `Star Movie`
  String get homeTitle {
    return Intl.message(
      'Star Movie',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Showtime`
  String get showtime {
    return Intl.message(
      'Showtime',
      name: 'showtime',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Synopsis`
  String get synopsis {
    return Intl.message(
      'Synopsis',
      name: 'synopsis',
      desc: '',
      args: [],
    );
  }

  /// `... Show more`
  String get showMore {
    return Intl.message(
      '... Show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get showLess {
    return Intl.message(
      'Show less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `Cast & Crew`
  String get castAndCrew {
    return Intl.message(
      'Cast & Crew',
      name: 'castAndCrew',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Check your Internet connection`
  String get checkYourInternet {
    return Intl.message(
      'Check your Internet connection',
      name: 'checkYourInternet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SM> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'be'),
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
