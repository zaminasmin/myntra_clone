import 'package:flutter/material.dart';
import 'package:task_sunrun/screens/MainPage.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding:EdgeInsets.fromLTRB(240, 300, 0, 0),
      child: TextButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Mens(),));
      },child:Text('MENS') ),
    ),);
  }
}
