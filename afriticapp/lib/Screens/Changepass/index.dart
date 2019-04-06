import 'package:flutter/material.dart';
import 'package:afriticapp/Screens/Pedidos/data.dart';


class Changepass extends StatefulWidget
{
  const Changepass ({Key key}):super(key:key);

  @override
  ChangepassState createState() => new ChangepassState();
}

class ChangepassState extends State<Changepass> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;



    AppBar appBar = new AppBar(
      title: Text("Cambiar contraseña"),
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