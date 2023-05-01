import 'package:fitas/home/screen/clients_screen.dart';
import 'package:fitas/home/screen/workout_screen.dart';
import 'package:fitas/workout/add_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth_service.dart';
import '../../client/add_client_screen.dart';
import '../home_bloc.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignOut;

  HomePage({Key? key, required this.onSignOut}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  final HomeBloc _bloc = HomeBloc();
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller?.addListener(() {
      _bloc.add(OnTabChange(_controller?.index ?? 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listenWhen: (pre, cur) => cur is HomeActionState,
      buildWhen: (pre, cur) => cur is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToAddClientScreen) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddClientScreen()));
        } else if (state is NavigateToAddWorkoutScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddWorkoutScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hi ${_auth.getCurrentUser()?.displayName},'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.logout), onPressed: widget.onSignOut),
            ],
            bottom: TabBar(
              controller: _controller,
              onTap: (value) => _controller?.animateTo(value),
              tabs: const <Widget>[
                Tab(text: 'Clients'),
                Tab(text: 'Workouts'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: const <Widget>[
              ClientScreen(),
              WorkoutScreen(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _bloc.add(OnFloatingButtonClick());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
