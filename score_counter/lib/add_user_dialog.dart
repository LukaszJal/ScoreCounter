import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:score_counter/constans.dart';
import 'package:score_counter/userData.dart';

class AddUserDialog extends StatefulWidget {
  @override
  _AddUserDialogState createState() => _AddUserDialogState();

  // The callback function with data you want to return -------|
  final Function(UserData value) onConfirm; // <------------|

  const AddUserDialog({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);
}

class _AddUserDialogState extends State<AddUserDialog> {
  double value = 0;
  final userNameController = TextEditingController();

  Widget avatarTmp = RandomAvatar(
    DateTime.now().toIso8601String(),
    height: 70,
    width: 70,
  );

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          addNewUserWidget(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Call the function here to pass back the value -----|
                  UserData tmpUser =
                      new UserData(userNameController.text, avatarTmp);
                  widget.onConfirm(tmpUser); // <-------------------|
                  Navigator.pop(context);
                },
                child: const Text('Dodaj'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Anuluj'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addNewUserWidget() {
    return Column(
      children: [
        GestureDetector(
          onTap: _changeAvatar,
          child: avatarTmp,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Center(
          child: TextField(
            controller: userNameController,
            obscureText: false,
            decoration: inputDecoration,
          ),
        ),
      ],
    );
  }

  void _changeAvatar() {
    setState(() {
      avatarTmp = RandomAvatar(
        DateTime.now().toIso8601String(),
        height: 70,
        width: 70,
      );
    });
  }
}
