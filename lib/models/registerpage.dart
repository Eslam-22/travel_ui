import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/customtextfield.dart';
import 'package:travel_ui/homescreen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    File _image;
    Future getimage() async {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Center(
            child: _image == null ?Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Upload Image',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ) : Image.file(_image)

          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: IconButton(icon: Icon(Icons.camera_alt_outlined,
             color: Colors.blue,size: 50, ),
                onPressed: getimage,
              ),
            ),
          ),
          CustomTextField('First Name', Icons.person),
          CustomTextField('Last Name', Icons.person),
          CustomTextField('National Id', Icons.visibility),
          CustomTextField('Passport', Icons.visibility),
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
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (contet)=>HomeScreen()));
            },
            child: Container(
              height: 50,
              width: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white60),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color:Colors.black
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
