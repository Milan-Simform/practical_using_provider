import 'package:flutter/material.dart';
import 'package:practical_using_provider/models/user/user.dart';
import 'package:practical_using_provider/modules/user/screens/edit_user.dart';
import 'package:practical_using_provider/providers/user_provider/user_provider.dart';
import 'package:practical_using_provider/services/navigation_service.dart';
import 'package:practical_using_provider/utils/extensions.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.model}) : super(key: key);
  final User model;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();
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
            Text(
              'Name: ${model.name}',
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Mobile: ${model.mobile}',
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Email: ${model.email}',
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Address: ${model.address}',
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => context.toNamed(
                    Routes.editUserScreen,
                    arguments: EditUserScreenArguments(
                        model: model, userProvider: provider),
                  ),
                  icon: const Icon(Icons.edit),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    provider.deleteUser(model);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User deleted.')));
                  },
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
