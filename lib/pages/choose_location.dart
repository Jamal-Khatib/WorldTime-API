import 'package:flutter/material.dart';
import 'package:big_project/services/worldTime.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
	    // WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
	    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
	    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
      WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png')
	  ];


    void updateTime(index) async
    {
      WorldTime choice = locations[index] ; 
      await choice.getTime() ; 
      //navigate to home screen 
      Navigator.pop(context,{
      'location': choice.location, 
      'flag' : choice.flag,
      'time' : choice.time,
      'isDayTime': choice.isDayTime 
      } ) ; 
    }

  @override
  Widget build(BuildContext context) {
    print("Build is called")  ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),

      body: ListView.builder(
        itemCount : locations.length,
        itemBuilder: (context,index){
          return(Card(
            child: ListTile(
              onTap: () { 

                 updateTime(index) ; 

                },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${locations[index].flag}") ),
            ),
        
          ));
        }
          ),
      );

        }
  }


