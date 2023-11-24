import 'package:flutter/material.dart';
import 'package:untitled/AddContact.dart';
import 'package:untitled/Calculator.dart';
import 'package:untitled/Contacts.dart';
import 'package:untitled/GridView.dart';
import 'package:untitled/ListViewBuilder.dart';
import 'package:untitled/StopWatch.dart';
import 'package:untitled/file.dart';
import 'package:untitled/row.dart';
import 'package:untitled/test.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var box = await Hive.openBox('app');
  Hive.registerAdapter(ContactsAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stopwatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.purple),
        ),
      ),
      home: StopWatch(),
    );
  }
}
