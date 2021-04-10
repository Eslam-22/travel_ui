import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_ui/detailsscreen.dart';
import 'package:travel_ui/models/distnation.dart';
import 'package:travel_ui/models/hotel.dart';
import 'package:travel_ui/reservescreen.dart';

import 'models/activity.dart';

class Detailes_Screen extends StatefulWidget {
  @override
  _Detailes_ScreenState createState() => _Detailes_ScreenState();
  final Destination destination;
  Detailes_Screen({this.destination});
}

class _Detailes_ScreenState extends State<Detailes_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.0,
                      offset: Offset(0.0, 2.0),
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(Icons.menu),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 10),
                        child: Text(
                          widget.destination.city,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              widget.destination.country,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 0,
                right: 20,
                child: IconButton(
                    icon: Icon(Icons.local_bar_outlined),
                    iconSize: 35,
                    color: Colors.white,
                    onPressed: () {}),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: widget.destination.activities.length,
                itemBuilder: (context, index) {
                  Activity activity = widget.destination.activities[index];
                  Activity activity1= activities[index];
                  return Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              offset: Offset(0.0, 2.0),
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(
                              top: 10, left: 150, bottom: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:15.0),
                                      child: Container(
                                        width: 120,
                                        child: Text(
                                          activity.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '\$${activity.price}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),

                              Center(
                                child: Text(
                                  activity.type,
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                child: RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( left :15.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Theme.of(context).accentColor),
                                      child: Text(
                                        activity.starttime[0],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: 70,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Theme.of(context).accentColor),
                                      child: Text(
                                        activity.starttime[1],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(

                        left:20,
                        bottom:15,
                        top:15,
                        child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReserveScreen(
                             reservescreen:activity,
                          )));
                  },
                          child: Hero(
                              tag : activity1.imageurl,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                width:120,
                                image: AssetImage(activity.imageurl),
                                fit:BoxFit.cover,
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
