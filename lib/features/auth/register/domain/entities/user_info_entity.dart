import 'dart:io';

import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  // final File image;

  const UserInfoEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    // required this.image,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
        passwordConfirmation,
        // image,
      ];
}
