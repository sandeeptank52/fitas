import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  int currentTabIndex = 0;

  HomeBloc() : super(HomeInitial()) {
    on<OnTabChange>(onTabChange);
    on<OnFloatingButtonClick>(onFloatingButtonClick);
  }

  FutureOr<void> onTabChange(OnTabChange event, Emitter<HomeState> emit) {
    currentTabIndex  = event.index;
  }

  FutureOr<void> onFloatingButtonClick(OnFloatingButtonClick event, Emitter<HomeState> emit) {
    if(currentTabIndex==0){
      emit(NavigateToAddClientScreen());
    }else{
      emit(NavigateToAddWorkoutScreen());
    }

  }
}
