import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/home.dart';
import 'package:todoapp/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController =
  TextEditingController(); // Manages the text input of form text fields, allowing changes in the text input.
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //used to control what happens when the user presses the back button by intercepting/blocking the back button press
      onWillPop: // enables you to control the behavior of the back button and perform specific actions, such as showing a dialog box
          () async {
        //asynchronous functions, allowing non-blocking operations and the use of await to pause execution and wait for asynchronous results.
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              //Context told us from which part it belongs to
              title: const Text("To Do App"),
              content: const Text("Do you want to quit the app?"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              actions: [
                // user interactions that trigger specific events or behaviors within the app, implemented using appropriate widgets and event handlers.
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); //used to pop a route off the navigation stack within your Flutter application.
                    },
                    child: const Text("No")),
                ElevatedButton(
                    onPressed: () {
                      SystemNavigator
                          .pop(); //used to pop the entire flutter application and return to the device's home screen.
                    },
                    child: const Text("Yes"))
              ],
            ));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white38,
        //a built-in widget that provides a basic structure for implementing Material Design layouts, offering pre-defined slots for app bars, body content, floating action buttons, and more.
        body: SingleChildScrollView(
          //allows its child to be scrolled when it overflows the available vertical space
          child: Column(
            children: [
              // const Image(
              //   image: AssetImage("assets/images/Header.png"),
              // ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: const Image(
                  image: AssetImage("assets/icon.png"),
                  height: 290,
                ),
              ),
              const Text(
                "Welcome To ToDo App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "LogIn",
                style: TextStyle(

                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                //Form widget is used to create a form that collects user input and manages the form state, validation, and submission.
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (value) {
                          setState(() {
                            //You can add any logic here
                          });
                        },
                        validator: (value) {
                          // a function that validates user input and returns an error message if the input is invalid, or null if it is valid.
                          if (value!.isEmpty) {
                            return 'Please enter E-mail address';
                          }
                          if (!RegExp(
                              r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$') //allowing you to perform pattern matching and text manipulation.
                              .hasMatch(value)) {
                            return 'Please enter a valid Email-address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.green,
                              size: 24,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 5, 24, 10),
                      child: TextFormField(
                        controller: passwordController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Password';
                          }
                          if (value.length < 8 || value.length > 16) {
                            return 'Password length should be between 8 and 16';
                          }
                          return null;
                        },
                        obscureText: true, //Password would be hidden
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(
                              Icons.password_outlined,
                              color: Colors.green,
                              size: 24,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 24, 10),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue,fontSize: 17),

                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return  Home();//Navigate to a new screen while removing all the previous screens from the navigation stack.
                                  },
                                ), (route) => false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                        child: const Text("LogIn",
                            style: TextStyle(
                              fontSize: 20,
                            ))),
                    const Text("Or",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SignUp(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      ),
                      child: const Text("Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
