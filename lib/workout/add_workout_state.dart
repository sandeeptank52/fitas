part of 'add_workout_bloc.dart';

@immutable
abstract class AddWorkoutState {}

abstract class AddWorkoutActionState extends AddWorkoutState {}

class AddWorkoutInitial extends AddWorkoutState {}

class ShowNameBottomSheet extends AddWorkoutActionState {}

class AddWorkoutLoadingState extends AddWorkoutActionState {}

class AddWorkoutSuccessState extends AddWorkoutActionState {}

class AddWorkoutErrorState extends AddWorkoutActionState {
  String error = "";

  AddWorkoutErrorState(this.error);
}
