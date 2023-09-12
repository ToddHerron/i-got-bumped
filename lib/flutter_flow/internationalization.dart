import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'es', 'de', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? esText = '',
    String? deText = '',
    String? zh_HansText = '',
  }) =>
      [enText, frText, esText, deText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '3sr87akm': {
      'en': 'I GOT BUMPED!!',
      'de': 'Ich bin erschüttert!!',
      'es': '¡¡ME GOLPEARON!!',
      'fr': 'Je me suis fait cogner !!',
      'zh_Hans': '我被撞了！',
    },
    'oh39qat8': {
      'en': 'What airline are you flying on?',
      'de': 'Mit welcher Fluggesellschaft fliegen Sie?',
      'es': '¿En qué aerolínea vuelas?',
      'fr': 'Sur quelle compagnie aérienne voyagez-vous ?',
      'zh_Hans': '您乘坐哪家航空公司的航班？',
    },
    'bwwthll8': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'zh_Hans': '搜索一个项目...',
    },
    'liax7mlq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Login
  {
    '9ix8gttg': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    '10gqsrpl': {
      'en': '',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    'dt0meu46': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'zh_Hans': '密码',
    },
    'yhr6u9hz': {
      'en': '',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    '5yfzscw1': {
      'en': 'Login',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hw69xdi6': {
      'en': 'No account?',
      'de': 'Kein Account?',
      'es': '¿Sin cuenta?',
      'fr': 'Pas de compte?',
      'zh_Hans': '没有账号？',
    },
    'c50t1jhc': {
      'en': '  Register',
      'de': 'Registrieren',
      'es': 'Registro',
      'fr': 'Registre',
      'zh_Hans': '登记',
    },
    'rfj7hl3b': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'zh_Hans': '继续使用谷歌',
    },
    '24h701j5': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'zh_Hans': '继续使用苹果',
    },
    'nlcidb07': {
      'en': 'Login',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    '34quj2kj': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Issue
  {
    'uznk3x6o': {
      'en': 'I was denied boarding',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'zh_Hans': '创建账户',
    },
    '8hlo756c': {
      'en': 'Travel Disruption',
      'de': 'Reiseunterbrechung',
      'es': 'Interrupción del viaje',
      'fr': 'Perturbation des voyages',
      'zh_Hans': '旅行中断',
    },
    'txqqzujo': {
      'en': 'Issue',
      'de': 'Ausgabe',
      'es': 'Asunto',
      'fr': 'Problème',
      'zh_Hans': '问题',
    },
  },
  // CreateAccount
  {
    '29fe5u4g': {
      'en': 'First name',
      'de': 'Bestätige das Passwort',
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'zh_Hans': '确认密码',
    },
    '10gqsrpl': {
      'en': '',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    '4hzzwggy': {
      'en': 'Email',
      'de': 'Bestätige das Passwort',
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'zh_Hans': '确认密码',
    },
    's5wpnnmx': {
      'en': '',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    'ixwmiiv2': {
      'en': 'Password',
      'de': 'Bestätige das Passwort',
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'zh_Hans': '确认密码',
    },
    'zxcurjek': {
      'en': '',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    'orbxj1ez': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'zh_Hans': '确认密码',
    },
    '9qa99585': {
      'en': '',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    'uznk3x6o': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'zh_Hans': '创建账户',
    },
    '8gopoz72': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'zh_Hans': '创建账户',
    },
    'tlbowfnu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Welcome
  {
    '6wph6omc': {
      'en': 'I GOT BUMPED!!',
      'de': 'Ich bin erschüttert!!',
      'es': '¡¡ME GOLPEARON!!',
      'fr': 'Je me suis fait cogner !!',
      'zh_Hans': '我被撞了！',
    },
    'l98we9dh': {
      'en': 'I\'m traveling now',
      'de': 'Ich reise jetzt',
      'es': 'estoy viajando ahora',
      'fr': 'je voyage maintenant',
      'zh_Hans': '我现在正在旅行',
    },
    '05vyc66c': {
      'en': 'I\'m planning a trip',
      'de': 'Ich plane eine Reise',
      'es': 'estoy planeando un viaje',
      'fr': 'je prévois un voyage',
      'zh_Hans': '我正在计划一次旅行',
    },
    'xl9ocwa6': {
      'en': 'Welcome',
      'de': 'Willkommen',
      'es': 'Bienvenido',
      'fr': 'Accueillir',
      'zh_Hans': '欢迎',
    },
    'vpthrtm7': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Account
  {
    'oilvmedi': {
      'en': 'Account',
      'de': 'Konto',
      'es': 'Cuenta',
      'fr': 'Compte',
      'zh_Hans': '帐户',
    },
    'z2ubhdhp': {
      'en': 'Account',
      'de': 'Konto',
      'es': 'Cuenta',
      'fr': 'Compte',
      'zh_Hans': '帐户',
    },
  },
  // PaxLegalRightsList
  {
    'jf20dj8h': {
      'en': 'English',
      'de': 'Englisch',
      'es': 'Inglés',
      'fr': 'Anglais',
      'zh_Hans': '英语',
    },
    'xf0wjr9s': {
      'en': 'French',
      'de': 'Französisch',
      'es': 'Francés',
      'fr': 'Français',
      'zh_Hans': '法语',
    },
    '4u7689zx': {
      'en': 'English',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'f0nm67bn': {
      'en': 'Passenger Legal Rights',
      'de': 'Gesetzliche Rechte von Passagieren',
      'es': 'Derechos legales de los pasajeros',
      'fr': 'Droits légaux des passagers',
      'zh_Hans': '旅客合法权益',
    },
    'scw6rzip': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // GetSameDayFlight
  {
    '0cc2ucu1': {
      'en': 'Flight Number',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9ix8gttg': {
      'en': 'Flight',
      'de': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    '10gqsrpl': {
      'en': 'AC106, WJA5678 ...',
      'de': 'Das ist ein Hinweis',
      'es': 'Esta es una pista',
      'fr': 'Ceci est un indice',
      'zh_Hans': '',
    },
    '1te99kaz': {
      'en': 'Today\'s Flight(s)',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'cmylcr5s': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // Airports
  {
    '3fypdw6b': {
      'en': 'Airports Delays',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'gr4l1z5q': {
      'en':
          'Airports currently experiencing airport-wide delays on all flights.',
      'de':
          'An Flughäfen kommt es derzeit auf allen Flügen zu flughafenweiten Verspätungen.',
      'es':
          'Los aeropuertos actualmente experimentan retrasos en todos los vuelos.',
      'fr':
          'Les aéroports connaissent actuellement des retards à l\'échelle de l\'aéroport sur tous les vols.',
      'zh_Hans': '目前，机场的所有航班均出现全机场延误。',
    },
    'txg20i09': {
      'en':
          'These airports are experiencing airport-wide delays affecting all flights.',
      'de':
          'An diesen Flughäfen kommt es zu flughafenweiten Verspätungen, die alle Flüge betreffen.',
      'es':
          'Estos aeropuertos están experimentando retrasos en todo el aeropuerto que afectan a todos los vuelos.',
      'fr':
          'Ces aéroports connaissent des retards à l’échelle aéroportuaire affectant tous les vols.',
      'zh_Hans': '这些机场正在经历机场范围内的延误，影响到所有航班。',
    },
    '7j4llnoy': {
      'en': 'Airportwide Delays',
      'de': 'Flughafenweite Verspätungen',
      'es': 'Retrasos en todo el aeropuerto',
      'fr': 'Retards à l’échelle de l’aéroport',
      'zh_Hans': '机场范围内的延误',
    },
    'd8htoz0e': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // AirportsDetails
  {
    'x3k017s7': {
      'en': ', ',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '30gh9xoa': {
      'en': ', ',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'wiasq862': {
      'en': 'Time Zone ',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1rnqsxiz': {
      'en': 'Longitude',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9phewkqe': {
      'en': 'Latitude',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'w9y9vd7e': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
  // DrawerMenu
  {
    'bu13z8np': {
      'en': 'Login',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'zh_Hans': '登录',
    },
    '63v60c45': {
      'en': 'Logout',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'zh_Hans': '登出',
    },
    'djturhhp': {
      'en': 'Language',
      'de': 'Sprache',
      'es': 'Idioma',
      'fr': 'Langue',
      'zh_Hans': '语言',
    },
    '77zv02i0': {
      'en': 'English',
      'de': 'Englisch',
      'es': 'Inglés',
      'fr': 'Anglais',
      'zh_Hans': '英语',
    },
    '9n0x9rqu': {
      'en': 'French',
      'de': 'Französisch',
      'es': 'Francés',
      'fr': 'Français',
      'zh_Hans': '法语',
    },
    'xa7bx3xp': {
      'en': 'Spanish',
      'de': 'Spanisch',
      'es': 'Español',
      'fr': 'Espagnol',
      'zh_Hans': '西班牙语',
    },
    'mjk7ryeh': {
      'en': 'German',
      'de': 'Deutsch',
      'es': 'Alemán',
      'fr': 'Allemand',
      'zh_Hans': '德语',
    },
    'b7zigtn6': {
      'en': 'Chinese ',
      'de': 'Chinesisch',
      'es': 'Chino',
      'fr': 'Chinois',
      'zh_Hans': '中国人',
    },
    '8ll0a10f': {
      'en': 'Choose a language...',
      'de': 'Wählen Sie eine Sprache...',
      'es': 'Elige un idioma...',
      'fr': 'Choisissez une langue...',
      'zh_Hans': '选择一种语言...',
    },
    '1edp1axm': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'zh_Hans': '搜索一个项目...',
    },
    'fo79ckpo': {
      'en': 'Passenger Legal Rights',
      'de': 'Gesetzliche Rechte von Passagieren',
      'es': 'Derechos legales de los pasajeros',
      'fr': 'Droits légaux des passagers',
      'zh_Hans': '旅客合法权益',
    },
    'zgznuexn': {
      'en': 'Airport Information',
      'de': 'Flughafeninformationen',
      'es': 'Información del aeropuerto',
      'fr': 'Informations sur l\'aéroport',
      'zh_Hans': '机场信息',
    },
  },
  // Miscellaneous
  {
    'fozybj7o': {
      'en': '[error]',
      'de': '[Fehler]',
      'es': '[error]',
      'fr': '[erreur]',
      'zh_Hans': '[错误]',
    },
    'nhxw1mmd': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lafl8k79': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'czl5obwu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '74a6xaj2': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rol01nb8': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hmsr5iis': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '647girkc': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'jt92n7ev': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xe90kraz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ces5ylq3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'vtyzc1j6': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'b794bmbh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zyj5pfp3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'r9s43clm': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ivkmexma': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dhxrgahq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rf51juhv': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'eb60wddm': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'rzhgb0f0': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'd84anly4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '4j10lkwb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '6hb8qp84': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
