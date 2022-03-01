import 'package:uuid/uuid.dart';

enum UserType {
  anonymous,
  registered,
}

class User {
  final String id;
  final UserType type;
  final String firstName;
  final String lastName;
  final String email;

  User(
      {String? id,
      this.type = UserType.anonymous,
      this.firstName = '',
      this.lastName = '',
      this.email = ''})
      : id = id ?? const Uuid().v4();
}
