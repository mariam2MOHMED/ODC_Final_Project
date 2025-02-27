part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure(this.message);
}
final class AddUserLoading extends AuthState {}

final class AddUserSuccess extends AuthState {}

final class AddUserFailure extends AuthState {
  final String message;

  AddUserFailure(this.message);
}
final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailure extends AuthState {
  final String message;

  AuthRegisterFailure({required this.message});
}