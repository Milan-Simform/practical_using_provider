import 'package:flutter/material.dart';
import 'package:practical_using_provider/modules/user/screens/components/user_card.dart';
import 'package:practical_using_provider/providers/user_provider.dart';
import 'package:practical_using_provider/utils/extensions.dart';
import 'package:practical_using_provider/widgets/appbar.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: PRAppBar(context: context, title: 'Home'),
          body: Consumer<UserProvider?>(
            builder: (context, value, child) => value == null
                ? const Center(
                    child: Text('Something went Wrong'),
                  )
                : ListView.separated(
                    itemCount: value.users.length,
                    itemBuilder: (_, index) => UserCard(
                      model: value.users[index],
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 10,
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.toNamed('');
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
