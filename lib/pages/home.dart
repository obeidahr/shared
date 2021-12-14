import 'package:flutter/material.dart';
import 'package:shared/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences prefs;
  int color = Colors.white.value;
   getData()async{
    prefs =await SharedPreferences.getInstance();
    setState(() {
          color = prefs.getInt('favC') ?? Colors.white.value;
    });
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Color(color),
      appBar: AppBar(
        backgroundColor: Color(color),
        title: Text('sharedPreferences'),
        actions: [
          IconButton(icon: Icon(Icons.settings),
           onPressed:(){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Settings()),);//on the fly route
          })
        ],
      ),
      body: null,
    );
  }
}