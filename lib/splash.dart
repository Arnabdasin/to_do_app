import 'package:flutter/material.dart';
import 'home.dart';
import 'package:todoapp/signin.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/new.png"),
                fit: BoxFit.cover,
              )),
          child: Container(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            child: const Icon(
              Icons.add_card_outlined,
            ),
            onPressed: () async {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return SignIn ();
                },
              ), (route) => false);
            },
          ),
        ),
      ),
    );
  }
}
