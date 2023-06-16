import 'package:flutter/material.dart';
import 'package:practical_using_provider/models/user/user.dart';
import 'package:practical_using_provider/providers/user_provider/user_provider.dart';
import 'package:practical_using_provider/utils/extensions.dart';

class EditUserProvider {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  setUserValueInController(User model) {
    nameController.text = model.name;
    emailController.text = model.email;
    mobileController.text = model.mobile;
    addressController.text = model.address;
  }

  String get name => nameController.text.trim();

  String get email => emailController.text.trim();

  String get mobile => mobileController.text.trim();

  String get address => addressController.text.trim();

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    addressController.dispose();
  }

  void addUser(UserProvider userProvider, BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      userProvider.addUser(
        User(
          id: DateTime.now().toString(),
          name: name,
          email: email,
          mobile: mobile,
          address: address,
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User added.')));
      if (context.mounted) {
        context.pop();
      }
    }
  }

  void updateUser(UserProvider userProvider, BuildContext context, User model) {
    if (formKey.currentState?.validate() ?? false) {
      userProvider.updateUser(
        User(
          id: model.id,
          name: name,
          email: email,
          mobile: mobile,
          address: address,
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User updated.')));
      if (context.mounted) {
        context.pop();
      }
    }
  }
}
