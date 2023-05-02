import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_workout_event.dart';
part 'add_workout_state.dart';

class AddWorkoutBloc extends Bloc<AddWorkoutEvent, AddWorkoutState> {
  AddWorkoutBloc() : super(AddWorkoutInitial()) {
    on<AddWorkoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
