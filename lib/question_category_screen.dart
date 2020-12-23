import 'package:flutter/material.dart';
import 'package:mnszone/courses_quiz_screen.dart';
class QuestionCategory extends StatelessWidget {
  final testName;
  QuestionCategory(this.testName);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Category'),
        ),
        body: Column(
          children: [
            RaisedButton(
              onPressed: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesQuiz(title: "General Intelligence",testName: testName)),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("General English"),
                    Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesQuiz(title: "Biology",testName: testName)),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Biology"),
                    Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesQuiz(title: "Physics",testName: testName)),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Physics"),
                    Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesQuiz(title: "Chemistry",testName: testName)),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Chemistry"),
                    Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesQuiz(title: "General Intelligence",testName: testName)),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("General Intelligence"),
                    Icon(Icons.arrow_forward_sharp,color: Colors.blue,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
