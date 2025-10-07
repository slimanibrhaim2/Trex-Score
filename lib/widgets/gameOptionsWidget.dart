import 'package:flutter/material.dart';

Widget gameOption(BuildContext context, String title, IconData icon) {
  return Card(
    elevation: 2,
    child: ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Close the modal and perform the action
        Navigator.pop(context); // Close the bottom sheet
        print('$title selected!');
        // Navigator.of(context).push(...)  <-- Start the game screen here
      },
    ),
  );
}