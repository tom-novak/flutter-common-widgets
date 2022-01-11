


import 'common_localizations.dart';

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get title => 'Ahoj světe!';

  @override
  String get somethingWrong => 'Něco se pokazilo';

  @override
  String get requiredField => 'Povinný údaj';

  @override
  String get appTitle => 'Ukázka';

  @override
  String get dashboard => 'Přehled';

  @override
  String get list => 'Seznam';

  @override
  String get cards => 'Karty';

  @override
  String get detail => 'Detail';

  @override
  String get next => 'Další';

  @override
  String get about => 'O plikaci';

  @override
  String get profile => 'Profil';

  @override
  String get login => 'Jméno';

  @override
  String get loginHint => 'Zadejte jméno';

  @override
  String get password => 'Heslo';

  @override
  String get passwordHint => 'Zadejte heslo';

  @override
  String get submit => 'Potvrdit';

  @override
  String get search => 'Hledat';

  @override
  String get error => 'Chyba';

  @override
  String get token => 'Token';

  @override
  String get google => 'Google';

  @override
  String get loremIpsumLong => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt sem sed arcu. Duis pulvinar. In dapibus augue non sapien. Nunc tincidunt ante vitae massa. Phasellus et lorem id felis nonummy placerat. Duis ante orci, molestie vitae vehicula venenatis, tincidunt ac pede.';

  @override
  String get loadNewData => 'Načti nová data';

  @override
  String get itemDetail => 'Detail položky';

  @override
  String get loremIpsumShort => 'Lorem ipsum dolor sit amet';

  @override
  String get signIn => 'Přihlášení';

  @override
  String sectionNumber(int index) {
    return 'Sekce $index';
  }

  @override
  String sectionIndexContent(int index) {
    return 'Obsah $index. sekce';
  }

  @override
  String itemIndex(int index) {
    return 'Položka $index';
  }

  @override
  String get startScreenSignIn => 'Přihlášení po startu';

  @override
  String get logout => 'Odhlásit';

  @override
  String get logoutProgress => 'Odhlašování';
}
