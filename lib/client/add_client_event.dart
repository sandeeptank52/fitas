part of 'add_client_bloc.dart';

@immutable
abstract class AddClientEvent {
  abstract String data;
}

class OnFirstNameAdd extends AddClientEvent {
  @override
  String data;

  OnFirstNameAdd(this.data);
}

class OnLastNameAdd extends AddClientEvent {
  @override
  String data;

  OnLastNameAdd(this.data);
}

class OnMobileNubAdd extends AddClientEvent {
  @override
  String data;

  OnMobileNubAdd(this.data);
}

class OnWeightAdd extends AddClientEvent {
  @override
  String data;

  OnWeightAdd(this.data);
}

class OnHeightAdd extends AddClientEvent {
  @override
  String data;

  OnHeightAdd(this.data);
}

class OnBMIAdd extends AddClientEvent {
  @override
  String data;

  OnBMIAdd(this.data);
}
class OnGoalAdd extends AddClientEvent {
  @override
  String data;

  OnGoalAdd(this.data);
}

class OnAddClientClick extends AddClientEvent {
  @override
  String data;

  OnAddClientClick(this.data);
}
