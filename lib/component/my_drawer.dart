import 'package:flutter/material.dart';
import 'package:twitter_clone/component/my_drawer_tile.dart';
import 'package:twitter_clone/services/auth/auth_service.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final _auth = AuthService();
  void logout() {
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    //darawer
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Icon(
                Icons.person,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            MyDrawerTile(
              title: 'H O M E',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //////////////////////////
            MyDrawerTile(
                title: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                }),
            ///////////////////////////
            ///
            ///
            const Spacer(),

            ///
            ///
            //////////////////////////
            MyDrawerTile(
                title: 'L o g o u t', icon: Icons.logout, onTap: logout),
          ],
        ),
      ),
    );
  }
}
