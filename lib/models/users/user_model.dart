import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic imageUrl;
  final String? password;
  final Timestamp? createdAt;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.imageUrl,
    this.password,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      imageUrl: json['imageUrl'],
      password: json['passWord'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
      'passWord': password,
      'createdAt': createdAt,
    };
  }
}