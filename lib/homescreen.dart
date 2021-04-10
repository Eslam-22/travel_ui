import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/detailsscreen.dart';
import 'package:travel_ui/models/hotel.dart';

import 'models/distnation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentstate=0;
  List<IconData> listoficon = [
    Icons.beach_access,
    Icons.airplanemode_active_sharp,
    Icons.roofing_rounded,
    Icons.directions_bike_rounded,
  ];
  int isSelected = 1;
  Widget buildicon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
        print(isSelected);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:
              isSelected == index ? Theme.of(context).accentColor : Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(listoficon[index],
            size: 20,
            color: isSelected == index
                ? Theme.of(context).primaryColor
                : Colors.black26),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).size.height*0.18,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'What would you like to do ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: listoficon
                    .asMap()
                    .entries
                    .map((MapEntry map) => buildicon(map.key))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Destinations',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('eslam');
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,

               itemBuilder: (context,index) {
                  Destination distnation= destinations[index];

                 return GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailes_Screen(
                       destination:distnation,
                     )));
                   },
                   child: Container(
                     margin: EdgeInsets.all(10),
                     width: 200,

                     child: Stack(
                       alignment: Alignment.topCenter,
                       children: [
                         Positioned(
                           bottom:20,
                           child: Container(
                             height: 100,
                             width: 220,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                               color: Colors.white,
                             ),
                             child: Padding(
                               padding:  EdgeInsets.all(10.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('${distnation.activities.length} activities',
                                   textAlign: TextAlign.start,
                                   style: TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.w500,
                                     letterSpacing: 1.0,
                                   ),),
                                   Text(distnation.description,
                                     style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6.0,
                                     offset: Offset(0.0,2.0),
                                    color: Colors.black12,
                                  ),
                                ],
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white70  ,
                              ),
                              child: Stack(
                                children: [
                                  Hero(
                                    tag:distnation.imageUrl,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image(
                                        height: 160,
                                        width: 200,
                                        image: AssetImage(distnation.imageUrl),
                                        fit:BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                      child: Column(
                                    children: [
                                      Text(distnation.city,
                                        style: TextStyle(
                                        fontSize: 20,
                                          color: Colors.white,
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            Text(distnation.country,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),

                                ],
                              ),
                           ),

                       ],
                     ),

                   ),
                 );
              },),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Hotels',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('eslam');
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context,index) {
                  Hotel hote= hotels[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 200,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom:-1,
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text('${hote.name}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.3,
                                          ),),
                                        SizedBox(width: 15,),
                                        Text('${hote.price}/night',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(hote.address,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6.0,
                                offset: Offset(0.0,2.0),
                                color: Colors.black12,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white70  ,
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image(
                                  height: 160,
                                  width: 200,
                                  image: AssetImage(hote.imageUrl),
                                  fit:BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                  );
                },),
            ),
            
         
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentstate,
       onTap:(int value){
          setState(() {
      currentstate=value;
          });
       },
       items: [
         BottomNavigationBarItem(
           icon: Icon(
             Icons.search,
             size: 20,
           ),
           title: SizedBox.shrink(),


         ),
         BottomNavigationBarItem(
           icon: Icon(
             Icons.beach_access,
             size: 20,
           ),
           title: SizedBox.shrink(),
         ),
         BottomNavigationBarItem(
           icon:CircleAvatar(
             child: ClipRRect(
               borderRadius: BorderRadius.circular(50),
               child: Image
                 (image:AssetImage('assets/images/islam.jpg')),
             ),
           ),
           title: SizedBox.shrink(),
         ),

       ],

      ),
    );
  }
}
