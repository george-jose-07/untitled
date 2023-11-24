import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'Contacts.g.dart';

@HiveType(typeId: 0)
class Contacts{

  @HiveField(0)
  String name;

  @HiveField(1)
  String number;

  @HiveField(2)
  String email;

  @HiveField(3)
  String surnumber;

  Contacts({ required this.name, required this.number,required this.email,required this.surnumber});

}