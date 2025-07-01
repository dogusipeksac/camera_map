import 'package:get/get.dart';
import 'en_US.dart';
import 'tr_TR.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'tr_TR': trTR
  };
}
