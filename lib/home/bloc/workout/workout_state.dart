part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState {}

class WorkoutInitial extends WorkoutState {}
abstract class WorkoutActionState extends WorkoutState {}

class WorkoutLoadingState extends WorkoutState {}

class WorkoutSuccessState extends WorkoutState {
  List<Workout> workoutList = [];

  WorkoutSuccessState(this.workoutList);
}

class WorkoutErrorState extends WorkoutState {
  String errot = "";

  WorkoutErrorState(this.errot);
}

class NavigateToWorkoutWorkoutScreen extends WorkoutActionState {}