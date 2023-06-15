import 'package:flutter/material.dart';
import 'package:practical_using_provider/models/user/user.dart';

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
}
