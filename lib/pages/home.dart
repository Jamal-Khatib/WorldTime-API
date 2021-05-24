import 'package:flutter/material.dart';

class Home extends StatefulWidget {                                
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {} ; 

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ?   data : ModalRoute.of(context).settings.arguments  ; //get data 
    
    //set background 

    String backImage = (data['isDayTime']) ? "day.jpg" : "night.jpg" ; 

    Color backColor = (data['isDayTime']) ? Colors.lightBlue : Colors.black; // hayda l 5at yali fo2 


    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Container( // Add picture as a background should be in a container! 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$backImage"),
              fit: BoxFit.cover,
            ),
          ),
                  child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async  {
                    dynamic result = await Navigator.pushNamed(context, '/location') ; //big await              
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag'], 

                      } ; 
                    });
                  },
                   icon: Icon(
                     Icons.edit_location,
                     color: Colors.white,
                     ), 
                   label: Text(
                     "Edit Location",
                     style: TextStyle(
                       letterSpacing:2,
                       color: Colors.white,
                        ),
                     ) , 
                   ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text
                    (data['location'],
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      color: Colors.white,
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 2,
                       color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
      
  }
}