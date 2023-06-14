import 'package:flutter/material.dart';
import 'package:practical_using_provider/services/navigation_service.dart';

class PRAppBar extends AppBar {
  PRAppBar({super.key, required BuildContext context, required String title})
      : super(
          title: Text(title),
          centerTitle: true,
          leading: Visibility(
            visible: NavigationService().navigatorKey.currentState?.canPop() ??
                false,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        );
}
