import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SortProvider with ChangeNotifier{
   Stream<QuerySnapshot<Map<String, dynamic>>> fire=FirebaseFirestore.instance.collection("products").snapshots();
   Stream<QuerySnapshot<Map<String, dynamic>>> get getHightolow{
    return fire;

  }
  hightolow() {
    fire=FirebaseFirestore.instance.collection("products").orderBy("realprice",descending: true).snapshots();
    notifyListeners();
  }
  lowtohigh(){
    fire=FirebaseFirestore.instance.collection("products").orderBy("realprice",descending: false).snapshots();
    notifyListeners();
  }
  discount(){
     fire=FirebaseFirestore.instance.collection("products").orderBy("offerpercentage",descending: true).snapshots();
     notifyListeners();
  }
  brand(tmarray){
     print(tmarray);
  fire=FirebaseFirestore.instance.collection("products").where("brand",whereIn:tmarray).snapshots();
  
  notifyListeners();
}
  rate(){
     fire=FirebaseFirestore.instance.collection("products").orderBy("star",descending: true).snapshots();
     notifyListeners();
  }
  popularity(){
     fire=FirebaseFirestore.instance.collection("products").orderBy("people",descending: true).snapshots();
     notifyListeners();
  }
  size(size){
    fire=FirebaseFirestore.instance.collection("products").where("size",whereIn:size).snapshots();
  }
  getsize(int startprice,int finalprice)
  {
    fire=FirebaseFirestore.instance.collection("products").where("offerprice",isGreaterThan: startprice,isLessThan: finalprice).snapshots();

    notifyListeners();
  }

   SizeM(){
     fire=FirebaseFirestore.instance.collection('products').where('size',isEqualTo: 'M').snapshots();
     notifyListeners();
   }
   SizeL(){
     fire=FirebaseFirestore.instance.collection('products').where('brand',isEqualTo:"Roadstar").where('catagory',isEqualTo:"Casual").snapshots();
     notifyListeners();
   }
   SizeS(){
     fire=FirebaseFirestore.instance.collection('products').where('size',isEqualTo: 'S').snapshots();
     notifyListeners();
   }
   brandRoadstar(){
     fire=FirebaseFirestore.instance.collection('products').where('brand',isEqualTo:"Roadstar").snapshots();
     catagoryCasual(){
       fire=FirebaseFirestore.instance.collection('products').where('brand',isEqualTo:"Roadstar").where('catagory',isEqualTo:"Casual").snapshots();
     }
   }

   filter(){
     fire=FirebaseFirestore.instance.collection('products').where('offerprice',isGreaterThan:1000).snapshots();
   notifyListeners();
   }
   count(){

   }
}
