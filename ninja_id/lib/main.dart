import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home : Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja Id Card'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Container(
    child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
             child :  CircleAvatar(
                backgroundImage : NetworkImage('data:image/jpeg;base64,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'),
               radius: 40,
              )
            ),
            Divider(height: 100,color: Colors.white,),
            Text(
              'Name',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                letterSpacing: 2.0
              )
            ),
            SizedBox(height: 8.0),
            Text(
              'Deepanshu',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.amber,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 15.0),
            Text(
                'Current Ninja Level',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    letterSpacing: 2.0
                )
            ),
            SizedBox(height: 8.0),
            Text(
              '$count',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.amber,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                    'deepanshu28121999@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )
    ,
    floatingActionButton: FloatingActionButton(
      child: Text('Add'),
      onPressed: () {
        setState(() {
          this.count = this.count + 1;
        });
        },
    ),);
  }
}


