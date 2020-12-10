

import 'package:flutter/material.dart';
import 'package:world_time_api/pages/world_time.dart';

class Location  extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Accra', location: 'Ghana', flag: 'ghana.gif'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.gif'),
    WorldTime(url: 'Europe/Amsterdam', location: 'Netherlands', flag: 'nertherlands.gif'),
    WorldTime(url: 'Europe/Paris', location: 'France', flag: 'france.gif'),
    WorldTime(url: 'Europe/Rome', location: 'Italy', flag: 'italy.gif'),
    WorldTime(url: 'Europe/Prague', location: 'Czech Republic', flag: 'czech.gif'),
    WorldTime(url: 'Europe/Zurich', location: 'Switzerland', flag: 'switzerland.gif'),
    WorldTime(url: 'Europe/Lisbon', location: 'Portugal', flag: 'portugal.gif'),

  ];


  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDaytime': instance.isDaytime
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Choose Location'),
        elevation: 0,
        centerTitle: true,
      ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            );
            
          }
      )
    );
  }
}
