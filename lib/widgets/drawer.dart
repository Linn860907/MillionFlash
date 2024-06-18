import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/user.dart';
import 'package:millionflashapp/screens/AboutMillionFlash.dart';
import 'package:millionflashapp/screens/home.dart';
import 'package:millionflashapp/screens/lookbook21.dart';
import 'package:millionflashapp/screens/lookbook22.dart';
import 'package:millionflashapp/screens/lookbook23.dart';
import 'package:millionflashapp/screens/order.dart';
import 'package:millionflashapp/screens/store.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyDrawer extends StatelessWidget{
  Widget build(BuildContext context){
    final user = Provider.of<UserProvider>(context);
    return Drawer(
          child: ListView(
            children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: grey,
          ),
          accountName: CustomText(
              text: user.userModel.name,
              size: 16,
              color: white,
              weight: FontWeight.normal,
              decoration: TextDecoration.none),
          accountEmail: CustomText(
            text: user.userModel.email,
            size: 16,
            color: white,
            weight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ),
        ListTile(
          onTap: () {
            changeScreen(context, Home());
          },
          // leading: Icon(Icons.home),
          title: CustomText(
              text: "Home",
              size: 16,
              color: black,
              weight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        ListTile(
          onTap: () {
            changeScreen(context, Store());
          },
          // leading: Icon(Icons.store),
          title: CustomText(
              text: "Store",
              size: 16,
              color: black,
              weight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        ExpansionTile(
          title: Text('LookBook'),
            // leading: Icon(Icons.insert_photo),
            // childrenPadding: EdgeInsets.only(left: 60),
            children: [
              ListTile(
                title: Text("21*001"),
                onTap:(){
                  changeScreen(context, Lookbook21());
                },
              ),
              ListTile(
                title:Text('22*002'),
                onTap:(){
                  changeScreen(context, Lookbook22());
                },
              ),
              ListTile(
                title:Text('23SS Glass House'),
                onTap:(){
                  changeScreen(context, Lookbook23());
                },
              )
            ],),
        ListTile(
          onTap: () {
            changeScreen(context, OrdersScreen());
          },
          // leading: Icon(Icons.store),
          title: CustomText(
              text: "Order",
              size: 16,
              color: black,
              weight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        ListTile(
          onTap: () {
            changeScreen(context, AboutMillionFlash());
          },
          // leading: Icon(Icons.assignment_ind),
          title: CustomText(
              text: "About MillionFlash",
              size: 16,
              color: black,
              weight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
      ]));
  }
}