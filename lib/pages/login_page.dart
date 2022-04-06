import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // final formKey = GlobalKey<FormState>();
    // final _usernameController = TextEditingController();
    // final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextFormField(
                            // controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            // validator: (s) {},
                            decoration: const InputDecoration(
                              hintText: "Enter email",
                              labelText: "Username",
                            ),
                          ),
                          TextFormField(
                            // controller: _usernameController,
                            keyboardType: TextInputType.text,
                            // validator: (s) {},
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Enter password",
                              labelText: "Password",
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Constants.prefs?.setBool("loggedIn", true);
                              // formKey.currentState.validate();

                              Navigator.pushReplacementNamed(
                                  context, HomePage.routeName);
                            },
                            child: const Text("Sign In"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              textStyle: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
