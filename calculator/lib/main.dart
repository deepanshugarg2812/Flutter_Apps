import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  void ButtonText(String s){
    if(s=="clear"){
      setState(() {
        num1 = 0;
        num2 = 0;
        output = "0";
      });
    }
    else if(s=="Ans"){
      num2 = int.parse(output);
      if(operand=="+")
        output = (num1 + num2).toString();
      if(operand=="-")
        output = (num1 - num2).toString();
      if(operand=="*")
        output = (num1 * num2).toString();
      if(operand=="/")
        output = (num1 / num2).toString();
      setState(() {
        output;
      });
    }
    else{
      setState(() {
        output += s;
      });
    }
  }

  Widget getButton(String s,int val){
    return Expanded(
      flex : val,
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () => ButtonText(s),
        child: Text(s,style: TextStyle(fontSize: 18.0),),
        color: Colors.grey,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                child : Text(output,style: TextStyle(color: Colors.white,fontSize: 48.0),)
            ),
            Expanded(child: Divider()),
            Row(
              children: [
                getButton("1",1),
                getButton("2",1),
                getButton("3",1),
                Expanded(
                  flex : 1,
                  child: OutlineButton.icon(
                    padding: EdgeInsets.all(24.0),
                    icon: Icon(Icons.add,color: Colors.white,),
                    label: Text('Add',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      setState(() {
                        num1 = int.parse(output);
                        output = "0";
                        operand = "+";
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                getButton("4",1),
                getButton("5",1),
                getButton("6",1),
                Expanded(
                  flex : 1,
                  child: OutlineButton.icon(
                      padding: EdgeInsets.all(24.0),
                      icon: Icon(Icons.remove,color: Colors.white,),
                      label: Text('Sub',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        setState(() {
                          num1 = int.parse(output);
                          output = "0";
                          operand = "-";
                        });
                      }
                  ),
                )
              ],
            ),
            Row(
              children: [
                getButton("7",1),
                getButton("8",1),
                getButton("9",1),
                Expanded(
                  flex : 1,
                  child: OutlineButton.icon(
                      padding: EdgeInsets.all(24.0),
                      icon: Icon(Icons.star,color: Colors.white,),
                      label: Text('Mul',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        setState(() {
                          num1 = int.parse(output);
                          output = "0";
                          operand = "*";
                        });
                      }
                  ),
                )
              ],
            ),
            Row(
              children: [
                getButton("clear", 1),
                getButton("0", 1),
                getButton("Ans", 1),
                Expanded(
                  flex : 1,
                  child: OutlineButton.icon(
                      padding: EdgeInsets.all(24.0),
                      icon: Icon(Icons.dnd_forwardslash,color: Colors.white,),
                      label: Text('Div',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        setState(() {
                          num1 = int.parse(output);
                          output = "0";
                          operand = "/";
                        });
                      }
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
