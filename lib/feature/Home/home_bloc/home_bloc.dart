import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    Future<void> _onHomeInitialEvent(
      HomeInitialEvent event,
      Emitter<HomeState> emit,
    ) async {
      emit(HomeLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(HomeLoaded());
    }
  }
}
