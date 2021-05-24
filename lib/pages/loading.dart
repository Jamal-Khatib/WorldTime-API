import 'package:flutter/material.dart';
import 'package:big_project/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  void setupWorldtime() async
  {
    WorldTime ex = WorldTime(location: 'Berlin',url: "Europe/Berlin", flag: '/'); 
    await ex.getTime() ; 
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': ex.location, 
      'flag' : ex.flag,
      'time' : ex.time,
      'isDayTime': ex.isDayTime
    }) ; 
    //replace loading by home on the stack (pop loading and push home) 
  }
  

  @override
  void initState() {
    super.initState();
    setupWorldtime() ; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
               child: Text(
         "World Time",
         style: TextStyle(
           fontSize: 60,
           color: Colors.black,
           fontWeight: FontWeight.bold,
         ),
               ),
             ),
         SizedBox(height: 40),
             
            Center(
          child: SpinKitHourGlass(
            color: Colors.white,
            size: 100,
          ),
       )  ,
       SizedBox(height:10),
       Text(
         "Loading...",
         style: TextStyle(
           fontSize: 40,
           color: Colors.black
           
         ),
       ) ] 

     ),
      
     
  );
  }
}

