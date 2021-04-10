import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/customtextfield.dart';

import 'models/extraawidget.dart';

class PaymentWay extends StatefulWidget {
  @override
  _PaymentWayState createState() => _PaymentWayState();
}

class _PaymentWayState extends State<PaymentWay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'your payment will be',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, wordSpacing: 1.3),
          ),
          bottom: TabBar(
            tabs: [
              Text('Electronic',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.3)),
              Text('In Cash',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.3)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Electronic(),
            InCash(),
          ],
        ),
      ),
    );
  }
}

class Electronic extends StatefulWidget {
  @override
  _ElectronicState createState() => _ElectronicState();
}

class _ElectronicState extends State<Electronic> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      width: 300,
                      image: AssetImage('assets/images/paymentway.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                'Master card Number',
                Icons.money,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                'Renter card Number',
                Icons.money,
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor),
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InCash extends StatefulWidget {
  @override
  _InCashState createState() => _InCashState();
}

class _InCashState extends State<InCash> {
  String valuechoose;
  List listitems = [
    'Egyption',
    'Algerian',
    'American',
    'Argentine',
    'Australian',
    'Cameroonian',
    'Dutch',
    'French'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'TO PAY In Cash you need to Submit your data here',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 20,
                      wordSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              CustomTextField(
                'First Name',
                Icons.person,
              ),
              CustomTextField(
                'Last Name',
                Icons.person,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: DropdownButton(
                      hint: Text('Nationality'),
                      iconSize: 40,
                      value: valuechoose,
                      style: new TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      onChanged: (newValue) {
                        setState(() {
                          valuechoose = newValue;
                        });
                      },
                      items: listitems.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList(),
                    ),
                  ),
                ),
              ),
              CustomTextField(
                'National ID',
                Icons.content_paste_sharp,
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor),
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
