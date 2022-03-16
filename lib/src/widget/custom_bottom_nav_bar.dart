import 'package:flutter/material.dart';
import 'package:kubo_test/src/screen/home/home_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: MenuState.profile == selectedMenu
                    ? Colors.green
                    : inActiveIconColor,
                onPressed: () =>
                    Navigator.pushNamed(context, HomePage.routeName),
              ),
              IconButton(
                icon: const Icon(Icons.dashboard),
                color: MenuState.profile == selectedMenu
                    ? Colors.green
                    : inActiveIconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_basket),
                color: MenuState.profile == selectedMenu
                    ? Colors.green
                    : inActiveIconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_pin_sharp),
                color: MenuState.profile == selectedMenu
                    ? Colors.green
                    : inActiveIconColor,
                onPressed: () =>
                    Navigator.pushNamed(context, HomePage.routeName),
              ),
            ],
          )),
    );
  }
}

enum MenuState { home, favourite, message, profile }
