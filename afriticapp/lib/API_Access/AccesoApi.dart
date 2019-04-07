import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AccesoApi{

  Future<String> loadFromAssets(url) async {
      try{
        var response = await http.get(
          //Encode the url
          Uri.encodeFull(url),
          //only accept json response
          headers: {"Accept": "application/json"}
        );

        return response.body;
      }

      catch(e){
        print(e.toString());
      }
  }

  Future getFromApi(url) async {
      try{
        String jsonString = await loadFromAssets(url);
        final jsonResponse = json.decode(jsonString);
        return jsonResponse;
      }

      catch (e){
        print(e.toString());
      }
  }

  Future loadToAssets(url, map) async{
    try{
     var response = await http.post(
        Uri.encodeFull(url), 
        
        body: json.encode(map),
        headers:{
          'Content-type' : 'application/json', 
          "Accept": "application/json"}
        
      );

      return response;
    }
    catch (e){
      print(e.toString());  
    }
  }

  Future postToApi(url, map) async {
    try{
        http.Response response = await loadToAssets(url, map);
        if(response.statusCode >= 200 && response.statusCode < 300 )
        {
          String jsonString = response.body;
          final jsonResponse = json.decode(jsonString);
          return jsonResponse;
        }
        else
        {
          print(response.body);
          return response.statusCode;
        }
        
      }

      catch (e){
        print(e.toString());
      }
  }

}