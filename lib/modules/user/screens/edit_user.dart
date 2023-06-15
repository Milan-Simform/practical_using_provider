import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical_using_provider/models/user/user.dart';
import 'package:practical_using_provider/providers/user_provider/edit_user_provider.dart';
import 'package:practical_using_provider/providers/user_provider/user_provider.dart';
import 'package:practical_using_provider/utils/extensions.dart';
import 'package:practical_using_provider/widgets/appbar.dart';
import 'package:practical_using_provider/widgets/textfield.dart';
import 'package:provider/provider.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as EditUserScreenArguments;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>.value(
          value: args.userProvider,
        ),
        Provider(
          create: (context) => EditUserProvider(),
          dispose: (context, value) {
            value.nameController.dispose();
            value.emailController.dispose();
            value.mobileController.dispose();
            value.addressController.dispose();
          },
        ),
      ],
      builder: (context, child) {
        final provider = context.read<EditUserProvider>();
        final userProvider = context.read<UserProvider>();
        provider.setUserValueInController(args.model);
        return Scaffold(
          appBar: PRAppBar(context: context, title: 'Edit User'),
          body: Form(
            key: provider.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PRTextField(
                      title: 'Name',
                      controller: provider.nameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (provider.nameController.text.trim().isEmpty) {
                          return "Name field is required";
                        }
                        return null;
                      },
                    ),
                    PRTextField(
                      title: 'Email',
                      controller: provider.emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        final email = provider.emailController.text.trim();
                        if (email.isEmpty) {
                          return "Email field is required";
                        }
                        if (!email.isEmail) {
                          return "Invalid email address";
                        }
                        return null;
                      },
                    ),
                    PRTextField(
                      title: 'Mobile',
                      controller: provider.mobileController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        final mobile = provider.mobileController.text.trim();
                        if (mobile.isEmpty) {
                          return "Mobile field is required";
                        }
                        if (mobile.length != 10) {
                          return "Enter a valid 10 digit number";
                        }
                        return null;
                      },
                    ),
                    PRTextField(
                      title: 'Address',
                      controller: provider.addressController,
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      validator: (value) {
                        if (provider.addressController.text.trim().isEmpty) {
                          return "Address field is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final name = provider.nameController.text.trim();
                        final email = provider.emailController.text.trim();
                        final mobile = provider.mobileController.text.trim();
                        final address = provider.addressController.text.trim();
                        if (provider.formKey.currentState?.validate() ??
                            false) {
                          userProvider.updateUser(
                            User(
                              id: args.model.id,
                              name: name,
                              email: email,
                              mobile: mobile,
                              address: address,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('User updated.')));
                          if (context.mounted) {
                            context.pop();
                          }
                        }
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class EditUserScreenArguments {
  final User model;
  final UserProvider userProvider;
  EditUserScreenArguments({required this.model, required this.userProvider});
}
