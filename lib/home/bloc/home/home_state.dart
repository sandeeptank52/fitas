part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class NavigateToAddClientScreen extends HomeActionState{}

class NavigateToAddWorkoutScreen extends HomeActionState{}


