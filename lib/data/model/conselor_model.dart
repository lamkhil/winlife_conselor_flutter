class Conselor {
  String id;
  String name;
  String mobileNumber;
  String email;
  Conselor(this.email, this.id, this.mobileNumber, this.name);

  factory Conselor.fromJson(Map<String, dynamic> json) {
    return Conselor(
      json['email'],
      json['id'],
      json['mobile_number'],
      json['name'],
    );
  }
}
