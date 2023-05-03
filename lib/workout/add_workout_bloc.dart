import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'model/workout_model.dart';

part 'add_workout_event.dart';
part 'add_workout_state.dart';

class AddWorkoutBloc extends Bloc<AddWorkoutEvent, AddWorkoutState> {


  Map<int, List<Exercise>> map = {};




  AddWorkoutBloc() : super(AddWorkoutInitial()) {
    on<AddWorkoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
