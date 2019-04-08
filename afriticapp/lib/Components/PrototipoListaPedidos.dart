import 'package:afriticapp/API_Access/PedidosControlador.dart';
import 'package:afriticapp/Screens/Pedidos/data.dart';
import 'package:flutter/material.dart';

class PrototipoListaPedidos extends StatelessWidget {
  PrototipoListaPedidos({this.pedido});
  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: (MediaQuery.of(context).size.height/10),
      width: (MediaQuery.of(context).size.height/10),
      padding: EdgeInsets.all(5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child:
            InkWell(
              onTap: ()
              {
                var ped = new PedidoContainer();
                ped.pedido = pedido;
                Navigator.pushNamed(context, "/desc_ped");
              },
            child: new Column(
              children: <Widget>[
                new Text(
                "${pedido.Cliente}",
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
                new Text(
                "${pedido.Fecha}",
                style: new TextStyle(
                    color: Colors.black45,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
            ) 
            
          ),
          new IconButton(
            icon: Icon(Icons.edit),
            onPressed: null,
          ),
          new IconButton(
            icon: Icon(Icons.delete),
            onPressed: null,
          ),
        ],
      )
    ));
  }
}