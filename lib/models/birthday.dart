import 'package:formz/formz.dart';

enum BirthdayValidationError { invalid }

class Birthday extends FormzInput<String, BirthdayValidationError> {
  const Birthday.pure([super.value = '']) : super.pure();
  const Birthday.dirty([super.value = '']) : super.dirty();

  static final _birthdayRegex = RegExp(
    r'^\d{4}-\d{2}-\d{2}$', // YYYY-MM-DD format
  );

  @override
  BirthdayValidationError? validator(String? value) {
    return _birthdayRegex.hasMatch(value ?? '')
        ? null
        : BirthdayValidationError.invalid;
  }
}
