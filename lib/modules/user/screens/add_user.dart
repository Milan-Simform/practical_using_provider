import 'package:flutter/material.dart';
import 'package:practical_using_provider/widgets/appbar.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PRAppBar(context: context, title: 'Add User'),
    );
  }
}
