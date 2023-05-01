class Client {
  String fName = "";
  String lName = "";
  String mobile = "";
  String weight = "";
  String height = "";
  String bmi = "";
  String goal = "";

  Client(this.fName, this.lName, this.mobile, this.weight, this.height,
      this.bmi, this.goal);

  Map<String, String> toMap() {
    Map<String, String> map = {};
    map["fName"] = fName;
    map["lName"] = lName;
    map["mobile"] = mobile;
    map["weight"] = weight;
    map["height"] = height;
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
        map["bmi"] ?? "",
        map["goal"] ?? "");
  }
}
