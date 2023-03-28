import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:score_counter/add_user_dialog.dart';
import 'package:score_counter/userData.dart';
import 'constans.dart';

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
      home: const MyHomePage(title: 'Dodać nazwa gry edytowane'),
      // Todo: dodać wdytowaną nazwę gry (np. scrable)
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _painters = <Widget>[];
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final myController = TextEditingController();
  int idTmp = 1;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _handleTap2(UserData value) {
    setState(() {
      _painters.add(
        Container(
          padding: EdgeInsets.all(2.0),
          width: screenSize().width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(style: mainTextStyle, "$idTmp."),
              //SizedBox(width: 20),
              Text(style: mainTextStyle, value.name),
              //SizedBox(width: 100),
              value.avatar,
            ],
          ),
        ),
      );
      idTmp++;
    });
  }

  Size screenSize() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            child: Text("Lista Graczy"),
          ),
          SizedBox(width: screenSize().width),
          SingleChildScrollView(
            child: Wrap(
              children: [
                Column(
                  children: [
                    ..._painters,
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text("Liczba graczy: " + (idTmp - 1).toString()),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (context) => AddUserDialog(
                    onConfirm: (UserData value) {
                      _handleTap2(value);
                      testUserGen(3);
                      // TODO add new UserData Object witch will be send to the next screen.
                    },
                  ),
                ),
                child: Text('Show Dialog Two'),
              ),
              Text("Rozpocznij"),
            ],
          ),
        ),
      ),
    );
  }

  void testUserGen(int numberTestUser) {
    for (int i = 1; i < numberTestUser; i++) {
      _handleTap2(
        UserData(
          "Marek testowy$i",
          RandomAvatar(
            DateTime.now().toIso8601String(),
            height: 70,
            width: 70,
          ),
        ),
      );
    }
  }
}
