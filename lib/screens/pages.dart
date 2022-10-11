import 'package:flutter/material.dart';
class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Column(
      children: [
    Container(
    margin: const EdgeInsets.symmetric(
      vertical: 00.0,
    ),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
        Container(
        height: 100, width:
      400,margin: EdgeInsets.all(0.00), child: Image.asset('images/1cover.webp'),),
      Container(
          height: 200, width: 600, child: Image.asset('images/2cover.jpg')),
      Container(
          height: 200, width: 600, child: new Image(image: new AssetImage('images/3cover.jpg'),width: 100,height: 100,)),
      Container(
          height: 200, width: 600, child: Image.asset('images/4.jpg'))
      ],
    ),
    ),

/*        GridView(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            children: [
              Image.asset('images/2.jpg'),
              Image.asset('images/1.jpg'),
              Image.asset('images/3.jpg'),
              Image.asset('images/4.jpg'),
              Image.asset('images/5.jpg'),
              Image.asset('images/6.jpg'),
            ])*/ ],
    ),);
  }
}

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(children: [
        TextButton(onPressed: (){}, child: Text("Home 1")),
        TextButton(onPressed: (){}, child: Text("Home 2")),
        TextButton(onPressed: (){}, child: Text("Home 3")),
        TextButton(onPressed: (){}, child: Text("Home 4")),



      ],),
    ),);
  }
}

class page3 extends StatefulWidget {
  const page3({Key? key}) : super(key: key);

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [


    ],),);
  }
}

class page4 extends StatefulWidget {
  const page4({Key? key}) : super(key: key);

  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('page4'),);
  }
}
