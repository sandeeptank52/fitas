part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class OnTabChange extends HomeEvent {
  int index = 0;

  OnTabChange(this.index);
}

class OnFloatingButtonClick extends HomeEvent {

}