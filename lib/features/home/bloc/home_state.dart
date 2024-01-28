part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  
}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  
}

final class HomeError extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Pet> pets;
  HomeLoaded(this.pets);
}

final class HomeNavigateToHistory extends HomeActionState {}

final class HomeNavigateToDetails extends HomeActionState {}

final class HomePetAlreadyAdopted extends HomeActionState {}






