import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:task_sunrun/Provider/Provider.dart';

class FilterBody extends StatefulWidget {
  const FilterBody({Key? key}) : super(key: key);

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context)
  {
    Stream<QuerySnapshot<Map<String, dynamic>>> fire=Provider.of<SortProvider>(context,listen: false).fire;

    return Scaffold(appBar: AppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textAlign: TextAlign.start,
            'FILTER SCREEN',

            style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
          ),
          Text('Products',textAlign: TextAlign.start,style: TextStyle(color: Colors.grey,fontSize: 12),)
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
    body: StreamBuilder(
        stream: fire,
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            int s = snapshot.data?.docs.length as int;
            return StaggeredGridView.countBuilder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              crossAxisCount: 4,
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              itemBuilder: (BuildContext, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 300,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                snapshot.data!.docs[index]['image']),
                          ),
                        ),
                        Positioned(
                            left: 8,
                            top: 270,
                            child: Container(height: 20,
                              decoration: BoxDecoration(color: Colors.white70,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 75,
                              child: Row(
                                children: [SizedBox(width: 5,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        4.0, 4.0, 0, 4.0),
                                    child: Text(
                                      snapshot.data!.docs[index]['star']
                                          .toString(), style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5, 0, 2),
                                    child: Icon(Icons.star, color: Colors.green,
                                      size: 9,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 4, 0, 4),
                                    child: VerticalDivider(),

                                  ),
                                  Text(snapshot.data!.docs[index]['people']
                                      .toString(), style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ))
                      ],
                    ),
                    Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    snapshot.data?.docs[index]['brand'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data?.docs[index]['catagory'],
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '???' +
                                      snapshot.data!.docs[index]['realprice']
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '???' +
                                      snapshot.data!.docs[index]['offerprice']
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['offerpercentage']
                                      .toString() +
                                      '% OFF',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(255, 144, 90, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    )
                  ],
                );
              },
            );
          }
        }),
    );
  }
}
