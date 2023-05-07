import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../workout/model/workout_model.dart';

part 'workout_event.dart';

part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitial()) {
    on<LoadWorkout>(loadWorkout);
  }

  FutureOr<void> loadWorkout(LoadWorkout event,
      Emitter<WorkoutState> emit) async {
    emit(WorkoutLoadingState());
    CollectionReference ref = FirebaseFirestore.instance
        .collection("workout_data")
        .doc(FirebaseAuth.instance.currentUser?.uid ?? "")
        .collection("workouts");
    await for (QuerySnapshot querySnapshot in ref.snapshots()) {
      final List<Workout> workoutList = querySnapshot.docs
          .map((doc) => Workout.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      if (!emit.isDone) {
        emit(WorkoutSuccessState(workoutList));
      }
    }
  }
}
