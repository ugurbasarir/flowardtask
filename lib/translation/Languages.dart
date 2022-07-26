import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_AR': {
      'welcome': 'أهلاً بك',
    },
    'en_US': {
      'welcome': 'Hello',
    },
  };
}