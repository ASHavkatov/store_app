import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
class CookieUse extends StatelessWidget {
  const CookieUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: GestureDetector(
            onTap: () {
              context.go(Routes.signUp);
            },
            child: SvgPicture.asset("assets/icons/back-arrow.svg"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              Text(
                "Cookie Use\n\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Cookies (often known as internet cookies) are text files with small pieces of data — like a username and password — that are used to identify your computer as you use a network. Specific cookies are used to identify specific users and improve their web browsing experience. Data stored in a cookie is created by the server upon your connection. This data is labeled with an ID unique to you and your computer. When the cookie is exchanged between your computer and the network server, the server reads the ID and knows what information to specifically serve you.\n\n"
                "To access and manage your Apple data please visit Manage your Apple account. For corrections or general enquiries, please Contact Privacy.\n\n"
                " Due to international laws, such as the EU’s General Data Protection Regulation (GDPR), and certain state laws, like the California Consumer Privacy Act (CCPA), many websites are now required to ask for permission to use certain cookies with your browser and provide you with information on how their cookies will be used if you accept.\n\n",
                style: TextStyle(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
