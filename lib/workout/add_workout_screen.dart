import 'package:fitas/workout/model/workout_model.dart';
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
  Map<int, List<Exercise>> map = {};

  @override
  void initState() {
    map[0] = [];
    map[1] = [];
    map[2] = [];
    map[3] = [];
    map[4] = [];
    map[5] = [];
    map[6] = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Add Workout"),
          actions: [
            IconButton(icon: const Icon(Icons.save), onPressed: () {}),
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
                              setState(() {
                                map[i] = [];
                              });
                            },
                            child: const Text("Rest Day"),
                          ),
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  var oldList = map[i];
                                  oldList?.add(Exercise());
                                  map[i] = oldList!;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: map[i]?.toList().length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                children: [
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Exercise name",
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(16),
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
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
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: "Set",
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
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: "Raps",
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
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
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

  Widget getFormTextFieldAsHorizontal(String heading, Function(String) f,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(heading,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => f(value),
              keyboardType: type,
              decoration: InputDecoration(
                hintText: heading,
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
          )
        ],
      ),
    );
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
}
