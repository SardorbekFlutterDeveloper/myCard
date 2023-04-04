

import '../../presentation/protocols/validations.dart';

abstract class FieldValidation {
  String get field;
  ValidationError? validate(Map input);
}