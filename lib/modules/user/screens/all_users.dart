import 'package:flutter/material.dart';
import 'package:practical_using_provider/modules/user/screens/add_edit_user.dart';
import 'package:practical_using_provider/modules/user/screens/components/user_card.dart';
import 'package:practical_using_provider/providers/user_provider/user_provider.dart';
import 'package:practical_using_provider/services/navigation_service.dart';
import 'package:practical_using_provider/utils/extensions.dart';
import 'package:practical_using_provider/widgets/appbar.dart';
import 'package:provider/provider.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      builder: (context, child) {
        final userProvider = context.read<UserProvider?>();
        return userProvider == null
            ? const Center(
                child: Text('Something went Wrong'),
              )
            : Scaffold(
                appBar: PRAppBar(context: context, title: 'Home'),
                body: Selector<UserProvider, int>(
                  selector: (_, userProvider) => userProvider.users.length,
                  builder: (_, userLength, __) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: userLength,
                      itemBuilder: (_, index) {
                        return UserCard(
                          index: index,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      ),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => context.toNamed(
                    Routes.addEditUserScreen,
                    arguments: AddEditUserScreenArguments(
                      userProvider: userProvider,
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              );
      },
    );
  }
}
