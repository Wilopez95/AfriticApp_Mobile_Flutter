import 'package:afriticapp/API_Access/PedidosControlador.dart';
import 'package:flutter/material.dart';
import 'package:afriticapp/API_Access/Controlador.dart';

class RowPedidoBuilder
{
  List<Pedido> listaPedidos = new List<Pedido>();
  Controlador c;

  Future<void> cargarDatos() async
  {
    c = new Controlador();
    await c.Pedidos();
    listaPedidos = c.PedidosC.ListaPedidos;
  }

  RowPedidoBuilder()
  {
    
  }
}
