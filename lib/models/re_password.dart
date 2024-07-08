import 'package:formz/formz.dart';

enum RePasswordValidationError { invalid, mismatch }

class ReNewPassword extends FormzInput<String, RePasswordValidationError> {
  final String originalPassword;

  const ReNewPassword.pure({this.originalPassword = ''}) : super.pure('');
  const ReNewPassword.dirty({required this.originalPassword, String value = ''}) : super.dirty(value);

  @override
  RePasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return RePasswordValidationError.invalid;
    } else if (originalPassword != value) {
      return RePasswordValidationError.mismatch;
    }
    return null;
  }
}