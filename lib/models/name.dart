import 'package:formz/formz.dart';

enum NameValidationError { invalid }

final class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();
  const Name.dirty([super.value = '']) : super.dirty();

  static final _nameRegex = RegExp(
    r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]',
  );

  @override
  NameValidationError? validator(String? value) {
    return _nameRegex.hasMatch(value ?? '')
        ? null
        : NameValidationError.invalid;
  }
}
