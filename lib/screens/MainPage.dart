
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_sunrun/Provider/Provider.dart';
import 'package:task_sunrun/screens/Body.dart';
import 'package:task_sunrun/screens/Filter.dart';

class Mens extends StatefulWidget {
  const Mens({Key? key}) : super(key: key);

  @override
  State<Mens> createState() => _MensState();
}

class _MensState extends State<Mens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textAlign: TextAlign.start,
              'MEN',
              
              style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
            ),
            Text('68787 Items',textAlign: TextAlign.start,style: TextStyle(color: Colors.grey,fontSize: 12),)
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.card_travel_rounded))
        ],
      ),

      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  _sortBar(context);},
                icon: Icon(Icons.arrow_upward_outlined),
              ),
              label: 'Sort'),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Filter(),));},
                icon: Icon(Icons.compare_arrows_outlined),
              ),
              label: 'Filter'),
        ],
      ),
    );
  }
}

void _sortBar(context){
  showModalBottomSheet(context: context, builder:(BuildContext bc){
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('SORT BY'),
          ),
          Divider(),
          TextButton(onPressed: (){Provider.of<SortProvider>(context,listen: false).filter();}, child: Text(textAlign: TextAlign.start,"What's new",style: TextStyle(color: Colors.black),)),
          TextButton(onPressed: (){Provider.of<SortProvider>(context,listen: false).hightolow();}, child: Text(textAlign: TextAlign.start,"Price-high to low",style: TextStyle(color: Colors.black))),
          TextButton(onPressed: (){Provider.of<SortProvider>(context,listen: false).popularity();}, child: Text(textAlign: TextAlign.start,"Popularity",style: TextStyle(color: Colors.black))),
          TextButton(onPressed: (){Provider.of<SortProvider>(context,listen: false).discount();}, child: Text(textAlign: TextAlign.start,"Discount",style: TextStyle(color: Colors.black))),
          TextButton(onPressed: (){Provider.of<SortProvider>(context,listen: false).lowtohigh();}, child: Text(textAlign: TextAlign.start,"Price-low to high",style: TextStyle(color: Colors.black))),
          TextButton(onPressed: (){Provider.of<SortProvider>(context,listen: false).rate();}, child: Text(textAlign: TextAlign.start,"Customer Rating",style: TextStyle(color: Colors.black))),

        ],
      ),
    );
  });
}


