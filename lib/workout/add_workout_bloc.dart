import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'model/workout_model.dart';

part 'add_workout_event.dart';

part 'add_workout_state.dart';

class AddWorkoutBloc extends Bloc<AddWorkoutEvent, AddWorkoutState> {
  Map<int, List<Exercise>> map = {
    0: [],
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
  };
  String name = "";

  AddWorkoutBloc() : super(AddWorkoutInitial()) {
    on<OnAddExerciseClick>(onAddExerciseClick);
    on<OnRestButtonClick>(onRestButtonClick);
    on<OnSaveButtonClick>(onSaveButtonClick);
    on<OnNameAdded>(onNameAdded);
    on<SaveWorkout>(saveWorkout);
    on<OnExerciseSetsAdded>(onExerciseSetsAdded);
    on<OnExerciseNameAdded>(onExerciseNameAdded);
    on<OnExerciseRapsAdded>(onExerciseRapsAdded);
  }

  FutureOr<void> onAddExerciseClick(
      OnAddExerciseClick event, Emitter<AddWorkoutState> emit) {
    var oldList = map[event.index];
    oldList?.add(Exercise());
    map[event.index] = oldList!;
    emit(AddWorkoutInitial());
  }

  FutureOr<void> onRestButtonClick(
      OnRestButtonClick event, Emitter<AddWorkoutState> emit) {
    map[event.index] = [];
    emit(AddWorkoutInitial());
  }

  Future<FutureOr<void>> onSaveButtonClick(
      OnSaveButtonClick event, Emitter<AddWorkoutState> emit) async {
    print(name);
    emit(ShowNameBottomSheet());
  }

  FutureOr<void> onNameAdded(OnNameAdded event, Emitter<AddWorkoutState> emit) {
    name = event.name;
  }

  FutureOr<void> saveWorkout(
      SaveWorkout event, Emitter<AddWorkoutState> emit) async {
    if (name.isEmpty) {
      emit(AddWorkoutErrorState("Enter name"));
    } else {
      emit(AddWorkoutLoadingState());
      Workout workout = Workout();
      workout.name = name;
      workout.moExe = map[0];
      workout.tuExe = map[1];
      workout.weExe = map[2];
      workout.thExe = map[3];
      workout.frExe = map[4];
      workout.saExe = map[5];
      workout.suExe = map[6];
      await FirebaseFirestore.instance
          .collection("workout_data")
          .doc(FirebaseAuth.instance.currentUser?.uid ?? "")
          .collection("workouts")
          .add(workout.toMap())
          .whenComplete(() async => emit(AddWorkoutSuccessState()));
    }
    // emit(AddClientLoadingState());
    // Client client = Client(fName, lName, mobile, weight, height, bmi,goal);

    // }
  }

  FutureOr<void> onExerciseSetsAdded(OnExerciseSetsAdded event, Emitter<AddWorkoutState> emit) {
    var exe = map[event.dayIndex]?[event.exeIndex];
    exe?.sets = event.sets;
  }

  FutureOr<void> onExerciseRapsAdded(OnExerciseRapsAdded event, Emitter<AddWorkoutState> emit) {
    var exe = map[event.dayIndex]?[event.exeIndex];
    exe?.raps = event.raps;
  }

  FutureOr<void> onExerciseNameAdded(OnExerciseNameAdded event, Emitter<AddWorkoutState> emit) {
    var exe = map[event.dayIndex]?[event.exeIndex];
    exe?.exerciseName = event.name;
  }
}
