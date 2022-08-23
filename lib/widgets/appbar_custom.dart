import 'package:flutter/material.dart';

import 'package:pizzeria_flutter/theme/app_theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String user;
  const AppBarCustom({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      // title: const Text('Hola mundo'),
      actions: [
        CircleAvatar(
          backgroundColor: AppTheme.primary,
          radius: 45.0,
          child: Text(user),
        )
      ],
    );
  }
}
