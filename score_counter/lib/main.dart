import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:score_counter/add_user_dialog.dart';
import 'package:score_counter/userData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Avatar example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Random Example'),
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
        Row(
          children: [
            Text(idTmp.toString()),
            Text(value.name),
            value.avatar,
          ],
        ),
      );
      idTmp++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            child: Wrap(
              children: [
                Column(
                  children: [..._painters],
                ),
              ],
            ),
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
}
