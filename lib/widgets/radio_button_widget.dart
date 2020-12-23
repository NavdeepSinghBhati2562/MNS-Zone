import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  final list;
  final i;
  final result;
  RadioButtonWidget({this.list,this.i,this.result});
  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int gValue;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return widget.result.isEmpty?CircularProgressIndicator():Container(
      color:Colors.grey[200],
      child:Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            color: Colors.white,
            child: RadioListTile(
              onChanged: (val){
                setState(() {
                  gValue = val;
                  widget.result[widget.i]['answer'] = val;
                });
              },
              groupValue: widget.result[widget.i]['answer'],
              // groupValue: gValue==null?widget.result[widget.i]['answer']:gValue,
              value: 1,
              title: Text(widget.list[widget.i]['options'][0],style: TextStyle(fontFamily: 'Lexend',fontSize: 18)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            color: Colors.white,
            child: RadioListTile(
              onChanged: (val){
                setState(() {
                  print(widget.result[widget.i]['answer'].runtimeType);
                  print(val.runtimeType);
                  gValue = val;
                  widget.result[widget.i]['answer'] = val;

                });
              },
              groupValue: widget.result[widget.i]['answer'],
              value: 2,
              title: Text(widget.list[widget.i]['options'][1],style: TextStyle(fontFamily: 'Lexend',fontSize: 18)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            color: Colors.white,
            child: RadioListTile(
              onChanged: (val){
                setState(() {
                  gValue = val;
                  widget.result[widget.i]['answer'] = val;
                });
              },
              groupValue: widget.result[widget.i]['answer'],
              value: 3,
              title: Text(widget.list[widget.i]['options'][2],style: TextStyle(fontFamily: 'Lexend',fontSize: 18)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            color: Colors.white,
            child: RadioListTile(
              onChanged: (val){
                setState(() {
                  gValue = val;
                  widget.result[widget.i]['answer'] = val;

                });
              },
              groupValue: widget.result[widget.i]['answer'],
              value: 4,
              title: Text(widget.list[widget.i]['options'][3],style: TextStyle(fontFamily: 'Lexend',fontSize: 18)),
            ),
          ),
          // RaisedButton(onPressed: (){
          //   setState(() {
          //     saved = !saved;
          //   });
          // },child: saved?Text('Remove'):Text('Mark for Later'),)
        ],
      ),
    );
  }
}
