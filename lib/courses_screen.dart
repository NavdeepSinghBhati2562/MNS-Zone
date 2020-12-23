import 'package:flutter/material.dart';
import 'package:mnszone/courses_quiz_screen.dart';
import 'package:mnszone/question_category_screen.dart';
import 'package:mnszone/total_test_screen.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: ()=>Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TotalTestScreen()),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          margin: const EdgeInsets.all(8),
          child: Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                      child: Image.asset('assets/mnsofficer.jpg')
                  ),
                  Expanded(
                    flex:1 ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('MNS ZONE ONLINE COURSE SERIES',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text('₹ 750',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold
                           ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
