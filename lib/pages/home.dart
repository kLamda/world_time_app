import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String bgImage;
  Color bgColor;
  Color textColor;
  bool isError;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    isError = data['isError'];
    if (isError == true){
      Navigator.pushReplacementNamed(context, '/error');
    }
    bgImage = data['isDay'] ? 'day.png' : 'night.png';
    bgColor = data['isDay'] ? Colors.deepOrange : Colors.indigo;
    textColor = data['isDay'] ? Colors.black87 : Colors.white;
    iconColor = data['isDay'] ? Colors.black87 : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/$bgImage"),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${data['time']}",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                      color: textColor
                  ),),
                  SizedBox(height: 10,),
                  Text("${data['location']}",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    color: textColor
                  ),),
                  SizedBox(height: 50,),
                  FlatButton.icon(
                      onPressed: () async {
                        await Navigator.pushReplacementNamed(context, '/location', arguments: {
                          'lData' : data['lData']
                        });
                      },
                      icon: Icon(Icons.edit_location, color: iconColor,),
                      label: Text("choose Location", style: TextStyle(color: textColor , fontSize: 20),)),
                ]),
          ),
        ),
      ),
    );
  }
}
