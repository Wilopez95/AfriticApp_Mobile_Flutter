import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:flutter/material.dart';
import 'package:afriticapp/API_Access/Controlador.dart';


class RowProductoBuilder
{
  List<Product> listaPedidos = new List<Product>();
  Controlador c;

  Future<void> cargarDatos() async
  {
    c = new Controlador();
    await c.Inventario();
    listaPedidos = c.ProductosC.Inventario;
  }

  RowProductoBuilder()
  {
    
  }
}
