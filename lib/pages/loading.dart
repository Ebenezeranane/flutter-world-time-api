import 'package:flutter/material.dart';
import 'package:world_time_api/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void SetupWorldTime() async{
   WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png', url:'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDaytime': instance.isDaytime
    });
  }
  

   @override
  void initState() {
    super.initState();
    SetupWorldTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue,
      body: Center(
          child:SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          )
      )
      );
  }
}
