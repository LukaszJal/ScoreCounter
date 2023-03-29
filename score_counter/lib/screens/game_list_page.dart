import 'package:flutter/material.dart';
import 'package:score_counter/userData.dart';

class GameList extends StatelessWidget {
  String? gameName;
  List<Widget>? userList;

  GameList({
    @required this.gameName,
    @required this.userList,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
            child: Wrap(
              children: [
                Column(
                  children: [
                    ...userList!,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
