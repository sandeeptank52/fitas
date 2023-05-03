import 'package:fitas/client/add_client_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final AddClientBloc _bloc = AddClientBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddClientBloc, AddClientState>(
      bloc: _bloc,
      listenWhen: (pre, cur) => cur is AddClientActionState,
      buildWhen: (pre, cur) => cur is! AddClientActionState,
      listener: (context, state) {
        if (state is AddClientErrorState) {
          var snackBar = SnackBar(
            content: Text(state.error),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is AddClientSuccessState) {
          var snackBar = const SnackBar(
            content: Text("Added Successfully"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text("Add Client"),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Contact Details",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: getFormTextField(
                                    "First Name",
                                    (value) =>
                                        {_bloc.add(OnFirstNameAdd(value))},
                                    type: TextInputType.name)),
                            Expanded(
                              child: getFormTextField("Last Name",
                                  (value) => {_bloc.add(OnLastNameAdd(value))},
                                  type: TextInputType.name),
                            )
                          ],
                        ),
                        getFormTextField("Mobile Number",
                            (value) => {_bloc.add(OnMobileNubAdd(value))},
                            type: TextInputType.number),
                      ],
                    ),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Fitness Details",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                height: 16,
                              ),
                              getFormTextFieldAsHorizontal("Weight",
                                  (value) => {_bloc.add(OnWeightAdd(value))},
                                  type: TextInputType.number),
                              getFormTextFieldAsHorizontal("Height",
                                  (value) => {_bloc.add(OnHeightAdd(value))},
                                  type: TextInputType.number),
                              getFormTextFieldAsHorizontal("BMI     ",
                                  (value) => {_bloc.add(OnBMIAdd(value))},
                                  type: TextInputType.number),
                            ]))),
                const SizedBox(height: 12),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Goal",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                height: 16,
                              ),
                              TextField(
                                onChanged: (value) =>
                                    _bloc.add(OnGoalAdd(value)),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 4,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(16),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ]))),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (state is! AddClientLoadingState)
                        ? Expanded(
                            child: MaterialButton(
                                height: 40,
                                color: Colors.cyan,
                                elevation: 0,
                                onPressed: () =>
                                    {_bloc.add(OnAddClientClick(""))},
                                child: const Text("Add Client",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white))),
                          )
                        : const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator()),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getFormTextField(String heading, Function(String) f,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 12,
          ),
          TextField(
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
          )
        ],
      ),
    );
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
}
