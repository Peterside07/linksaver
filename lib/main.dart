// import 'dart:io';
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linksaver/model/link.dart';

import 'screen/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LinkAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Links',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
