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

  Future<String> loadToAssets(url, map) async{
    try{
     var response = await http.post(
        Uri.encodeFull(url), 
        
        body: map
        
      );

      return response.body;
    }
    catch (e){
      print(e.toString());  
    }
  }

  Future postToApi(url, map) async {
    try{
        String jsonString = await loadToAssets(url, map);
        final jsonResponse = json.decode(jsonString);
        print(jsonResponse.toString());
        return jsonResponse;
      }

      catch (e){
        print(e.toString());
      }
  }

}