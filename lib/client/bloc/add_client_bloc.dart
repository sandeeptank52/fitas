import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitas/client/model/client_model.dart';
import 'package:meta/meta.dart';

part 'add_client_event.dart';

part 'add_client_state.dart';

class AddClientBloc extends Bloc<AddClientEvent, AddClientState> {
  String fName = "";
  String lName = "";
  String mobile = "";
  String height = "";
  String weight = "";
  String bmi = "";
  String goal = "";
  bool isMale = true;

  AddClientBloc() : super(AddClientInitial()) {
    on<OnFirstNameAdd>(onFirstNameAdd);
    on<OnLastNameAdd>(onLastNameAdd);
    on<OnMobileNubAdd>(onMobileNubAdd);
    on<OnHeightAdd>(onHeightAdd);
    on<OnWeightAdd>(onWeightAdd);
    on<OnBMIAdd>(onBMIAdd);
    on<OnGoalAdd>(onGoalAdd);
    on<OnAddClientClick>(onAddClientClick);
    on<OnGenderChange>(onGenderChange);
  }

  FutureOr<void> onFirstNameAdd(
      OnFirstNameAdd event, Emitter<AddClientState> emit) {
    fName = event.data;
  }

  FutureOr<void> onLastNameAdd(
      OnLastNameAdd event, Emitter<AddClientState> emit) {
    lName = event.data;
  }

  FutureOr<void> onMobileNubAdd(
      OnMobileNubAdd event, Emitter<AddClientState> emit) {
    mobile = event.data;
  }

  FutureOr<void> onHeightAdd(OnHeightAdd event, Emitter<AddClientState> emit) {
    height = event.data;
  }

  FutureOr<void> onWeightAdd(OnWeightAdd event, Emitter<AddClientState> emit) {
    weight = event.data;
  }

  FutureOr<void> onBMIAdd(OnBMIAdd event, Emitter<AddClientState> emit) {
    bmi = event.data;
  }

  FutureOr<void> onGoalAdd(OnGoalAdd event, Emitter<AddClientState> emit) {
    goal = event.data;
  }

  FutureOr<void> onAddClientClick(
      OnAddClientClick event, Emitter<AddClientState> emit) async {
    if (fName.isEmpty) {
      emit(AddClientErrorState("Enter first name"));
    } else if (lName.isEmpty) {
      emit(AddClientErrorState("Enter last name"));
    } else if (mobile.isEmpty) {
      emit(AddClientErrorState("Enter mobile"));
    } else if (height.isEmpty) {
      emit(AddClientErrorState("Enter height"));
    } else if (weight.isEmpty) {
      emit(AddClientErrorState("Enter weight"));
    } else if (bmi.isEmpty) {
      emit(AddClientErrorState("Enter bmi"));
    } else if (goal.isEmpty) {
      emit(AddClientErrorState("Enter goal"));
    } else {
      emit(AddClientLoadingState());
      Client client = Client(fName, lName, mobile, weight, height,
          (isMale) ? "Male" : "Female", bmi, goal);
      await FirebaseFirestore.instance
          .collection("client_data")
          .doc(FirebaseAuth.instance.currentUser?.uid ?? "")
          .collection("clients")
          .add(client.toMap())
          .whenComplete(() async => emit(AddClientSuccessState()));
    }
  }

  FutureOr<void> onGenderChange(
      OnGenderChange event, Emitter<AddClientState> emit) {
    if (event.data == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
    emit(AddClientInitial());
  }
}
