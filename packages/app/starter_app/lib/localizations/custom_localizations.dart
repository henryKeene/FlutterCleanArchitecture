import 'package:flutter/widgets.dart';
import 'package:starter_app/localizations/message.i69n.dart';

const _supportedLocales = [
  'en',
];

class CustomLocalizations {
  const CustomLocalizations(this.translations);

  final Message translations;

  static final _translations = <String, Message Function()>{
    'en': () => const Message(),
  };

  static const LocalizationsDelegate<CustomLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final List<Locale> supportedLocales =
      _supportedLocales.map(Locale.new).toList();

  static Future<CustomLocalizations> load(Locale locale) =>
      Future.value(CustomLocalizations(_translations[locale.languageCode]!()));

  static Message of(BuildContext context) =>
      Localizations.of<CustomLocalizations>(context, CustomLocalizations)!
          .translations;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      _supportedLocales.contains(locale.languageCode);

  @override
  Future<CustomLocalizations> load(Locale locale) =>
      CustomLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<CustomLocalizations> old) => false;
}

extension CustomLocalizationsX on BuildContext {
  Message get translations => CustomLocalizations.of(this);
}
