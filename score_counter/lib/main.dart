import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:score_counter/add_user_dialog.dart';
import 'package:score_counter/screens/start_page.dart';
import 'package:score_counter/userData.dart';
import 'constans.dart';
import 'screens/game_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHomePage(title: 'Dodać nazwa gry edytowane'),
        '/gameList': (context) => GameList(),
      },
      //home: const MyHomePage(title: 'Dodać nazwa gry edytowane'),
      // Todo: dodać wdytowaną nazwę gry (np. scrable)
    );
  }
}
