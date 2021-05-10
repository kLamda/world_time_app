# world_time_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Installation

For installing flutter to your operating system, follow the [installation](https://flutter.dev/docs/get-started/install/windows) procedure.

# Walking through the code

Open VS code and in the terminal run the following command to create a flutter application.
```dart
flutter create <name_of_application(in_lower_case)>
```
After the flutter applciation is created the folder structure should look like something below.

    world_time_app
    ├── .dart_tool
    |   └── ...
    ├── .idea
    |   └── ...
    ├── android
    |   └── ...                    
    ├── build     
    |   └── ...
    ├── ios    
    |   └── ...
    ├── lib     
    |   └── main.dart
    ├── test     
    |   └── ...
    ├── web     
    |   └── ...
    ├── .gitignore
    ├── .metadata  
    ├── .packages
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── Readme.md  
    └── world_time_app.iml

## Folder/File Description

1. **.idea:** This folder is at the very top of the project structure, which holds the configuration for Android Studio.

2. **android:** This folder holds a complete Android project and used when you build the Flutter application for Android. When the Flutter code is compiled into the native code, it will get injected into this Android project, so that the result is a native Android application.

3. **ios:** This folder holds a complete Mac project and used when you build the Flutter application for iOS. It is similar to the android folder that is used when developing an app for Android. When the Flutter code is compiled into the native code, it will get injected into this iOS project, so that the result is a native iOS application.

4. **lib:** It is an essential folder, which stands for the library. It is a folder where we will do our 99 percent of project work. Inside the lib folder, we will find the Dart files which contain the code of our Flutter application. By default, this folder contains the file main.dart, which is the entry file of the Flutter application.

5. **test:** This folder contains a Dart code, which is written for the Flutter application to perform the automated test when building the app. It won't be too important for us here.

6. **.gitignore:** It is a text file containing a list of files, file extensions, and folders that tells Git which files should be ignored in a project. Git is a version-control file for tracking changes in source code during software development Git.

7. **.metadata:** It is an auto-generated file by the flutter tools, which is used to track the properties of the Flutter project. This file performs the internal tasks, so you do not need to edit the content manually at any time.

8. **.packages:** It is an auto-generated file by the Flutter SDK, which is used to contain a list of dependencies for your Flutter project.

9. **pubspec.yaml:** It is the project's configuration file that will use a lot during working with the Flutter project. It allows you how your application works. This file contains:

    * Project general settings such as name, description, and version of the project.
    * Project dependencies.
    * Project assets (e.g., images).

10. **pubspec.lock:** It is an auto-generated file based on the .yaml file. It holds more detail setup about all dependencies.

11. **README.md:** It is an auto-generated file that holds information about the project. We can edit this file if we want to share information with the developers.

12. **world_time_app.iml:**  It is always named according to the Flutter project's name that contains additional settings of the project. This file performs the internal tasks, which is managed by the Flutter SDK, so you do not need to edit the content manually at any time.

>The test folder can be deleted from the project directory, since its of no use for now.

In our application we shall be having the following :
* Four widgets
    * Initial Loading Page [ Will show when data is fetched from API ]
    * Home Page [ Will display the response from API ]
    * Select Location [ Will display a list view of all the timezones ]
    * Error [ This widget shall pop when any kind of exception/error/network connection issue occured]
* One Service 
    * Will be having the functions for request and response handling from worldtime API

Create a two directories inside `lib` folder, namely
* pages
* services

Inside `services` directory create a folder namely `services.dart` .

This file shall be dealing with request and response handling from the worldtimeapi.

## [`world_time_app/lib/services/services.dart`](https://github.com/krishnamecho/world_time_app/blob/master/lib/services/services.dart)

## Adding the dependencies

In the `services.dart` file we shall be requiring `http` and `intl` for request/response and datetime format functions respectively.

And, since these dependencies are not by deafult included while creating the project we need to add the dependencies manually.

Get the latest version of [http](https://pub.dev/packages/http/install) and [intl](https://pub.dev/packages/intl/install) and add to `pubspec.yaml` file. After adding the dependencies the file should look as below.

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
  intl: ^0.17.0
```
If the dart plugin is already installed in VScode it would automatically run the ```flutter pub get``` code else manually run the code in the terminal to install the packages.

## Import dependencies

```dart
import 'package:http/http.dart'; //deals with request/response functions
import 'dart:convert'; 
import 'package:intl/intl.dart';
```

## WorldTimeData Class

```dart

class WorldTimeData{
  String url;
  String time;
  String location;
  bool isDay;
  bool isError;

  WorldTimeData({this.url, this.location});

  Future<void> timeData() async {
    try {
      var url_time = Uri.https("worldtimeapi.org", "/api/timezone/$url");
      Response response =
      await get(url_time);
      Map data = jsonDecode(response.body);
      String offset_hour = data['utc_offset'].substring(1, 3);
      String offset_minute = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(data['datetime']);
      now = now.add(Duration(hours: int.parse(offset_hour), minutes: int.parse(offset_minute)));
      time = DateFormat.jm().format(now);
      isDay = now.hour >= 6 && now.hour < 18 ? true : false;
    }
    catch(e){
      isError = true;
      print("Error in loading $e");
    }
  }
}
```

In the above code snipped a WorldTimeData class is created and the variables are defined. The class has a constructor to enable it have parameters. The class has an asynchronous function ```timeData()``` which has been enabled with ```try cath``` functionality. If any exception occurs then isError variable is assigned true so that the error widget would pe pushed.

In the ```try{}``` segment a https request is made to worldtimeapi and the response is recorded ```response``` variable.

### About the https request

The documentation for Uri.https is in [here](https://api.flutter.dev/flutter/dart-core/Uri/Uri.https.html). It's preferred to use Uri.https rather than Uri.http since it connetion is secure and the debugger won't raise issues regarding insecure connection.

Lets say one want to make a https request to http://worldtimeapi.org/api/timezone/Africa/Abidjan. The code would be as below

```dart
Uri.https("worldtimeapi.org", "/api/timezone/Africa/Abidjan")
```
Since the function of asynchronous, the ```await``` keyword ensures that the programs waits for the response from the API and then the further lines are executed.

```dart
class LocationData{
  List lData;
  bool isError;

  Future<void> locationData() async{
    try{
      var url_timezone = Uri.https("worldtimeapi.org", "/api/timezone");
      Response locationData = await get(url_timezone);
      lData = json.decode(locationData.body);
    }
    catch(e){
      print("Error in locationData $e");
      isError = true;
    }
  }
}
```

Inside the `pages` direcotry create 4 dart files namely,
* error.dart
* home.dart
* loading .dart
* location.dart

Inside the lib folder, open the main.dart file in the editor. By default, it consists of some code. Delete everything present in main.dart and write the following code.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home: Home()
      )
  );
}
```
