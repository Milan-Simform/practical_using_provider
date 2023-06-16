import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical_using_provider/models/user/user.dart';
import 'package:practical_using_provider/providers/user_provider/edit_user_provider.dart';
import 'package:practical_using_provider/providers/user_provider/user_provider.dart';
import 'package:practical_using_provider/utils/textfield_validator.dart';
import 'package:practical_using_provider/widgets/appbar.dart';
import 'package:practical_using_provider/widgets/textfield.dart';
import 'package:provider/provider.dart';

class AddEditUserScreenArguments {
  final User? model;
  final UserProvider userProvider;

  AddEditUserScreenArguments({this.model, required this.userProvider});
}

class AddEditUserScreen extends StatelessWidget {
  const AddEditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as AddEditUserScreenArguments;
    final userProvider = args.userProvider;
    String getAppBarTitle() {
      if (args.model == null) {
        return 'Add User';
      }
      return 'Edit User';
    }

    String getButtonTitle() {
      if (args.model == null) {
        return 'Add';
      }
      return 'Update';
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>.value(value: args.userProvider),
        Provider(
          create: (context) => EditUserProvider(),
          dispose: (context, value) => value.dispose(),
        ),
      ],
      builder: (context, child) {
        final provider = context.read<EditUserProvider>();
        if (args.model != null) {
          provider.setUserValueInController(args.model!);
        }
        return Scaffold(
          appBar: PRAppBar(context: context, title: getAppBarTitle()),
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
                      validator: (value) => TextFieldValidator.validateString(
                          provider.name, 'Name'),
                    ),
                    PRTextField(
                      title: 'Email',
                      controller: provider.emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          TextFieldValidator.validateEmail(provider.email),
                    ),
                    PRTextField(
                      title: 'Mobile',
                      controller: provider.mobileController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) =>
                          TextFieldValidator.validateMobile(provider.mobile),
                    ),
                    PRTextField(
                      title: 'Address',
                      controller: provider.addressController,
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      validator: (value) => TextFieldValidator.validateString(
                          provider.address, 'Address'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => args.model == null
                          ? provider.addUser(userProvider, context)
                          : provider.updateUser(
                              userProvider, context, args.model!),
                      child: Text(getButtonTitle()),
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
