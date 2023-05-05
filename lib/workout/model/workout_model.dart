class Workout {
  String name = "";
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
    map['mo_exe'] = moExe?.map((e) => e.toMap()).toList();
    map['tu_exe'] = tuExe?.map((e) => e.toMap()).toList();
    map['we_exe'] = weExe?.map((e) => e.toMap()).toList();
    map['th_exe'] = thExe?.map((e) => e.toMap()).toList();
    map['fr_exe'] = frExe?.map((e) => e.toMap()).toList();
    map['sa_exe'] = saExe?.map((e) => e.toMap()).toList();
    map['su_exe'] = suExe?.map((e) => e.toMap()).toList();
    return map;
  }
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
}
