part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent {}


class LoadWorkout extends WorkoutEvent {}

class OnWorkoutClick extends WorkoutEvent {}