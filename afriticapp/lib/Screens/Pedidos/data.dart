import 'package:flutter/material.dart';

class RowPedido
{
  String text;
  DecorationImage image;
  RowPedido(this.text,this.image);
}

class RowPedidoBuilder
{
  List<RowPedido> listaPedidos = new List<RowPedido>();

  RowPedidoBuilder()
  {
    for (var i = 0; i < 3; i++) {
      listaPedidos.add(
        new RowPedido(
          "lala",
          DecorationImage(
            image: AssetImage("assets/avatars/avatar-"+(i+1).toString()+".jpg")
          ))
      );
    }
  }
}
