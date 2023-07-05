class User {
  final int employeeId;
  final String employeeName;
  final int u;
  final int t;
  final String companyName;

  User({
    required this.employeeId,
    required this.employeeName,
    required this.u,
    required this.t,
    required this.companyName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      u: json['u'],
      t: json['t'],
      companyName: json['companyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'employeeName': employeeName,
      'u': u,
      't': t,
      'companyName': companyName,
    };
  }
}
