import 'package:flutter/material.dart';
import 'package:kuisptpm/disease_data.dart';
import 'lamanutama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis PTPM',
      theme: ThemeData.dark(),
      home:  LamanUtama(listDiseases: listDisease),
    );
  }
}
