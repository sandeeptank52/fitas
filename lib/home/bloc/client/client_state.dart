part of 'client_bloc.dart';

@immutable
abstract class ClientState {}

abstract class ClientActionState extends ClientState {}

class ClientInitial extends ClientState {}

class ClientLoadingState extends ClientState {}

class ClientSuccessState extends ClientState {
  List<Client> clientList = [];

  ClientSuccessState(this.clientList);
}

class ClientErrorState extends ClientState {
  String errot = "";

  ClientErrorState(this.errot);
}

class NavigateToClientWorkoutScreen extends ClientActionState {
  Client? client;

  NavigateToClientWorkoutScreen(this.client);
}
