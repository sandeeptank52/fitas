import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'add_workout_bloc.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final AddWorkoutBloc _bloc = AddWorkoutBloc();

  PersistentBottomSheetController? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Add Workout"),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  _bloc.add(OnSaveButtonClick());
                }),
          ],
        ),
        body: CarouselSlider(
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 86,
              enlargeFactor: 0.1,
              viewportFraction: 0.92,
              enlargeCenterPage: true,
              enableInfiniteScroll: false),
          items: [0, 1, 2, 3, 4, 5, 6].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(getDayStringByIndex(i),
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          MaterialButton(
                            onPressed: () {
                              _bloc.add(OnRestButtonClick(i));
                            },
                            child: const Text("Rest Day"),
                          ),
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                _bloc.add(OnAddExerciseClick(i));
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: BlocConsumer<AddWorkoutBloc, AddWorkoutState>(
                          bloc: _bloc,
                          listenWhen: (previous, current) =>
                              current is AddWorkoutActionState,
                          buildWhen: (previous, current) =>
                              current is! AddWorkoutActionState,
                          listener: (context, state) {
                            if (state is ShowNameBottomSheet) {
                              showSaveBottomSheet(context);
                            }
                            if (state is AddWorkoutErrorState) {
                              var snackBar = SnackBar(
                                content: Text(state.error),
                                duration: const Duration(milliseconds: 1000),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            if (state is AddWorkoutLoadingState) {
                              bottomSheet?.close();
                            }
                            if (state is AddWorkoutSuccessState) {
                              Navigator.pop(context);
                            }
                          },
                          builder: (context, state) {
                            return ListView.builder(
                              itemCount: _bloc.map[i]?.toList().length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (name) => _bloc.add(
                                            OnExerciseNameAdded(
                                                i, index, name)),
                                        decoration: InputDecoration(
                                          hintText: "Exercise name",
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              onChanged: (sets) => _bloc.add(
                                                  OnExerciseSetsAdded(i, index,
                                                      int.parse(sets))),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "Set",
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.all(16),
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              onChanged: (reps) => _bloc.add(
                                                  OnExerciseRapsAdded(i, index,
                                                      int.parse(reps))),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "Raps",
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.all(16),
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ));
  }

  String getDayStringByIndex(int index) {
    switch (index) {
      case 0:
        return "Monday";
      case 1:
        return "Tuesday";
      case 2:
        return "Wednesday";
      case 3:
        return "Thursday";
      case 4:
        return "Friday";
      case 5:
        return "Saturday";
      case 6:
        return "Sunday";
    }
    return "";
  }

  void showSaveBottomSheet(BuildContext context) {
    bottomSheet = showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Save",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      onChanged: (name) => _bloc.add(OnNameAdded(name)),
                      decoration: InputDecoration(
                        hintText: "Workout Name",
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16),
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) => _bloc.add(OnGoalAdded(value)),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 4,
                      decoration: InputDecoration(
                        hintText: "Goal",
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16),
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MaterialButton(
                          onPressed: () {
                            _bloc.add(SaveWorkout());
                          },
                          color: Colors.cyan,
                          child: const Text(
                            "Save",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
