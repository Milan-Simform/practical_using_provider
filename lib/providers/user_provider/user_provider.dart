import 'package:flutter/material.dart';
import 'package:practical_using_provider/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  final users = <User>[
    User(
        id: 'mkmkmk',
        name: 'Milan Chabhadiya',
        email: 'milan.c@simformsolutions.com',
        mobile: '9227165251',
        address: 'Shyamal, Ahmedabad')
  ];

  void addUser(User model) {
    users.add(model);
    notifyListeners();
  }

  void updateUser(User model) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].id == model.id) {
        if (users[i] != model) {
          users[i] = model;
          notifyListeners();
        }
        break;
      }
    }
  }

  void deleteUser(User model, BuildContext context) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].id == model.id) {
        users.removeAt(i);
        notifyListeners();
        break;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('User deleted.')));
  }
}
