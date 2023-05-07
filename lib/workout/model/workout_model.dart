class Workout {
  String name = "";
  String goal = "";
  List<Exercise>? moExe = [];
  List<Exercise>? tuExe = [];
  List<Exercise>? weExe = [];
  List<Exercise>? thExe = [];
  List<Exercise>? frExe = [];
  List<Exercise>? saExe = [];
  List<Exercise>? suExe = [];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['goal'] = goal;
    map['mo_exe'] = moExe?.map((e) => e.toMap()).toList();
    map['tu_exe'] = tuExe?.map((e) => e.toMap()).toList();
    map['we_exe'] = weExe?.map((e) => e.toMap()).toList();
    map['th_exe'] = thExe?.map((e) => e.toMap()).toList();
    map['fr_exe'] = frExe?.map((e) => e.toMap()).toList();
    map['sa_exe'] = saExe?.map((e) => e.toMap()).toList();
    map['su_exe'] = suExe?.map((e) => e.toMap()).toList();
    return map;
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    Workout workout = Workout();
    workout.name = map["name"] ?? "";
    workout.goal = map["goal"] ?? "";
    workout.moExe = (map["mo_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    workout.tuExe = (map["tu_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    workout.weExe = (map["we_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    workout.thExe = (map["th_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    workout.frExe = (map["fr_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    workout.saExe = (map["sa_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    workout.suExe = (map["su_exe"] as List<dynamic>)
        .map((e) => Exercise.fromMap(e))
        .toList();
    return workout;
  }

  Workout();
}

class Exercise {
  String exerciseName = "";
  int raps = 0;
  int sets = 0;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['exerciseName'] = exerciseName;
    map['raps'] = raps;
    map['sets'] = sets;
    return map;
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    Exercise exercise = Exercise();
    exercise.exerciseName = map['exerciseName'];
    exercise.raps = map['raps'];
    exercise.sets = map['sets'];
    return exercise;
  }

  Exercise();
}
