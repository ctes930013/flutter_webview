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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Native App`
  String get second_page_title {
    return Intl.message(
      'Native App',
      name: 'second_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the value to be passed to the WebView`
  String get second_page_edit_hint {
    return Intl.message(
      'Please enter the value to be passed to the WebView',
      name: 'second_page_edit_hint',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get second_page_btn_text {
    return Intl.message(
      'Send',
      name: 'second_page_btn_text',
      desc: '',
      args: [],
    );
  }

  /// `Taichung`
  String get taichung_city {
    return Intl.message(
      'Taichung',
      name: 'taichung_city',
      desc: '',
      args: [],
    );
  }

  /// `Kaoshiung`
  String get kaoshiung_city {
    return Intl.message(
      'Kaoshiung',
      name: 'kaoshiung_city',
      desc: '',
      args: [],
    );
  }

  /// `Taoyuan`
  String get taoyuan_city {
    return Intl.message(
      'Taoyuan',
      name: 'taoyuan_city',
      desc: '',
      args: [],
    );
  }

  /// `Xinzhu`
  String get xinzhu_city {
    return Intl.message(
      'Xinzhu',
      name: 'xinzhu_city',
      desc: '',
      args: [],
    );
  }

  /// `Tiny Cup`
  String get tiny_cup {
    return Intl.message(
      'Tiny Cup',
      name: 'tiny_cup',
      desc: '',
      args: [],
    );
  }

  /// `A Cup`
  String get a_cup {
    return Intl.message(
      'A Cup',
      name: 'a_cup',
      desc: '',
      args: [],
    );
  }

  /// `Old Fellow`
  String get lao_wo {
    return Intl.message(
      'Old Fellow',
      name: 'lao_wo',
      desc: '',
      args: [],
    );
  }

  /// `Play Game`
  String get game_one_min_fast_three {
    return Intl.message(
      'Play Game',
      name: 'game_one_min_fast_three',
      desc: '',
      args: [],
    );
  }

  /// `do not leave any field blank`
  String get do_not_leave_blank {
    return Intl.message(
      'do not leave any field blank',
      name: 'do_not_leave_blank',
      desc: '',
      args: [],
    );
  }

  /// `the value passed from web side`
  String get value_from_web {
    return Intl.message(
      'the value passed from web side',
      name: 'value_from_web',
      desc: '',
      args: [],
    );
  }

  /// `The loading process is controlled by Provider`
  String get use_provider_control_load {
    return Intl.message(
      'The loading process is controlled by Provider',
      name: 'use_provider_control_load',
      desc: '',
      args: [],
    );
  }

  /// `recommendation`
  String get recommendation {
    return Intl.message(
      'recommendation',
      name: 'recommendation',
      desc: '',
      args: [],
    );
  }

  /// `new show`
  String get new_show {
    return Intl.message(
      'new show',
      name: 'new_show',
      desc: '',
      args: [],
    );
  }

  /// `pretty`
  String get pretty {
    return Intl.message(
      'pretty',
      name: 'pretty',
      desc: '',
      args: [],
    );
  }

  /// `new start`
  String get new_star {
    return Intl.message(
      'new start',
      name: 'new_star',
      desc: '',
      args: [],
    );
  }

  /// `dancint`
  String get dancing {
    return Intl.message(
      'dancint',
      name: 'dancing',
      desc: '',
      args: [],
    );
  }

  /// `friendship`
  String get friendship {
    return Intl.message(
      'friendship',
      name: 'friendship',
      desc: '',
      args: [],
    );
  }

  /// `music`
  String get music {
    return Intl.message(
      'music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `godness`
  String get godness {
    return Intl.message(
      'godness',
      name: 'godness',
      desc: '',
      args: [],
    );
  }

  /// `Tab C`
  String get tab_c {
    return Intl.message(
      'Tab C',
      name: 'tab_c',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Rank`
  String get rank {
    return Intl.message(
      'Rank',
      name: 'rank',
      desc: '',
      args: [],
    );
  }

  /// `Index`
  String get index {
    return Intl.message(
      'Index',
      name: 'index',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `testing platform testing platform testing platform testing platform`
  String get marquee_test {
    return Intl.message(
      'testing platform testing platform testing platform testing platform',
      name: 'marquee_test',
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
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
