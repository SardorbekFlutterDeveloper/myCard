import 'package:my_card/ui/helpers/i18n/strings/pt_br.dart';



import 'package:flutter/widgets.dart';
import 'package:my_card/ui/helpers/i18n/strings/translation.dart';

class R {
  static Translation string = PtBr();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default: string = PtBr(); break;
    }
  }
}