// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: size.height / 3,
                color: const Color.fromARGB(255, 11, 76, 216),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid email';
                          } else if (!value.contains('@')) {
                            return 'please enter @ with email address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "email",
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid password';
                          } else if (value.length <= 8) {
                            return 'your password less than 8 characters';
                          }
                          return null;
                        },
                        obscureText: false,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "password",
                          prefixIcon: Icon(
                            Icons.key,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: size.height * 0.04,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 11, 76, 216),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 3,
                  vertical: size.height / 60,
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Login'),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 3.2,
                    vertical: size.height / 60,
                  ),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 11, 76, 216),
                    width: 1,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 76, 216),
                  )),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
