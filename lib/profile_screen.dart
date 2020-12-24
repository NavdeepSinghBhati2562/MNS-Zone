import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mnszone/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SharedPreferences prefs;
  String email;
  Timer _timer;
  int _start = 10;


  getUserData()async{
    prefs =await SharedPreferences.getInstance();
    setState(() {
     email =  prefs.getString('email');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: email==null?Center(child: CircularProgressIndicator()):Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                      CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.redAccent,
                        child: Text(email[0].toUpperCase(),style: TextStyle(fontSize: 60,color: Colors.white),),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blueGrey
                          ),
                          child: Text(email,style: TextStyle(fontSize: 16,color: Colors.white))),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,

                        child: RaisedButton(
                          color: Colors.amberAccent,

                          onPressed: (){},
                        //   onPressed: ()=>Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ResultScreen(title: "Result",testName: testName)),
                        // ),
                          child: Text("Results"),),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: RaisedButton(
                            color: Colors.amberAccent,

                            onPressed: ()=>FirebaseAuth.instance.signOut(),child: Text("About Us"),)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: RaisedButton(
                          color: Colors.amberAccent,
                          onPressed: ()=>FirebaseAuth.instance.signOut(),child: Text("Logout"),),
                      ),



                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/telegram.png"),
                      SizedBox(width: 20,),
                      Image.asset("assets/youtube.png"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('Designed and Developed by NSB Creation',style: TextStyle(color: Colors.grey),),
                      ),
                      // Container(
                      //   child: Text('Contact : 7014936552',style: TextStyle(color: Colors.grey),),
                      // ),
                      SizedBox(height: 20,)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
