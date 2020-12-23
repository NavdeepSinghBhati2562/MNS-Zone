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
            child: ListView.builder(
              itemBuilder: (ctx,index){
                return Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                      child: Text(testList[index],style: TextStyle(fontSize: 18),
                      ),
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>QuestionCategory(testList[index]))),
                  ),
                );
              },
              itemCount: testList.length,
            ),
          ):Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
