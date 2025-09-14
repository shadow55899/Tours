import 'package:flutter/material.dart';
import 'package:tours/screen/fliter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: Colors.black, // ✅ Full black drawer background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.black, // ✅ Black header
            child: Text(
              "دليلك السياحي",
              style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            context,
            "الرحلات",
            Icons.card_travel,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            context,
            "الفلترة",
            Icons.filter_list,
            () => Navigator.of(context).pushNamed(FliterScreen.screenRoute),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTapLink,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.white, // ✅ White icons on black
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(color: Colors.white),
      ),
      onTap: onTapLink,
      hoverColor: Colors.white.withOpacity(0.05),
      splashColor: Colors.white.withOpacity(0.1),
    );
  }
}
