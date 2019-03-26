import 'package:flutter/material.dart';

class RowPedido
{
  String text;
  RowPedido(this.text);
}

class RowPedidoBuilder
{
  List<RowPedido> listaPedidos = new List<RowPedido>();

  RowPedidoBuilder()
  {
    for (var i = 0; i < 3; i++) {
      listaPedidos.add(
        new RowPedido(
          "lala"
        )
      );
    }
  }
}
