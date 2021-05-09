import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Unable to Connect", style: TextStyle(fontSize: 20),),
            // FlatButton.icon(onPressed: (){
            //   Navigator.pop(context);
            // }, icon: Icon(Icons.close), label: Text("Close"),)
          ],
        ),
      ),
    );
  }
}
