part of 'cart_cubit.dart';
abstract class CartState {}
final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {}
final class CartFailure extends CartState {
  final String error;

  CartFailure({required this.error});
}
