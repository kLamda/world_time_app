import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_data.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List location_data;

  void updateTime(index) async {
    WorldTimeData instance = WorldTimeData(url: location_data[index], location: location_data[index].split('/').last);
    await instance.timeData();
    Navigator.popAndPushNamed(context, '/home',  arguments: {
      'isError' : instance.isError,
      'time': instance.time,
      'location': instance.location,
      'isDay' : instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {

    Map rData = ModalRoute.of(context).settings.arguments;
    location_data = rData['lData'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
      ),
      body: ListView.builder(
        itemCount: location_data.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(top: 1, bottom: 1),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Padding(padding: EdgeInsets.symmetric(vertical: 10),child: Center(child: Text(location_data[index].replaceAll('/', ' - ')))),
              ),
            ),
          );
        },
      ),
    );
  }
}

