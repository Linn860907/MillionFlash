import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/screens/cart.dart';
import 'package:millionflashapp/screens/account.dart';
import 'package:millionflashapp/screens/home.dart';
import 'package:millionflashapp/screens/login.dart';
import 'package:millionflashapp/screens/search.dart';
import 'package:millionflashapp/widgets/bottom_navigation_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 72,
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BottomNavIcon(
                  image: "home.png",
                  name: 'home',
                  onTap: () {
                    changeScreen(context, Home());
                  },
                ),
                BottomNavIcon(
                  image: "search.png",
                  name: 'search',
                  onTap: () {
                    changeScreen(context, Search());
                  },
                ),
                BottomNavIcon(
                  image: "shoppingcart.png",
                  name: 'cart',
                  onTap: () {
                    changeScreen(context, CartScreen());
                  },
                ),
                BottomNavIcon(
                  image: "person.png",
                  name: 'account',
                  onTap: () {
                    Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              );
                  },
                ),
              ],
            ),
          ));
  }
}