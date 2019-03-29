import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AccesoApi{

  Future<String> loadFromAssets(url) async {
      var response = await http.get(
        //Encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Accept": "application/json"}
      );
      return response.body;
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

  Future postToApi() async {
    try{
      http.post(
        Uri.encodeFull("https://afriticapp.herokuapp.com/Productos/Registrar/"), 
        
        body:{

        "Nombre": "Collar",
        "Descripcion": "colls voos colasr",
        "Img_url": "http:// imagenlinda.com",
        "Tipo_Producto": "CO",
        "Precio": "2000",
        "Cantidad": "30"


        }
        
      ).then(
            (response){
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}");
            }
          );
    }
    catch (e){
      print(e.toString());  
    }

  }

}