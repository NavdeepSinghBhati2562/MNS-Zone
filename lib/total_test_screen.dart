import 'package:flutter/material.dart';
import 'package:mnszone/question_category_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TotalTestScreen extends StatefulWidget {
  @override
  _TotalTestScreenState createState() => _TotalTestScreenState();
}

class _TotalTestScreenState extends State<TotalTestScreen> {

  List testList;

  getTests(){
    var document = Firestore.instance.collection('test_name').document("ppRQMKqBNKor3Cq3u1uE");
    document.snapshots().listen((snapShot) {
      setState(() {
        testList =  snapShot.data['test_list'];
      });
    });
  }

  showAlertDialog(BuildContext context,int index) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>QuestionCategory(testList[index])));

      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure?"),
      content: Text("Do you want to Start Test.."),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTests();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tests'),
        ),
          body: testList!=null?Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemBuilder: (ctx,index){
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              CircleAvatar(
                                child: Icon(Icons.menu_book_rounded,size: 30,),
                                radius: 30,
                              ),
                              Text(testList[index],style: TextStyle(fontSize: 26,fontFamily: "Lexend"),
                              ),
                              Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                            ],
                          ),
                        onPressed: (){
                          showAlertDialog(context,index);
                        },
                        // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>QuestionCategory(testList[index]))),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,)

                  ],
                );
              },
              itemCount: testList.length,
            ),
          ):Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
