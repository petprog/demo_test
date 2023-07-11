import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const MainInitialState()) {
    on<HomeInitailEvent>(homeInitialEvent);
    on<HomeChangePageEvent>(homeChangePageEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitailEvent event, Emitter<HomeState> emit) {
    emit(const MainInitialState());
  }

  FutureOr<void> homeChangePageEvent(
      HomeChangePageEvent event, Emitter<HomeState> emit) {
    emit(MainPageIndexState(event.pageIndex));
    // print(state.pageIndex);
  }
}
