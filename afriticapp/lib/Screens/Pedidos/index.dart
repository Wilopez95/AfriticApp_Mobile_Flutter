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

  RowPedidoBuilder pedidos =new RowPedidoBuilder();

  List construirLista()
  {
    return pedidos.listaPedidos.map(
      (pedido) => (PrototipoListaPedidos(
        text: pedido.PedidoID.toString(),
        )
      )
    ).toList();
  }

  Widget build(BuildContext context)
  {
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



    return new Scaffold(
      appBar: appBar,
      body: Stack(
        children: <Widget>[
          FutureBuilder(
              future: pedidos.cargarDatos(),
              builder: (_,op) {
                if(op.connectionState == ConnectionState.done)
                {
                  var _items = construirLista();
                  var lista = ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context,int index){
                      return _items[index%_items.length];
                    });
                  return RefreshIndicator(
                    child: lista,
                    onRefresh: (){
                      setState(() {
                        
                      });
                    },
                  );
                }
                else
                {
                  return CircularProgressIndicator();
                }
              },
            )
        ],
      )
    );
  }
  
}