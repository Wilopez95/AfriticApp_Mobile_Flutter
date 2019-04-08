import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:flutter/material.dart';
import 'InputNumFields.dart';
import '../Screens/AgregarPedido/index.dart';

class PrototipoProdPedido extends StatelessWidget {
  PrototipoProdPedido({this.prod, this.cant});
  final prod,cant;

  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: (MediaQuery.of(context).size.height/10),
      width: (MediaQuery.of(context).size.height/10),
      padding: EdgeInsets.all(5),
      child: Text("${prod.toString()} -> ${cant.toString()} unidades") 
      ));
  }
}