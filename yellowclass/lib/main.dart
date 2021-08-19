import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yellowclass/Moviemodel.dart';
import 'package:yellowclass/Screens/Addinto/Addinto.dart';
import 'package:yellowclass/Screens/EditHome/EditHome.dart';
import 'package:yellowclass/Screens/Welcome/welcome_screen.dart';
import 'package:yellowclass/constants.dart';

const String Movieboxname = "movieinfo";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(MoviemodelAdapter());
  Hive.init(document.path);
  await Hive.openBox<Moviemodel>(Movieboxname);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karthikeyan',
      theme: ThemeData(
        primaryColor: kprimaryColor,
        scaffoldBackgroundColor: kprimaryColor,
      ),
      home: WelcomeScreen(),
    );
  }
}
