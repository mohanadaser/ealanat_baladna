// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          '👋مرحبا بك': 'Hello👋',
          'ادخل اسمك': 'Enter your name',
          'ادخل ايميلك': 'Enter your email',
          'تسجيل الدخول': 'Login',
          'ادخل كلمة المرور': 'Enter your password',
          'لديك حساب بالفعل؟': 'Already have an account?',
          '❤ مرحبا بعودتك': 'Welcome back ❤',
          'تذكرني': 'Remember me',
          'register': 'Register',
          'ليس لديك حساب؟': 'Don\'t have an account?',
          'تسجيل الحساب': 'Sign up',
          'عروض بلدنا': 'Luxor Offers',
          'tic tac toe لعبة ': 'Tic Tac Toe Game',
          'مصروفاتى': 'My expenses',
          'تواصل معنا': 'Contact us',
          'تطبيق الاقصر جوو يرحب بأعلاناتكم \n يمكنك وضع اعلان لشركتك \nاو مطعمك او عيادتك\n او اى نشاط لك':
              'Luxor Go application welcomes your advertisements\n You can place an advertisement.\n for your company and restaurant, clinic\n or any activity of yours',
        },
      };
}
