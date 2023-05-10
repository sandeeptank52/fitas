part of 'client_bloc.dart';

@immutable
abstract class ClientEvent {}

class LoadClients extends ClientEvent {}

class OnClientClick extends ClientEvent {
  Client? client;

  OnClientClick(this.client);
}
