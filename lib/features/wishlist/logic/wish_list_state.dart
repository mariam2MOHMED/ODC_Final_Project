part of 'wish_list_cubit.dart';

abstract class WishListState {}

final class WishListInitial extends WishListState {}
final class WishListLoading extends WishListState {}
final class WishListLoaded extends WishListState {}
final class WishListFailure extends WishListState {
  final String error;

  WishListFailure({required this.error});
}
