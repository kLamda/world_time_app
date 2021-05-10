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

### Installation

For installing flutter to your operating system, follow the [installation](https://flutter.dev/docs/get-started/install/windows) procedure.

## Walking through the code

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

### Folder Description

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
