part of 'add_workout_bloc.dart';

@immutable
abstract class AddWorkoutEvent {}

class OnRestButtonClick extends AddWorkoutEvent {
  final int index;

  OnRestButtonClick(this.index);
}

class OnAddExerciseClick extends AddWorkoutEvent {
  final int index;

  OnAddExerciseClick(this.index);
}

class OnExerciseNameAdded extends AddWorkoutEvent {
  final int dayIndex;
  final int exeIndex;
  final String name;

  OnExerciseNameAdded(this.dayIndex, this.exeIndex, this.name);
}

class OnExerciseSetsAdded extends AddWorkoutEvent {
  final int dayIndex;
  final int exeIndex;
  final int sets;

  OnExerciseSetsAdded(this.dayIndex, this.exeIndex, this.sets);
}

class OnExerciseRapsAdded extends AddWorkoutEvent {
  final int dayIndex;
  final int exeIndex;
  final int raps;

  OnExerciseRapsAdded(this.dayIndex, this.exeIndex, this.raps);
}

class OnSaveButtonClick extends AddWorkoutEvent {}

class SaveWorkout extends AddWorkoutEvent {}

class OnNameAdded extends AddWorkoutEvent {
  final String name;

  OnNameAdded(this.name);
}
