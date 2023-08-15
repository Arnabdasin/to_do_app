
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/constrains/colours.dart';
import 'package:todoapp/home.dart';
import 'signin.dart';
// import 'grocery_list.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
                title: const Text("TODO App"),
                content: const Text("Do you want to exit the app?"),
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
          // backgroundColor:Colors.,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // const Image(
                //   image: AssetImage("assets/images/Header.png"),
                //   height: 80,
                // ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: const Image(
                    image: AssetImage("assets/icon.png"),
                    height: 250,
                  ),
                ),
                const Text(
                  "Welcome To ToDo App",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 15, 24, 10),
                          child: TextFormField(
                            controller: firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter first name';
                              }
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                return 'First name should only contain alphabets and spaces';
                              }
                              if (value.length > 15) {
                                return 'First name length should be less than 15';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "First Name",
                                prefixIcon: const Icon(
                                  Icons.person,
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
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                          child: TextFormField(
                            controller: lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter last name';
                              }
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                return 'Last name should only contain alphabets and spaces';
                              }
                              if (value.length > 15) {
                                return 'Last name length should be less than 15';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Last Name",
                                prefixIcon: const Icon(
                                  Icons.person,
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
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email address';
                              }
                              if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid E-mail address';
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
                              'Already a member? LogIn',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return  Home(); //Navigate to a new screen while removing all the previous screens from the navigation stack.
                                      },
                                    ), (route) => false);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding:
                                const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                            child: const Text("Sign Up",
                                style: TextStyle(
                                  fontSize: 20,
                                ))),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
