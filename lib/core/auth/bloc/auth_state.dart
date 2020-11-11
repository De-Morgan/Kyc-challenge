import 'package:equatable/equatable.dart';
import 'package:flutter_kyc/core/auth/models/user.dart';
import 'package:flutter_kyc/network/api_error.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);
  @override
  List<Object> get props => [user];
}

class AuthenticationFailed extends AuthState {
  final ApiError error;
  AuthenticationFailed(this.error);

  @override
  List<Object> get props => [error];
}

class Undetermined extends AuthState {}

class UnAuthenticatedSignIn extends AuthState {}

class UnAuthenticatedSignUp extends AuthState {}
