import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mnszone/courses_quiz_screen.dart';
import 'package:mnszone/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class QuestionCategory extends StatefulWidget {
  final testName;
  QuestionCategory(this.testName);

  @override
  _QuestionCategoryState createState() => _QuestionCategoryState();
}

class _QuestionCategoryState extends State<QuestionCategory> {
  CountDownController _controller = CountDownController();
  bool _isPause = false;

  List<dynamic> englishList ;
  List<dynamic> englishResultList = [];

  List<dynamic> bioList ;
  List<dynamic> bioResultList = [];

  List<dynamic> physicsList ;
  List<dynamic> physicsResultList = [];

  List<dynamic> chemistryList ;
  List<dynamic> chemistryResultList = [];

  List<dynamic> gkList ;
  List<dynamic> gkResultList = [];

  fetchData(){
    getEmail();

    var englishDocument = Firestore.instance.collection(widget.testName).document('english');
    englishDocument.snapshots().listen((snapShot) {
      setState(() {
        englishList =  snapShot.data['question_list'];
        if(englishList!=null){
          for(int i =0;i<englishList.length;i++) {
            englishResultList.insert(i,{'question': englishList[i]['question'],'answer':0});
          }
        }
      });
    });

    var bioDocument = Firestore.instance.collection(widget.testName).document('biology');
    bioDocument.snapshots().listen((snapShot) {
      setState(() {
        bioList =  snapShot.data['question_list'];
        if(bioList!=null){
          for(int i =0;i<bioList.length;i++) {
            bioResultList.insert(i,{'question': bioList[i]['question'],'answer':0});
          }
        }
      });
    });

    var physicsDocument = Firestore.instance.collection(widget.testName).document('physics');
    physicsDocument.snapshots().listen((snapShot) {
      setState(() {
        physicsList =  snapShot.data['question_list'];
        if(physicsList!=null){
          for(int i =0;i<physicsList.length;i++) {
            physicsResultList.insert(i,{'question': physicsList[i]['question'],'answer':0});
          }
        }
      });
    });

    var chemistryDocument = Firestore.instance.collection(widget.testName).document('chemistry');
    chemistryDocument.snapshots().listen((snapShot) {
      setState(() {
        chemistryList =  snapShot.data['question_list'];
        if(chemistryList!=null){
          for(int i =0;i<chemistryList.length;i++) {
            chemistryResultList.insert(i,{'question': chemistryList[i]['question'],'answer':0});
          }
        }
      });
    });

    var gkDocument = Firestore.instance.collection(widget.testName).document('gk');
    gkDocument.snapshots().listen((snapShot) {
      setState(() {
        gkList =  snapShot.data['question_list'];
        if(gkList!=null){
          for(int i =0;i<gkList.length;i++) {
            gkResultList.insert(i,{'question': gkList[i]['question'],'answer':0});
            print(gkResultList.toString());
          }
        }
      });
    });
  }

  getEmail()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    email =  prefs.getString('email');
  }

  String email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  void dispose() {
    super.dispose();
  }
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to go Back? \n\nYor progress will lost..'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: (){Navigator.of(context).pop(false);
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Select Category'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesQuiz(title: "General Intelligence",testName: widget.testName,list: englishList,resultList: englishResultList,)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("General English",style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_sharp,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesQuiz(title: "Biology",testName: widget.testName,list: bioList,resultList: bioResultList,)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Biology",style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_sharp,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesQuiz(title: "Physics",testName: widget.testName,list: physicsList,resultList: physicsResultList,)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Physics",style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_sharp,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesQuiz(title: "Chemistry",testName: widget.testName,list: chemistryList,resultList: chemistryResultList,)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Chemistry",style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_sharp,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesQuiz(title: "General Intelligence",testName: widget.testName,list: gkList,resultList: gkResultList,)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("General Intelligence",style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_sharp,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  CircularCountDownTimer(
                    // Countdown duration in Seconds
                    duration: 2700,

                    // Controller to control (i.e Pause, Resume, Restart) the Countdown
                    controller: _controller,

                    // Width of the Countdown Widget
                    width: MediaQuery.of(context).size.width / 3,

                    // Height of the Countdown Widget
                    height: MediaQuery.of(context).size.height / 5,

                    // Default Color for Countdown Timer
                    color: Colors.white,

                    // Filling Color for Countdown Timer
                    fillColor: Colors.red,

                    // Background Color for Countdown Widget
                    backgroundColor: null,

                    // Border Thickness of the Countdown Circle
                    strokeWidth: 5.0,

                    // Begin and end contours with a flat edge and no extension
                    strokeCap: StrokeCap.butt,

                    // Text Style for Countdown Text
                    textStyle: TextStyle(
                        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),

                    // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                    isReverse: true,

                    // true for reverse animation, false for forward animation
                    isReverseAnimation: false,

                    // Optional [bool] to hide the [Text] in this widget.
                    isTimerTextShown: true,

                    // Function which will execute when the Countdown Ends
                    onComplete: () {
                      // Here, do whatever you want
                      print('Countdown Ended');
                    },
                  ),
                  SizedBox(height: 20,),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.blue[600],
                    child: Text('Submit',style: TextStyle(color: Colors.white),),
                    onPressed: (){},
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultScreen(title: "Result",testName: widget.testName)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Result"),
                            Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
