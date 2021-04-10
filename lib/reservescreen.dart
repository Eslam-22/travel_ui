import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/detailsscreen.dart';
import 'package:travel_ui/models/activity.dart';
import 'package:travel_ui/payment.dart';
import 'models/distnation.dart';
import 'models/locationmap.dart';
class ReserveScreen extends StatefulWidget {
  @override
  _ReserveScreenState createState() => _ReserveScreenState();
  final Activity reservescreen;
  ReserveScreen({this.reservescreen});
}
class _ReserveScreenState extends State<ReserveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      child: Image(
                        image: AssetImage(widget.reservescreen.imageurl),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
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
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentWay()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'How To Pay',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  wordSpacing: 1.3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: new Tab(
                              icon: new Image.asset('assets/images/pay.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 270,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LocationMap()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('assets/images/mapp.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
