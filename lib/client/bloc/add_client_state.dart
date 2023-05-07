part of 'add_client_bloc.dart';

@immutable
abstract class AddClientState {}

abstract class AddClientActionState extends AddClientState {}

class AddClientInitial extends AddClientState {}

class AddClientLoadingState extends AddClientState {}

class AddClientSuccessState extends AddClientActionState {}

class AddClientErrorState extends AddClientActionState {
  String error="";

  AddClientErrorState(this.error);
}
