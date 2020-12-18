import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:covid_19_ui/Data/data.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  String country = "In";
  List<String> countries = ['USA','UK','IN','CN','FR','IT'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 28.0,
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {},iconSize: 28.0,)
        ],
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildWidget(),
          _buildWidgetSecond(screenHeight),
          _buildYourOwnTest(screenHeight)
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildWidget(){
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.purple[900],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children : [
              Text('Covid-19',style: TextStyle(color: Colors.white,fontSize: 29.0,fontWeight: FontWeight.bold)),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 29.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text('DropDown'),
              )
              ],
            ),
            SizedBox(height: 30.0,),
            Text('Are you feeling sick?',style: TextStyle(fontSize: 20.0,color: Colors.white),),
            Text('If you feel sick please call us at this number immediately.',style: TextStyle(fontSize: 20.0,color: Colors.white),),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                  onPressed: () {},
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  icon: Icon(Icons.phone,color: Colors.white,),
                  label: Text('Call Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                ),
                FlatButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                  onPressed: () {},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  icon: Icon(Icons.chat_bubble,color: Colors.white,),
                  label: Text('Chat Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                )
              ],
            ),
            SizedBox(height: 30.0,)
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildWidgetSecond(double screenheight){
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prevention Tips',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Column(
                children: <Widget>[
                  Image.asset(
                    e.keys.first,
                    height: screenheight * 0.12,
                  ),
                  SizedBox(height: screenheight * 0.015),
                  Text(
                    e.values.first,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Colors.purple],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Do your own test!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do your own test.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
