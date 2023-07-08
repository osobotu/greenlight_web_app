// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class HttpFailure extends Failure {
  const HttpFailure({required super.message});
}

class EmailAlreadyExists extends Failure {
  const EmailAlreadyExists({String message = "email already exists"})
      : super(message: message);
}

class UserNotVerified extends Failure {
  const UserNotVerified({String message = "user not verified"})
      : super(message: message);
}

class IncorrectEmailOrPassword extends Failure {
  const IncorrectEmailOrPassword(
      {String message = "incorrect email or password"})
      : super(message: message);
}
