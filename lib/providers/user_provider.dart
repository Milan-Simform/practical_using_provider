import 'package:flutter/material.dart';
import 'package:practical_using_provider/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  final users = <User>[
    User(
        id: 'mkmkmk',
        name: 'name',
        email: 'email',
        mobile: 'mobile',
        address: 'address')
  ];
  void addUser(User model) {
    users.add(model);
    notifyListeners();
  }

  void editUser(User model) {}

  void deleteUser(User model) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].id == model.id) {
        users.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }
}
