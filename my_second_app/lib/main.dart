import 'package:flutter/material.dart';
import 'quote.dart';

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
  List<Quote> quotes = [
    Quote('Deepanshu', 'Deepanshu'),
    Quote('Deepanshu', 'Deepanshu'),
    Quote('Deepanshu', 'Deepanshu'),
    Quote('Deepanshu', 'Deepanshu'),
    Quote('Deepanshu', 'Deepanshu'),
  ];

  Widget createQuote(quote){
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            quote.name,
            style: TextStyle(
              color: Colors.grey[850],
              fontSize: 20.0
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            quote.author,
            style: TextStyle(
                color: Colors.grey[850],
                fontSize: 20.0
            ),
          ),
          SizedBox(height: 10.0),
          FlatButton.icon(
            icon : Icon(Icons.delete),
            label: Text('Delete quote'),
            onPressed: () {
              setState(() {
                quotes.remove(quote);
              });
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('My Second App'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: quotes.map((quote) => createQuote(quote)).toList(),
      ),
    );
  }
}

