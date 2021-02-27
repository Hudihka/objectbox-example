import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home_page.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;


Future<void> main() async {
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.openBox('name_box');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
