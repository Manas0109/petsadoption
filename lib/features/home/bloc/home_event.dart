part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class SearchPetsEvent extends HomeEvent {
  final String query;
  SearchPetsEvent(this.query);
}

class HomeInitialEvent extends HomeEvent {}

class HistoryButtonNavigateEvent extends HomeEvent {}

class DetailsButtonNavigateEvent extends HomeEvent {}


