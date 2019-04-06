import 'package:flutter/material.dart';
import 'package:afriticapp/Screens/Pedidos/data.dart';


class Estadisticas extends StatefulWidget
{
  const Estadisticas ({Key key}):super(key:key);

  @override
  EstadisticasState createState() => new EstadisticasState();
}

class EstadisticasState extends State<Estadisticas> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;



    AppBar appBar = new AppBar(
      title: Text("Estadisticas"),
      actions: <Widget>[
        IconButton(
          onPressed: () {

          },
          icon: new Icon(Icons.search),
          alignment: AlignmentDirectional.centerEnd,
        ),
        IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.menu),
        )
      ],
    );



    return new Scaffold(
      appBar: appBar,
      /*body: ListView.builder(
       padding: EdgeInsets.all(5),
        itemCount: _items.length,
        itemBuilder: (BuildContext context,int index){
          return _items[index%_items.length];
        },
      )*/
    );
  }
  
}