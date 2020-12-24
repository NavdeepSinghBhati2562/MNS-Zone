import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mnszone/widgets/radio_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesQuiz extends StatefulWidget {
  final String title;
  final testName;
  var list;
  var resultList;
  CoursesQuiz({this.title,this.testName,this.list,this.resultList});
  @override
  _CoursesQuizState createState() => _CoursesQuizState();
}

class _CoursesQuizState extends State<CoursesQuiz> {
  // List<dynamic> list ;
  // List<dynamic> resultList = [];
  //
  //
  // String cat;
  //
  // fetchData(){
  //   getEmail();
  //
  //   if(widget.title=='Biology')
  //     cat = 'biology';
  //   if(widget.title=='General English')
  //     cat = 'english';
  //   if(widget.title=='Physics')
  //     cat = 'physics';
  //   if(widget.title=='Chemistry')
  //     cat = 'chemistry';
  //   if(widget.title=='General Intelligence')
  //     cat = 'gk';
  //
  //   var getCheck = Firestore.instance.collection(widget.testName).document('results');
  //   getCheck.snapshots().listen((snapShot) {
  //     setState(() {
  //       // check =  snapShot.data[email][cat];
  //       // print("CHECK"+check.toString());
  //     });
  //   });
  //
  //   var document = Firestore.instance.collection(widget.testName).document(cat);
  //   document.snapshots().listen((snapShot) {
  //     setState(() {
  //       list =  snapShot.data['question_list'];
  //       if(list!=null){
  //         for(int i =0;i<list.length;i++) {
  //           resultList.insert(i,{'question': list[i]['question'],'answer':0});
  //         }
  //       }
  //     });
  //   });
  // }
  //
  // getEmail()async{
  //   SharedPreferences prefs =await SharedPreferences.getInstance();
  //   email =  prefs.getString('email');
  // }
  //
  // String email;

  // submitExam()async{
  //   getEmail();
  //   await Firestore.instance.collection(widget.testName).document("results").setData(
  //       {
  //         // "email":email,
  //         email:{
  //           cat:resultList
  //         }
  //       },merge: true
  //   );
  // }

  int _qIndex =0;
  int gValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData();
  }


  Future<bool> onSubmit() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to Submit your Exam?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () async {
              // await submitExam();
              // Navigator.of(context).pop(false);
            Navigator.of(context).pop(false);
            },
            /*Navigator.of(context).pop(true)*/
            child: Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }




  @override
  Widget build(BuildContext context) {
    print(widget.list.toString());
    print(widget.resultList.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: widget.list==null?Center(child: CircularProgressIndicator()):
        // check!=null?
        // Container(child: Text('Thank You'),):
          Container(
          height: MediaQuery.of(context).size.height *0.9,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                          child: Text('Q${_qIndex+1}. '+widget.list[_qIndex]['question'],style: TextStyle(fontFamily: 'Lexend',fontSize: 26,color: Colors.blueGrey[800],),)),
                      RadioButtonWidget(list: widget.list,i: _qIndex,result: widget.resultList,),
                      Divider(thickness: 1,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ListView.builder(itemBuilder: (ctx,i){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              child: Text("${i+1}",style: TextStyle(fontSize: 20,color: Colors.white),),
                              onPressed: (){
                                setState(() {
                                  _qIndex = i;
                                });
                              },
                              color: Colors.redAccent,
                            ),
                          );
                        },
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.list.length,
                        ),
                      ),
                      Divider(thickness: 1,),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                              onPressed: _qIndex>0?(){
                                setState(() {
                                  _qIndex = _qIndex - 1;
                                });
                              }:null,
                            child: Icon(Icons.keyboard_arrow_left,color: Colors.white,),
                            color: Colors.cyan,

                          ),
                          // RaisedButton(
                          //   onPressed: onSubmit,
                          //   child: Text('SUBMIT',),
                          //   color: Colors.greenAccent,
                          //
                          // ),
                          RaisedButton(onPressed: _qIndex<widget.list.length-1?(){
                            setState(() {
                              _qIndex = _qIndex + 1;
                            });
                          }:null,
                            child: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                            color: Colors.cyan,
      )
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  )

                ] ,
              ),
            ),
          )
        ),
      ),
    );
  }
}

