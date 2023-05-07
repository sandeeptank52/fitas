import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout/workout_bloc.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final WorkoutBloc _bloc = WorkoutBloc();

  @override
  void initState() {
    _bloc.add(LoadWorkout());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutBloc, WorkoutState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WorkoutLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WorkoutErrorState) {
          return Center(
            child: Text(state.errot),
          );
        } else if (state is WorkoutSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.workoutList.length,
              itemBuilder: (context, index) {
                final workout = state.workoutList[index];
                return Card(
                  child: ListTile(
                    title: Text(workout.name),
                    subtitle: Text(workout.goal),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _bloc.add(OnWorkoutClick());
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
