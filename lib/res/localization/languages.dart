import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'email_hint': 'Enter Email',
      'internet_exception':
          "we're unable to show results\nPlease check your internet\nconnection",
      'general_exception':
          "we're unable to process your request\nPlease ty again",
      'Retry': "Retry",
      'Welcome': "WelCome\nBack",
      'Login': "Login",
    },
    'ur_PK': {'email_hint': 'آیمیل'},
  };
}
