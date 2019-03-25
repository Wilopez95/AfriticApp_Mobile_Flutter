import 'package:flutter/material.dart';
import '../../Components/PrototipoListaProductos.dart';


class Pedidos extends StatefulWidget
{
  const Pedidos ({Key key}):super(key:key);

  @override
  PedidosState createState() => new PedidosState();
}

class PedidosState extends State<Pedidos> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;

    DecorationImage image = new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
            "assets/avatars/avatar-3.jpg",
            )
          );

    AppBar appBar = new AppBar(
      title: Text("AfriticaApp"),
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

    List<PrototipoListaProductos> _items = <PrototipoListaProductos>[
      PrototipoListaProductos(
        text: "Elemento1",
        image: image,
      ),
      PrototipoListaProductos(
        text: "Elemento2",
        image: image,
      )
    ];



    return new Scaffold(
      appBar: appBar,
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: _items.length,
        itemBuilder: (BuildContext context,int index){
          return _items[index%_items.length];
        },
      )
    );
  }
  
}