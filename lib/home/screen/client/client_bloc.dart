import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../client/client_model.dart';

part 'client_event.dart';

part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(ClientInitial()) {
    on<LoadClients>(loadClients);
  }

  FutureOr<void> loadClients(
      LoadClients event, Emitter<ClientState> emit) async {
    emit(ClientLoadingState());
    CollectionReference ref = FirebaseFirestore.instance
        .collection("client_data")
        .doc(FirebaseAuth.instance.currentUser?.uid ?? "")
        .collection("clients");
    await for (QuerySnapshot querySnapshot in ref.snapshots()) {
      final List<Client> clientList = querySnapshot.docs
          .map((doc) => Client.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      if (!emit.isDone) {
        emit(ClientSuccessState(clientList));
      }
    }
  }
}
