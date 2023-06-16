import 'package:flutter/material.dart';
import 'package:practical_using_provider/modules/user/screens/add_edit_user.dart';
import 'package:practical_using_provider/modules/user/screens/components/usercard_text.dart';
import 'package:practical_using_provider/providers/user_provider/user_provider.dart';
import 'package:practical_using_provider/services/navigation_service.dart';
import 'package:practical_using_provider/utils/extensions.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider?>();
    if (provider == null) return const SizedBox();
    final user = provider.users[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Selector<UserProvider, String>(
              selector: (_, __) => provider.users[index].name,
              builder: (_, name, __) {
                return UserCardText('Name: $name', context);
              },
            ),
            Selector<UserProvider, String>(
              selector: (_, __) => provider.users[index].mobile,
              builder: (_, mobile, __) =>
                  UserCardText('Mobile: $mobile', context),
            ),
            Selector<UserProvider, String>(
              selector: (_, __) => provider.users[index].email,
              builder: (_, email, __) => UserCardText('Email: $email', context),
            ),
            Selector<UserProvider, String>(
              selector: (_, __) => provider.users[index].address,
              builder: (_, address, __) =>
                  UserCardText('Address: $address', context),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => context.toNamed(
                    Routes.addEditUserScreen,
                    arguments: AddEditUserScreenArguments(
                        model: user, userProvider: provider),
                  ),
                  icon: const Icon(Icons.edit),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => provider.deleteUser(user, context),
                  icon: const Icon(Icons.delete_forever),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
