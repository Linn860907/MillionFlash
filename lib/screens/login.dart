import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/user.dart';
import 'package:millionflashapp/screens/home.dart';
import 'package:millionflashapp/screens/registration.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/IMG_8188.jpg',
                          width: 240, height: 240),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: authProvider.email,
                      decoration: InputDecoration(
                          hintText: "Emails", icon: Icon(Icons.email)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: authProvider.password,
                      decoration: InputDecoration(
                          hintText: "Password", icon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signIn()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login failed!")));
                          return;
                        }
                        authProvider.cleanControllers();
                        changeScreenReplacement(context, Home());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: black,
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Login",
                                size: 22,
                                color: white,
                                weight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () async {
                        if (!await authProvider.signInWithGoogle()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Google sign-in failed!")),
                          );
                          return;
                        }
                        authProvider.cleanControllers();
                        changeScreenReplacement(context, Home());
                      },
                      child: Text("Sign in with Google"),
                    ),
                  ),
                      GestureDetector(
                        onTap: () {
                          changeScreen(context, RegistrationScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                              text: "Register here",
                              size: 15,
                              color: black,
                              weight: FontWeight.normal,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
