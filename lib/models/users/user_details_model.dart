import 'dart:convert';

List<UserDetailsModel> userDetailsModelFromJson(String str) =>
    List<UserDetailsModel>.from(
        json.decode(str).map((x) => UserDetailsModel.fromJson(x)));

String userDetailsModelToJson(List<UserDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailsModel {
  String? userId;
  String? name;
  String? address;
  String? nearbyCity;
  String? state;
  String? country;
  int? pincode;
  int? phoneNumber;

  UserDetailsModel({
    this.userId,
    this.name,
    this.address,
    this.nearbyCity,
    this.state,
    this.country,
    this.pincode,
    this.phoneNumber,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        userId: json["id"],
        name: json["name"],
        address: json["address"],
        nearbyCity: json["nearbyCity"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": userId,
        "name": name,
        "address": address,
        "nearbyCity": nearbyCity,
        "state": state,
        "country": country,
        "pincode": pincode,
        "phoneNumber": phoneNumber,
      };
}
