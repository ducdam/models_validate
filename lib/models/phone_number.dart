import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

final class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([super.value = '']) : super.pure();
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  static final _phoneNumberRegex = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  PhoneNumberValidationError? validator(String? value) {
    return _phoneNumberRegex.hasMatch(value ?? '')
        ? null
        : PhoneNumberValidationError.invalid;
  }
}
