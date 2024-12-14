import 'dart:convert';

// Function to decode JSON to UserDetailsModel list
List<UserDetailsModel> userDetailsModelFromJson(String str) =>
    List<UserDetailsModel>.from(json.decode(str).map((x) => UserDetailsModel.fromJson(x)));

// Function to encode UserDetailsModel list to JSON
String userDetailsModelToJson(List<UserDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailsModel {
  String? userId; // User ID
  String? name;
  String? address;
  String? nearbyCity;
  String? state;
  String? country;
  int? pincode;
  int? phoneNumber;

  // Constructor with named parameters
  UserDetailsModel({
    this.userId, // ID field
    this.name,
    this.address,
    this.nearbyCity,
    this.state,
    this.country,
    this.pincode,
    this.phoneNumber,
  });

  // Factory method to create a UserDetailsModel from JSON
  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    userId: json["id"], // Parse ID
    name: json["name"],
    address: json["address"],
    nearbyCity: json["nearbyCity"],
    state: json["state"],
    country: json["country"],
    pincode: json["pincode"],
    phoneNumber: json["phoneNumber"],
  );


  // Method to convert UserDetailsModel to JSON
  Map<String, dynamic> toJson() => {
    "id": userId, // Include ID
    "name": name,
    "address": address,
    "nearbyCity": nearbyCity,
    "state": state,
    "country": country,
    "pincode": pincode,
    "phoneNumber": phoneNumber,
  };
}
