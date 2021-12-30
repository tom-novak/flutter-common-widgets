String? notNullValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Required field';
  }
  return null;
}

enum CompoundValidatorType {
  first,
  join,
}

class CompoundValidator<T> {
  final CompoundValidatorType? type;
  final String joinSeparator;
  final List<String? Function(T? value)> validators;

  CompoundValidator({
    this.type = CompoundValidatorType.first,
    this.joinSeparator = '; ',
    List<String? Function(T? value)>? validators,
  }) : validators = validators ?? <String? Function(T? value)>[];

  String? validate(T? value) {
    List<String> messages = <String>[];
    for (var validator in validators) {
      var message = validator.call(value);
      if (message != null && type == CompoundValidatorType.first) {
        return message;
      }

      if (message != null) {
        messages.add(message);
      }

      return messages.join(joinSeparator);
    }
  }
}
