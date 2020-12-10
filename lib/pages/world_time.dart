import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';



class WorldTime{
  String time; //time in that location
  String flag; // url to an asset to the flag icon
  String location; //location name for the UI
  String url; // location url for api endpoint
  bool isDaytime= true;

  WorldTime({this.flag,this.location,this.url});


  //make the request
  Future<void> getTime ()async {

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get the properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);


      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);

      isDaytime = now.hour> 6 && now.hour < 18 ?true : false;
    }catch(e) {
      time = 'could not get time data ';
    }
    }
  }

