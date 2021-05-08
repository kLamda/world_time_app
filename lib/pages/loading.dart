import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    WorldTimeData instance = WorldTimeData(url:'Asia/Kolkata', location: "Kolkata");
    await instance.timeData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'isDay' : instance.isDay
    });
  }
  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: SpinKitCubeGrid(color: Colors.white, size: 75,)),
    );
  }
}

class LoadingLocation extends StatefulWidget {
  @override
  _LoadingLocationState createState() => _LoadingLocationState();
}

class _LoadingLocationState extends State<LoadingLocation> {

  void getLocations() async{
    LocationData random = LocationData();
    await random.locationData();
    Navigator.pushReplacementNamed(context, '/location', arguments: {
      'lData' : random.lData
    });
  }

  @override
  void initState() {
    super.initState();
    getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: SpinKitFoldingCube(color: Colors.white, size: 75,)),
    );
  }
}

