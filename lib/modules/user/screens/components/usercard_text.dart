import 'package:flutter/material.dart';

class UserCardText extends Text {
  UserCardText(String data, BuildContext context, {super.key})
      : super(data,
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis);
}
