// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class User extends Equatable {
  final int id;
  final String name;

  final String email;
  final bool activated;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.activated,
  });

  @override
  List<Object> get props => [id, name, email, activated];

  User copyWith({
    int? id,
    String? name,
    String? email,
    bool? activated,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      activated: activated ?? this.activated,
    );
  }
}
