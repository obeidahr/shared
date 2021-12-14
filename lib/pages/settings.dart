import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int favColor =Colors.white.value;
  SharedPreferences prefs;

  saveData(int color)async{
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('favC',color);
  }
  getData()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
          favColor = prefs.getInt('favC') ?? Colors.white.value;
    });
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Color(favColor),
      appBar: AppBar(title: Text('Settings'),),
      body: Center(
        child:Column(
          children: [
            RadioListTile(
              title: Text('Green'),
              value: Colors.green.value,
              groupValue: favColor,
              onChanged: (int color){
                setState(() {
                   favColor=color;               
                });
                saveData(color);
            }),
            RadioListTile(
              title: Text('orange'),
              value: Colors.orange.value,
              groupValue: favColor,
              onChanged: (int color){
                setState(() {
                   favColor=color;               
                });
                saveData(color);
              }),
              RadioListTile(
              title: Text('blue'),
              value: Colors.blue.value,
              groupValue: favColor,
              onChanged: (int color){
                setState(() {
                   favColor=color;               
                });
                saveData(color);
              })
          ],
        ) ,),
    );
  }
}
