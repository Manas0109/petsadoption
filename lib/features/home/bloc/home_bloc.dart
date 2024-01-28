import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:petsadoption/data/data.dart';
import 'package:petsadoption/features/home/Model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
    on<HistoryButtonNavigateEvent>(onHistoryButtonNavigateEvent);
    on<DetailsButtonNavigateEvent>(_onDetailsButtonNavigateEvent);
    on<SearchPetsEvent>(_mapSearchPetsEventToState);
    }
  }
  FutureOr<void> _mapSearchPetsEventToState(
      SearchPetsEvent event, Emitter<HomeState> emit) {
    // Perform the search logic here
    List<Pet> searchResults = PetsData.petsData
        .map((e) => Pet(
              age: e['age'],
              id: e['id'],
              name: e['name'],
              price: e['price'],
              imageUrl: e['imageUrl'],
              gender: e['gender']
            ))
        .toList()
        .where(
            (pet) => pet.name.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(HomeLoaded(searchResults));
  }


  FutureOr<void> _onHomeInitialEvent(
    
    HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoading());

    emit(HomeLoaded(PetsData.petsData
        .map((e) => Pet(
              age: e['age'],
              id: e['id'],
              name: e['name'],
              price: e['price'],
              imageUrl: e['imageUrl'],
              gender: e['gender']
            ))
        .toList()));
  }

  FutureOr<void> onHistoryButtonNavigateEvent(
      HistoryButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToHistory());
    print("HistoryButtonNavigateEvent");
  }

  FutureOr<void> _onDetailsButtonNavigateEvent(
      DetailsButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("DetailsButtonNavigateEvent");
  }
