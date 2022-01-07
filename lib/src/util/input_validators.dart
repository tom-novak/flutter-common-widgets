String? notNullValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Required field';
  }
  return null;
}
