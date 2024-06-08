import 'package:flutter/material.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/providers/category.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/providers/lookbook21.dart';
import 'package:millionflashapp/providers/lookbook22.dart';
import 'package:millionflashapp/providers/lookbook23.dart';
import 'package:millionflashapp/providers/products.dart';
import 'package:millionflashapp/providers/user.dart';
import 'package:millionflashapp/screens/auth_gate.dart';
import 'package:millionflashapp/screens/home.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart'; 
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider.initialize()),
        ChangeNotifierProvider(create: (_) => UserProvider.initialize()),
        ChangeNotifierProvider(create: (_) => ProductProvider.initialize()),
        ChangeNotifierProvider(create: (_) => ItemsProvider.initialize()),
        ChangeNotifierProvider(create: (_) => LookBook21Provider.initialize()),
        ChangeNotifierProvider(create: (_) => LookBook22Provider.initialize()),
        ChangeNotifierProvider(create: (_) => LookBook23Provider.initialize())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MillionFlash',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ScreensController(),
      ),
    ),
  );
}


class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}