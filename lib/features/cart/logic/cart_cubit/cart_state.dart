part of 'cart_cubit.dart';
abstract class CartState {}
final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {}
final class CartInitQuantity extends CartState {}
final class CartFailure extends CartState {
  final String error;

  CartFailure({required this.error});
}
final class CartDeleteLoading extends CartState {}
final class CartDeleteLoaded extends CartState {}
final class CalculateTotalPrice extends CartState {}
final class MinusItem extends CartState {}
final class AddItem extends CartState {}
final class CartDeleteFailure extends CartState {
  final String error;

  CartDeleteFailure({required this.error});
}
