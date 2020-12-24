import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  final String title;
  final testName;
  ResultScreen({this.title,this.testName});
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var resultList;

  getResult()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    var document = Firestore.instance.collection("Test 1").document('results');
    document.snapshots().listen((snapShot) {
      setState(() {
        resultList =  snapShot.data[email];
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    print(resultList);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            child: ListView.builder(
                itemBuilder:(ctx,index){
                  return Column(
                    children: [
                      Text(resultList['gk']),
                      Text(resultList['']),
                      // Text()
                    ],
                  );
                },
              itemCount: 0,
            ),
          )
      ),
    );
  }
}
