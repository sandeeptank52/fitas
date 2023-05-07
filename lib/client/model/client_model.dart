class Client {
  String fName = "";
  String lName = "";
  String mobile = "";
  String weight = "";
  String height = "";
  String bmi = "";
  String goal = "";
  String gender = "";

  Client(this.fName, this.lName, this.mobile, this.weight, this.height,this.gender,
      this.bmi, this.goal);

  Map<String, String> toMap() {
    Map<String, String> map = {};
    map["fName"] = fName;
    map["lName"] = lName;
    map["mobile"] = mobile;
    map["weight"] = weight;
    map["height"] = height;
    map["gender"] = gender;
    map["bmi"] = bmi;
    map["goal"] = goal;
    return map;
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
        map["fName"] ?? "",
        map["lName"] ?? "",
        map["mobile"] ?? "",
        map["weight"] ?? "",
        map["height"] ?? "",
        map["gender"] ?? "",
        map["bmi"] ?? "",
        map["goal"] ?? "");
  }
}
