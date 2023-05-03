import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'client/client_bloc.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final ClientBloc _bloc = ClientBloc();

  @override
  void initState() {
    _bloc.add(LoadClients());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientBloc, ClientState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ClientLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ClientErrorState) {
          return Center(
            child: Text(state.errot),
          );
        } else if (state is ClientSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.clientList.length,
              itemBuilder: (context, index) {
                final client = state.clientList[index];
                return Card(
                  child: ListTile(
                    title: Text(client.fName),
                    subtitle: Text("BMI: ${client.bmi}"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _bloc.add(OnClientClick());
                    },
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            child: const Center(
              child: Text("Something wrong"),
            ),
          );
        }
      },
    );
  }
}
