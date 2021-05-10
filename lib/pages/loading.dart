import 'package:flutter/material.dart';
import 'package:world_time_app/services/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    WorldTimeData instance = WorldTimeData(url:'Asia/Kolkata', location: "Kolkata");
    await instance.timeData();
    LocationData random = LocationData();
    await random.locationData();
    Navigator.popAndPushNamed(context, '/home', arguments: {
      'isError' : instance.isError,
      'time': instance.time,
      'location': instance.location,
      'isDay' : instance.isDay,
      'lData' : random.lData
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

// class LoadingLocation extends StatefulWidget {
//   @override
//   _LoadingLocationState createState() => _LoadingLocationState();
// }

// class _LoadingLocationState extends State<LoadingLocation> {
//
//   void getLocations() async{
//     LocationData random = LocationData();
//     await random.locationData();
//     Navigator.pushReplacementNamed(context, '/location', arguments: {
//       'lData' : random.lData
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getLocations();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//           child: SpinKitFoldingCube(color: Colors.white, size: 75,)),
//     );
//   }
// }

class UpdateTime extends StatefulWidget {
  @override
  _UpdateTimeState createState() => _UpdateTimeState();
}

class _UpdateTimeState extends State<UpdateTime> {

  void updateLocationTime(instance) async {
    await instance.timeData();
    LocationData random = LocationData();
    await random.locationData();
    Navigator.popAndPushNamed(context, '/home', arguments: {
      'isError' : instance.isError,
      'time': instance.time,
      'location': instance.location,
      'isDay' : instance.isDay,
      'lData' : random.lData
    });
  }
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    WorldTimeData instance = data['instance'];
    updateLocationTime(instance);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: SpinKitFoldingCube(color: Colors.white, size: 75,)),
    );
  }
}


