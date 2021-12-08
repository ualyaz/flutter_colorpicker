import 'package:flutter/material.dart';
import 'package:picker/picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appbarBackgroudColor = Colors.deepPurpleAccent;
  final backgroudColor = Colors.deepPurple;
  final buttonBgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Color Picker',
      debugShowCheckedModeBanner: false,
      home: PickerPage(),
    );
  }
}
