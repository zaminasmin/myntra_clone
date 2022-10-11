import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_sunrun/Provider/Provider.dart';
import 'package:task_sunrun/screens/Body.dart';
import 'package:task_sunrun/screens/HomeScreen.dart';
import 'package:task_sunrun/screens/MainPage.dart';

void main() async{WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>SortProvider(),
      child: MaterialApp(home:
        Mens(),debugShowCheckedModeBanner: false,
      ),
    );
  }
}
