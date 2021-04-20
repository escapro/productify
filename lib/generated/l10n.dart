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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `MAIN`
  String get app_bar_title {
    return Intl.message(
      'MAIN',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `MAIN TITLE`
  String get main_title {
    return Intl.message(
      'MAIN TITLE',
      name: 'main_title',
      desc: '',
      args: [],
    );
  }

  /// `Today tasks`
  String get today_tasks {
    return Intl.message(
      'Today tasks',
      name: 'today_tasks',
      desc: '',
      args: [],
    );
  }

  /// `M`
  String get week1 {
    return Intl.message(
      'M',
      name: 'week1',
      desc: '',
      args: [],
    );
  }

  /// `T`
  String get week2 {
    return Intl.message(
      'T',
      name: 'week2',
      desc: '',
      args: [],
    );
  }

  /// `W`
  String get week3 {
    return Intl.message(
      'W',
      name: 'week3',
      desc: '',
      args: [],
    );
  }

  /// `T`
  String get week4 {
    return Intl.message(
      'T',
      name: 'week4',
      desc: '',
      args: [],
    );
  }

  /// `F`
  String get week5 {
    return Intl.message(
      'F',
      name: 'week5',
      desc: '',
      args: [],
    );
  }

  /// `S`
  String get week6 {
    return Intl.message(
      'S',
      name: 'week6',
      desc: '',
      args: [],
    );
  }

  /// `S`
  String get week7 {
    return Intl.message(
      'S',
      name: 'week7',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}