
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState () => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;

   String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';


    return Scaffold(
      body: SafeArea(

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/'+bgImage),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: <Widget> [
                  FlatButton.icon(
                      onPressed:() async{
                       dynamic result=  await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'time' : result['time'],
                           'location' : result['location'],
                           'flag' : result ['flag'],
                           'isDaytime' : result['isDaytime']
                         };
                       });
                      },
                      icon:Icon(Icons.edit_location),
                      label: Text('Edit Location'),
                    color: Colors.grey,

                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 2,
                        color: Colors.grey

                      ),
                  ),


                    ],
                  ),

                  SizedBox(height: 20.0),
                  Text(data['time'],
                    style: TextStyle(
                        fontSize: 80,
                        letterSpacing: 2,
                        color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
