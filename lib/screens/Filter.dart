import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_sunrun/Provider/Provider.dart';
import 'package:task_sunrun/screens/FliterBody.dart';
import 'package:task_sunrun/screens/Body.dart';
import 'package:task_sunrun/screens/MainPage.dart';
class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  PageController page = PageController();

  RangeValues priceRangeValues = RangeValues(0, 1000);

  Map<String, bool> size_values = {
    'S': false,
    'M': false,
    'L': false,
    'XL': false,
  };

  Map<String, bool> brand_values = {
    'Roadstar': false,
    'HERE&NOW': false,
    'JAINISH': false,
    'WYRE': false,
    'Louis Philippe': false,
    'Dennis Lingo': false,
  };
  Map<String, bool> discount_values = {
    '60 % and above': false,
  };

  var tmpArray = [];
  var tmpBrand = [];

  getCheckboxItems() {
    size_values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    print(tmpArray);

   // tmpArray.clear();
  }

  getCheckedBrandItems()
  {
    brand_values.forEach((key, value)
    {
      if (value == true) {
        tmpBrand.add(key);
      }
    });

 print(tmpBrand);


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: [
          TextButton(
              onPressed: () {tmpBrand.clear();},
              child: Text(
                "CLEAR ALL",
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
      body: Stack(
        children:[
        Row(
          children: [
            SizedBox(
              width: 200,
              child: SideMenu(
                controller: page,
                  style: SideMenuStyle(backgroundColor: Colors.grey,toggleColor: Colors.black,
                    unselectedTitleTextStyle: TextStyle(color: Colors.black),
                    // showTooltip: false,
                    displayMode: SideMenuDisplayMode.auto,
                    decoration: BoxDecoration(),
                    openSideMenuWidth: 200,
                    compactSideMenuWidth: 40,
                    hoverColor: Colors.black,
                    selectedColor: Colors.white,
                    selectedIconColor: Colors.grey,
                    unselectedIconColor: Colors.black54,
                    selectedTitleTextStyle: TextStyle(color: Colors.black),

                  ),
                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Size',
                    icon: Icon(
                      Icons.format_size,
                    ),
                    onTap:(){ page.jumpToPage(0);}
                  ),
                  SideMenuItem(
                    priority: 1,
                    onTap: (){page.jumpToPage(1);},
                    title: 'Brand',
                    icon: Icon(Icons.branding_watermark),
                  ),
                  SideMenuItem(
                    priority: 2,
                      onTap: (){page.jumpToPage(2);},
                    title: 'Price Range',
                    icon: Icon(Icons.price_change_outlined),
                  ),
                  SideMenuItem(
                  onTap: (){page.jumpToPage(3);},
                    priority: 3,
                    title: 'Discount',
                    icon: Icon(Icons.discount),
                  )
                ],
              ),
            ),
            Expanded(child: PageView(controller: page,
              children: [
                Container(color: Colors.white,
                child: Column(children: [
                  Expanded(
                    child: ListView(
                      children: size_values.keys.map((String key) {
                        return CheckboxListTile(title: Text(key,style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold ),),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: size_values[key],
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            onChanged: (bool? value)
                            {
                              setState(()
                              {
                                size_values[key] = value!;

                              });
                            });
                      }).toList(),
                    ),
                  ),

                ],),
                ),
                Container(color: Colors.white,
                  child: Column(children: [
                    Expanded(
                      child: ListView(
                        children: brand_values.keys.map((String key) {
                          return CheckboxListTile(title: Text(key,style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold ),),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: brand_values[key],
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              onChanged: (bool? value)
                              {
                                setState(()
                                {
                                  brand_values[key] = value!;

                                });
                              });
                        }).toList(),
                      ),
                    ),

                  ],
                  ),
                ),
                Container(color: Colors.white,
                  child: RangeSlider(
                    values: priceRangeValues,
                    max: 1000,
                    divisions: 5,
                    labels: RangeLabels(
                      priceRangeValues.start.round().toString(),
                      priceRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        Provider.of<SortProvider>(context,listen: false).getsize(priceRangeValues.toString(), priceRangeValues.end.toString());
                      });
                    },
                  )),

                Container(color: Colors.white,
                  child: Column(children: [
                    Expanded(
                      child: ListView(
                        children: discount_values.keys.map((String key) {
                          return CheckboxListTile(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),title: Text(key,style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold ),),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: discount_values[key],
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              onChanged: (bool? value)
                              {
                                setState(()
                                {
                                  discount_values[key] = value!;

                                });
                              });
                        }).toList(),
                      ),
                    ),

                  ],
                  ),
                ),
              ],)
            )
          ],
        ),

        ]
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
           ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  Provider.of<SortProvider>(context,listen: false).fire;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Mens(),));

                },
                child: Text('CLOSE',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: VerticalDivider(),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => FilterBody()));
                  getCheckboxItems();
                  getCheckedBrandItems();
                  print(tmpBrand);
                  Provider.of<SortProvider>(context,listen: false).brand(tmpBrand);
                },
                child: Text('APPLY',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}
