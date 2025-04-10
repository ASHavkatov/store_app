import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';

class ResetPasswordAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResetPasswordAppBar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 52);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: GestureDetector(
          onTap: () {
            context.go(Routes.login);
          },
          child: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),
      ),
    );
  }
}
