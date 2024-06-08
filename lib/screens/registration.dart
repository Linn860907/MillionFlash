import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/user.dart';
import 'package:millionflashapp/screens/login.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                        controller: authProvider.name,
                        decoration: InputDecoration(
                            hintText: "Username", icon: Icon(Icons.person)),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: authProvider.email,
                        decoration: InputDecoration(
                            hintText: "Emails", icon: Icon(Icons.email)),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: authProvider.password,
                        decoration: InputDecoration(
                            hintText: "Password", icon: Icon(Icons.lock)),
                        obscureText: true,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
                      child: GestureDetector(
                        onTap: () async {
                          if (!await authProvider.signUp()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Resgistration failed!")));
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
                                  text: "Resgister",
                                  size: 22,
                                  color: white,
                                  weight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "Login here",
                            size: 15,
                            color: black,
                            weight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      ],
                    ),
                  )
                ],
              )));
  }
}
