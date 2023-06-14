import 'package:flutter/material.dart';
import 'package:practical_using_provider/models/user/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.model}) : super(key: key);
  final User model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(model.name),
          Text(model.mobile),
          Text(model.address),
          Text(model.email),
        ],
      ),
    );
  }
}
