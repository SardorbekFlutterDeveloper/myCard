



import 'package:my_card/ui/pages/add_card.dart';

import '../ui/files_import/files_import.dart';

class MyRouter {
  static final MyRouter _instance = MyRouter._init();
  static MyRouter get instance => _instance;
  MyRouter._init();

  Route? onGnerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/home":
        return simpleRoute(const CardPage());
      case "/addcard" :
      return simpleRoute(const AddCardPage());
     
    }
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}