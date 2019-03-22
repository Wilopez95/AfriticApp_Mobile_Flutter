import 'package:flutter/material.dart';

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

    return new Scaffold(
      body: Column(
        children: <Widget>[
          new Container(
            height: screenSize.height,
            width: screenSize.width,
            color: Color.fromARGB(255, 255, 0, 0),
          )
        ],
      ),
    );
  }
  
}