part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeChangeBottomNavBar extends HomeState {}
final class BrowseSearch extends HomeState {}
final class HomeUserDataLoading extends HomeState {}
final class HomeUserDataSucess extends HomeState {}
final class HomeUserDataFailure extends HomeState {
  final String error;

  HomeUserDataFailure({required this.error});
}

final class HomeProductLoading extends HomeState {}
final class HomeProductSucess extends HomeState {}
final class HomeProductError extends HomeState {
  final String error;

  HomeProductError({required this.error});
}

final class HomeRelatedProductLoading extends HomeState {}
final class HomeRelatedProductSucess extends HomeState {}
final class HomeRelatedProductError extends HomeState {
  final String error;

  HomeRelatedProductError({required this.error});
}
final class HomeCategoriesLoading extends HomeState {}
final class HomeCategoriesSucess extends HomeState {}
final class HomeCategoriesError extends HomeState {
  final String error;

  HomeCategoriesError({required this.error});
}
final class HomeSingleProductLoading extends HomeState {}
final class HomeSingleProductSucess extends HomeState {}
final class HomeSingleProductError extends HomeState {
  final String error;

  HomeSingleProductError({required this.error});
}
