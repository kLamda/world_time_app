import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeData{
  String url;
  String time;
  String location;
  bool isDay;

  WorldTimeData({this.url, this.location});

  Future<void> timeData() async {
    try {
      Response response =
      await get("https://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      String offset_hour = data['utc_offset'].substring(1, 3);
      String offset_minute = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(data['datetime']);
      now = now.add(Duration(hours: int.parse(offset_hour), minutes: int.parse(offset_minute)));
      time = DateFormat.jm().format(now);
      isDay = now.hour >= 6 && now.hour < 18 ? true : false;
    }
    catch(e){
      print("Error exception is $e");
    }
  }
}

class LocationData{
  List lData;

  Future<void> locationData() async{
    try{
      Response locationData = await get("https://worldtimeapi.org/api/timezone");
      lData = json.decode(locationData.body);
    }
    catch(e){
      print("Error in locationData $e");
    }
  }
}