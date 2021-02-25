
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User{
  int id;
  String name;
  String phone;
  String email;

    // @Transient() //  не будет сохр в память
    // int notPersisted;

  User({@required this.id, this.name, this.email, this.phone}) : assert(id != null);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone']
    );
  }

  Map<String, dynamic> get toMap{
    return {"id": id,
    "name": name,
    "phone": phone,
    "email": email};
  }
}