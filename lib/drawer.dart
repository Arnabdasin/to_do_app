// import 'package:todoapp/profile.dart';
// import 'package:todoapp/settings.dart';
import 'package:todoapp/about.dart';
import 'package:todoapp/home.dart';
import 'package:todoapp/profile.dart';
import 'package:todoapp/settings.dart';
import 'package:todoapp/signin.dart';
import 'package:todoapp/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


Widget appDrawer(context) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image(image: AssetImage('assets/icon.png'))),
        ListTile(
          leading: const Icon(Icons.present_to_all, color: Colors.black),
          title: const Text("Splash"),
          onTap: () {
            if (kDebugMode) {
              print("Splash");
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Splash()));
          },
        ),
        ListTile(
          leading:
          const Icon(Icons.account_circle_outlined, color: Colors.black),
          title: const Text("Profile"),
          onTap: () {
            if (kDebugMode) {
              print("Profile");
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  Profile()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.home,
              color: Colors.black),
          title: const Text("Home"),
          onTap: () {
            if (kDebugMode) {
              print("Profile");
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.black),
          title: const Text("Settings"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Settings()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline_rounded, color: Colors.black),
          title: const Text("About"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => About()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined, color: Colors.black),
          title: const Text("LogOut"),
          onTap: () {
            if (kDebugMode) {
              print("Profile");
            }
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return const SignIn();
                }), (route) => false);
          },
        ),
      ],
    ),
  );
}
