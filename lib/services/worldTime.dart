import 'package:http/http.dart'; //To Receive Json objects 
import 'dart:convert'; //allows us to convert JSon to data we can work with 
import 'package:intl/intl.dart'; //to format date 



class WorldTime{


  String location ; //location name for the UI
  String time  ; //time in that location 
  String flag ; //url to an asset flag icon 
  String url ; //location url for API endpoint 
  bool isDayTime; //true or false ( day or night)

  WorldTime({this.location,this.flag,this.url}) ; 

  Future<void> getTime() async 
  {
    try
    {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url') ;  
    Map data = jsonDecode(response.body) ; // we only need datetime and utc_offset
    
    //get properties from data 
    String datetime = data['datetime'] ; 
    String utcOffset = data['utc_offset'] ; 

    //convert datetime to DateTime object 
    DateTime now = DateTime.parse(datetime) ; 

    //convert utc_offset to simple offset without the + 
    String offset = utcOffset.substring(1,3) ; 

    //convert offset to integer
    int off = int.parse(offset) ; 

    //Get the actual time (reassign it because it's immutable)
    now = now.add(Duration(hours: off)) ; 
    
    //set the isDayTime 
    isDayTime = (now.hour>6 && now.hour<20) ? true : false ;  // between 6 AM and 8 PM 

    //set the time field 
    time = DateFormat.jm().format(now) ; 

   

    }

    catch(e)
    {
      print("There is an error: $e") ; 
      time = "Couldn't get the time" ; 
    }


  }

}