
import 'package:flutter/material.dart';
import 'package:travel_ui/customtextfield.dart';
import 'package:travel_ui/homescreen.dart';
import 'package:travel_ui/models/registerpage.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [

       Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 40),
             child: Image(
               image: AssetImage('assets/images/beach.png'),
             ),
           ),

           SizedBox(height: 10,),
           CustomTextField('User Name', Icons.person),
           SizedBox(height: 10,),
           CustomTextField('Password', Icons.visibility),
           SizedBox(height: 10,),
           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
             },
             child: Container(
               height: 50,
               width: 230,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   color: Theme.of(context).accentColor),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                   'Login',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: 20,),
           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (contet)=>RegisterPage()));
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
                   'Resgister',
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
        ],
      ),
    );
  }
}

