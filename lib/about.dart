import 'package:todoapp/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/drawer.dart';

import 'constrains/colours.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildAppBar(),
      drawer: appDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Image(
                  image: AssetImage("assets/icon.png"),
                  height: 250,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: const Text(
                  "About ToDo App: Effortless Time Management ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: const Text(
                    "Simplify your life with our intuitive Todo App. "
                        "Streamline task management through prioritization, customizable categories, and timely reminders."
                        "Stay organized across devices with seamless synchronization, and collaborate effortlessly on shared tasks. "
                        "Experience productivity like never before with our user-friendly design. ",

                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.justify),
              ),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: const Text("Developed in 2023",
                    style:
                        TextStyle(color: Colors.black54, letterSpacing: 0.3)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                alignment: AlignmentDirectional.centerEnd,
                child: const Text(
                  "- Arnab Das",
                  style: TextStyle(color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
AppBar _buildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    // title:
    // title: Row(
    //   mainAxisAlignment:MainAxisAlignment.spaceBetween,
    //   children: [
    //   Icon(
    //     Icons.menu,
    //     color:tdBlack,
    //     size: 30,
    //   ),
    //   Container(
    //     height: 40,
    //     width: 40,
    //     child: ClipRect(
    //       child:Image.asset('assets/profile1.jpg') ,
    //     ),
    //   ),
    // ],),
  );
}