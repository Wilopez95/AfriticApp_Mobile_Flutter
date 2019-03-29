import 'package:flutter/material.dart';
import '../../Components/PrototipoListaPedidos.dart';
import 'package:afriticapp/Screens/Pedidos/data.dart';


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

    RowPedidoBuilder pedidos =new RowPedidoBuilder();

    List<PrototipoListaPedidos> _items = pedidos.listaPedidos.map(
      (pedido) => (PrototipoListaPedidos(text: pedido.text))
    ).toList();



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