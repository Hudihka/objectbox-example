import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User{
  int id;//должно быть всегда поле id. Сами его мы не задаем

  int idBack; //поле необходимо id для сохранения значения пришедшего с бэка
  String name;
  String phone;
  String email;

    // @Transient() //  не будет сохр в память
    // int notPersisted;

  User({@required this.idBack, this.name, this.email, this.phone});// : assert(idBack != null);

  factory User.fromJson(Map<String, dynamic> json) {
    final idBac = json['id'];

    return User(
      idBack: idBac,
      name: json['name'],
      email: json['email'],
      phone: json['phone']
    );
  }

  // Map<String, dynamic> get toMap{
  //   return {"id": id,
  //   "name": name,
  //   "phone": phone,
  //   "email": email};
  // }
}

